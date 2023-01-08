// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract EcommerceStore {
    //tolocate product
    uint public productIndex;

    //from address we find prodict index and product details
    //for finding details of the product
    mapping(address => mapping(uint => Product)) stores;

    //the product belongs to which vendor
    mapping(uint => address) productIdInStore;

    enum Product_Status {
        Open,
        Sold,
        Unsold
    }
    enum Product_Condition {
        New,
        Used
    }

    struct Product {
        uint id;
        string name;
        string category;
        string imageLink;
        string descLink;
        uint auctionStartTime;
        uint auctionEndTime;
        uint startPrice;
        address highestBidder;
        uint highestBid;
        uint secondHighestBid;
        uint totalBids;
        Product_Status status;
        Product_Condition condition;
        mapping(address => mapping(bytes32 => Bid)) bids;
        //storing bids for each product
        //The key is the address of the bidder and value is the mapping of the hashed bid
        //String to the bid
        // product id finds to [bidder_address] to save the [bid]
    }

    struct Bid {
        address bidder;
        uint productld;
        uint value;
        bool revealed;
    }

    constructor() {
        productIndex = 0;
    }

    function addProductToStore(
        string memory _name,
        string memory _category,
        string memory _imageLink,
        string memory _descLink,
        uint _auctionStartTime,
        uint _auctionEndTime,
        uint _startPrice,
        uint _productCondition
    ) public {
        //vendor of product must give valid time start and end
        require(_auctionStartTime < _auctionEndTime);

        //product iddentified by index in contract
        productIndex += 1;

        //As in memory nested mapping IS NOT POPSSIBLE
        //SO IN REVERSE ITS POSSIBLE TO DO FOR STORAGE MODE
        Product storage product = stores[msg.sender][productIndex];

        //ASSignment of values
        product.id = productIndex;
        product.name = _name;
        product.category = _category;
        product.imageLink = _imageLink;
        product.descLink = _descLink;
        product.auctionStartTime = _auctionStartTime;
        product.auctionEndTime = _auctionEndTime;
        product.startPrice = _startPrice;
        product.highestBidder = address(0);
        product.highestBid = uint(0);
        product.secondHighestBid = uint(0);
        product.totalBids = uint(0);
        product.status = Product_Status.Open;
        product.condition = Product_Condition(uint(_productCondition));

        // Product memory product = new Product();
        //  (product.productIndex, _name, _category, _imageLink, _descLink, _auctionStartTime,
        // _auctionEndTime,_startPrice, address(0) , uint(0), uint(0), uint(0), Product_Status.Open,
        // Product_Condition(uint(_productCondition)));

        productIdInStore[productIndex] = msg.sender;
    }

    function getProduct(
        uint _productId
    )
        public
        view
        returns (
            uint,
            string memory,
            string memory,
            string memory,
            string memory,
            uint,
            uint,
            uint,
            Product_Status,
            Product_Condition
        )
    {
        Product storage product = stores[productIdInStore[_productId]][
            _productId
        ];

        return (
            product.id,
            product.name,
            product.category,
            product.imageLink,
            product.descLink,
            product.auctionStartTime,
            product.auctionEndTime,
            product.startPrice,
            product.status,
            product.condition
        );
    }

    //HASHED VALUE OF BID IS RECIEVED IN _BID ,ENCRYPTED BID AS OPEN AUCTION
    function bid(bytes32 _bid, uint _productld) public payable returns (bool) {
        //fetching the product with storage reference
        Product storage product = stores[productIdInStore[_productld]][
            _productld
        ];

        //time greater than start and less than end time of aution
        require(block.timestamp >= product.auctionStartTime);
        require(block.timestamp <= product.auctionEndTime);

        //bid price placed by bidder should be greater than min set by the vendor
        require(msg.value > product.startPrice);

        //mapping (address => mapping (bytes32 => Bid )) bids;
        //The key is the address of the bidder and value is the mapping of the hashed bid
        //String to the bid STRUCT
        //cCHECK WHTHER THE BIDDER THAT HAS SENT A BID HAS BEFORE BIDDED OR NOT
        require(product.bids[msg.sender][_bid].bidder == address(0));

        //NOT A PREVIOUS BIDDER THEN CREATE A NEW BID
        product.bids[msg.sender][_bid] = Bid(
            msg.sender,
            _productld,
            msg.value,
            false
        );
        product.totalBids += 1;

        return true;
    }

    function revealBid(
        uint _productId,
        string memory _amount,
        string memory _secretstring
    ) public {
        //POINTER TO PRODUCT IN STORAGE
        //struct is returned
        Product storage product = stores[productIdInStore[_productId]][
            _productId
        ];

        //REVEAL BIDS AFTER AUCTION HAS AUCTION TIME HAS ENDED
        require(block.timestamp > product.auctionEndTime);

        //CALCULATING SHA3 OF THAT BIT USING AMOUNT

        bytes32 sealedBid = keccak256(abi.encodePacked(_amount, _secretstring));

        //TEMPORARY USE OF BID
        // mapping (address => mapping (bytes32 => Bid )) bids;
        Bid memory bidinfo = product.bids[msg.sender][sealedBid];
        require(bidinfo.bidder > address(0));
        require(bidinfo.revealed == false);
        uint refund;
        uint amount = stringToUint(_amount);

        if (bidinfo.value < amount) {
            // They didn't send enough amount, they lost
            //amount set to bid is great than ether sent to the payable function
            //not  enough ether sent
            refund = bidinfo.value;
        } else {
            // If first to reveal set as highest bidder
            if (address(product.highestBidder) == address(0)) {
                //whoever calls this fucntion will have highest bid
                product.highestBidder = msg.sender;
                product.highestBid = amount;

                //second highest will be product price
                //the highest auctioner pays the the second highest value
                product.secondHighestBid = product.startPrice;
                refund = bidinfo.value - amount;
            } else {
                if (amount > product.highestBid) {
                    //ifsomeone else calls with highestBid
                    //highest bid will become second highestBid
                    product.secondHighestBid = product.highestBid;
                    payable(product.highestBidder).transfer(product.highestBid);
                    product.highestBidder = msg.sender;
                    product.highestBid = amount;
                    refund = bidinfo.value - amount;
                } else if (amount > product.secondHighestBid) {
                    //if the amount is just higher than second bid
                    //20 $ 15$ 10$
                    //hence sedond highest bidder is not the winner
                    product.secondHighestBid = amount;
                    refund = amount;
                } else {
                    refund = amount;
                }
            }
        }
        //SET REVEALED BID TO TRUE
        product.bids[msg.sender][sealedBid].revealed = true;
        if (refund > 0) {
            payable(msg.sender).transfer(refund);
        }
        //FUNCTION WILL BE CALLED BY THE BIDDER
    }

    function highestBidderInfo(
        uint _productId
    ) public view returns (address, uint, uint) {
        // mapping (address => mapping(uint => Product)) stores;
        //the product belongs to which vendor
        //mapping (uint => address) productIdInStore;
        Product storage product = stores[productIdInStore[_productId]][
            _productId
        ];
        return (
            product.highestBidder,
            product.highestBid,
            product.secondHighestBid
        );
    }

    function totalBids(uint _productId) public view returns (uint) {
        Product storage product = stores[productIdInStore[_productId]][
            _productId
        ];
        return product.totalBids;
    }

    function stringToUint(string memory s) private pure returns (uint) {
        bytes memory b = bytes(s);
        uint result = 0;
        for (uint i = 0; i < b.length; i++) {
            if (toUint256(b[i]) >= uint(48) && toUint256(b[i]) <= 57) {
                result = result * 10 + (toUint256(b[i]) - 48);
            }
        }
        return result;
    }

    function toUint256(bytes1 _bytes) internal pure returns (uint256 value) {
        assembly {
            value := mload(add(_bytes, 0x20))
        }
    }
}

//block.timestamp (uint): current block timestamp as seconds since unix epoch
//https://ethereum.stackexchange.com/questions/11770/what-is-the-difference-between-bytes-and-bytes32/11771
//From <https://ethereum.stackexchange.com/questions/11770/what-is-the-difference-between-bytes-and-bytes32/11771>
//https://jeancvllr.medium.com/solidity-tutorial-all-about-bytes-9d88fdb22676
// /https://stackoverflow.com/questions/47129173/how-to-convert-uint-to-string-in-solidity

//block.timestamp (uint): current block timestamp as seconds since unix epoch
//https://ethereum.stackexchange.com/questions/11770/what-is-the-difference-between-bytes-and-bytes32/11771
//From <https://ethereum.stackexchange.com/questions/11770/what-is-the-difference-between-bytes-and-bytes32/11771>
//https://jeancvllr.medium.com/solidity-tutorial-all-about-bytes-9d88fdb22676
// /https://stackoverflow.com/questions/47129173/how-to-convert-uint-to-string-in-solidity

//----------------------------------------------------------------
//https://www.geeksforgeeks.org/storage-vs-memory-in-solidity/
//https://ethereum.stackexchange.com/questions/87451/solidity-error-struct-containing-a-nested-mapping-cannot-be-constructed

// truffle migrate --reset
// truffle console
// truffle(development)>|| amt_1 = web3.toWei(1, 'ether'); => '1000000000000000000' //create a vaiable eqaul to one wei
// amt_1 = web3.utils.toWei('1','ether');

// truffle(development)>|| current_time = Math.round(new Date() / 1000);//current epoch


// truffle(development)>|| EcommerceStore.deployed().then(function(instance) { obj = instance })


// truffle(development)>|| 
// obj.addProductToStore('iphone 6', 'Cell Phones & Accessories', 'imagelink', 'desclink', current_time,current_time + 200, amt_1, 0).then(function(f){console.log(f)});




// truffle(development)>|| obj.getProduct.call(1).then(function(f) {console.log(JSON.stringify(f))})

// truffle(development)>|| Eutil = require('ethereumjs-util');


// web3.utils.keccak256(string)

// truffle(development)>|| sealedBid = '0x' + Eutil.keccak256((2 * amt_1) + 'mysecretacc1').toString('hex');


// truffle(development)>|| obj.bid(1, sealedBid, {value: 3*amt_1, from: web3.eth.accounts[1]}).then(function(f) {console.log(f)});
// truffle(development)>|| obj.bid(1, sealedBid, {value: 3*amt_1, from: web3.eth.accounts[1]}).then(function(f) {console.log(JSON.stringify(f))});



// truffle(development)>|| sealedBid = 'Ox' + Eutil.sha3((3 * amt_1) + 'mysecretacc2').toString('hex');
// truffle(development)>|| obj.bid(1, sealedBid, {value: 4*amt_1, from: web3.eth.accounts[2]}).then(function(f) {console.log(f)});
// truffle(development)>|| web3.eth.getBalance(web3.eth.accounts[1])
// truffle(development)>|| web3.eth.getBalance(web3.eth.accounts[2])
// truffle(development)>|| obj.revealBid(1, (2*amt_1).toString(), 'mysecretacc1', {from: web3.eth.accounts[1]}).then(function(f)
// {console.log(f)})
// truffle(development)> obj.revealBid(1, (3*amt_1).toString(), 'mysecretacc2', {from: web3.eth, accounts[2]}).then(function(f)
// {console.log(f)})
// truffle(development)> obj.highestBidderinfo.call(1).then(function(f) {console.log(f)})

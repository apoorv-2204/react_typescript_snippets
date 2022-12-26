// SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

contract IETCoin {
    //  uint  iEtCoin;
    address public invoker;
    //whopever called this method
    //it will be the deployer of the contract

    //setting amount for our tokens
    //values are always defined in wei,or ether
    //we always write datatype first 50wei

    uint public constant PRICE = 500;

    //reciever must have aan address
    //and some amount/0
    //mappng isjust like a hashmap
    //, either key value pair
    mapping(address => uint) public account_holder_its_balance;

    constructor() {
        //invoked by caller of this method
        //i.e only ,ran once whoever is deploying the contract
        invoker = msg.sender;
    }

    function createCoin() public payable {
        // v2
        //payble means wihtout sedning ether we cant
        // call this method ether or money  is send to here
        //adding validation whoever is calling thhis
        // must hace sent ether in value
        //for buying tokens by sending ether tothis function
        //send ether to call this method
        //msg is global value some calling this mustr
        // send some value to it

        require(msg.value > 0 && msg.value % PRICE == 0);

        account_holder_its_balance[msg.sender] += (msg.value / PRICE);

        // v1
        //if the caller is not invoker of this contract
        //throw
        // else calls this function

        /*if(msg.sender!=invoker) { 
            //it costs gas ,its expensive
            //to revert the world state
                revert();
        }
        else if(amount>0 && amount<=100){
            
         account_holder_its_balance[_reciever]=amount;   
        }   //only the deployer of contract coins
        else{
            revert();
        }
        */
    }

    function transfer(address _reciever, uint amount) public {
        //only invoker or contract deployer can createCoin
        //Only the the invoker/creator/deployer can transfer funds

        if (amount <= account_holder_its_balance[msg.sender] && amount > 0) {
            account_holder_its_balance[msg.sender] -= amount;
            account_holder_its_balance[_reciever] += amount;
        } else {
            revert();
        }
    }
}

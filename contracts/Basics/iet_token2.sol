// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract IETToken {
    //mycollege named token
    //------------------------------------------------------------------------------------------------
    string private constant MytokenName =
        "institute of Engineering & Technology, DAVV,";
    string private constant MytokenSymbol = "iet";
    uint8 private constant decimal = 18;
    uint private constant _totalSupply = 1000;
    //------------------------------------------------------------------------------------------------
    /* MUST trigger when tokens are transferred, including zero value transfers.
     *A token contract which creates new tokens SHOULD trigger a Transfer event with the
     *_from address set to 0x0 when tokens are created.
     */
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event zeroValue(string message);

    /*Approval*/
    /* MUST trigger on any successful call to approve(address _spender, uint256 _value).*/
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    //------------------------------------------------------------------------------------------------
    mapping(address => uint) balance;
    //owner will allow its delegate to spend ihis or her token
    mapping(address => mapping(address => uint)) allowed;

    //------------------------------------------------------------------------------------------------
    constructor() {
        //whoever deply this contract will get the
        //total supply or the creator

        balance[msg.sender] = _totalSupply;
    }

    //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4     transfered
    //0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2     460
    //0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB     delegate allowed to spend 251 out of 540 owner
    //0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
    //------------------------------------------------------------------------------------------------

    function name() public pure returns (string memory) {
        /*
         *    Returns the name of the token - e.g. "MyToken".
         *   and other contracts MUST NOT expect these values to be present.
         *    OPTIONAL - This method can be used to improve usability, but interfaces
         */
        return MytokenName;
    }

    //------------------------------------------------------------------------------------------------

    function symbol() public pure returns (string memory) {
        /* Returns the symbol of the token. E.g. “HIX”. symbol
             OPTIONAL - This method can be used to improve usability,
             but interfaces and other contracts MUST NOT expect these values to be present.
          */
        return MytokenSymbol;
    }

    //------------------------------------------------------------------------------------------------

    function decimals() public pure returns (uint8) {
        /*Returns the number of decimals the token uses - e.g. 
                8, means to divide the token amount by 100000000 to get
                its user representation.OPTIONAL - This method can be used 
                to improve usability, but interfaces and other
                contracts MUST NOT expect these values to be present.
                used for determing denomination of the token like ether has 17 18 wei
                */
        return decimal;
    }

    //------------------------------------------------------------------------------------------------

    function totalSupply() public pure returns (uint256) {
        //Returns the total token supply.
        return _totalSupply;
    }

    //------------------------------------------------------------------------------------------------
    function balanceOf(address _owner) public view returns (uint256) {
        //Returns the account balance of another account with address _owner.
        //returns the balance who calls this method

        return balance[_owner];
    }

    //------------------------------------------------------------------------------------------------

    function transfer(
        address _toreciever,
        uint256 _tokenvalue
    ) public returns (bool success) {
        // MUST trigger when tokens are transferred, including zero value transfers.
        //A token contract which creates new tokens SHOULD trigger a Transfer event
        //with the _from address set to 0x0 when tokens are created

        /*Transfers _value amount of tokens to address _to, and MUST fire the Transfer event.
        The function SHOULD throw if the message caller’s account balance does not have enough
        tokens to spend.Note Transfers of 0 values MUST be treated as normal transfers and
        fire the Transfer event*/
        if (_tokenvalue == 0) {
            emit zeroValue("zero is not transfferable ");
        }
        require(balance[msg.sender] >= _tokenvalue && _tokenvalue > 0); //throw;
        balance[msg.sender] = balance[msg.sender] - (_tokenvalue);
        balance[_toreciever] = balance[_toreciever] + (_tokenvalue);

        emit Transfer(msg.sender, _toreciever, _tokenvalue);

        return true;
        //safe math libaray add and sub
    }

    //------------------------------------------------------------------------------------------------

    function transferFrom(
        address _from,
        address _to,
        uint256 _valuetoken
    ) public returns (bool) {
        //Transfers _value amount of tokens from address _from to address _to, and MUST fire the Transfer
        //event.//The transferFrom method is used for a withdraw workflow, allowing contracts to transfer
        //tokens on your behalf. This can be used for example to allow a contract to transfer tokens on
        //your behalf and/or to charge fees in sub-currencies.     //The function SHOULD throw unless the
        //_from account has deliberately authorized the sender of the message via some mechanism.

        //Note Transfers of 0 values MUST be treated as normal transfers and fire the Transfer event
        //when a delegate is tranfesrring the coin, he will call transfer from ,
        //while when creator just want to transfer coin on our own we can call transfer\\
        //delegate will transfer the coin and sender has assigned this delegate

        require(_valuetoken > 0 && balance[_from] >= _valuetoken);

        balance[_from] = balance[_from] - (_valuetoken);
        //delegate is the one who is goinh to transfer the coin
        //person who has assigne this delegate
        //delegate will call this method
        //delegates can spend tokens from owner balance

        //delegate transfer the coin and not the msg,sender
        //msg.sender is the one who hass assigned this delgate

        //delgate spend token from token owner balacne sending by delegate
        balance[_from] -= _valuetoken;

        allowed[_from][msg.sender] = allowed[_from][msg.sender] - _valuetoken;

        balance[_to] = balance[_to] + (_valuetoken);

        emit Transfer(_from, _to, _valuetoken);
        return true;
    }

    //------------------------------------------------------------------------------------------------

    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {
        /* Allows _spender to withdraw from your account multiple times, up to the
            _value amount. If this function is called again it overwrites the current 
            allowance with _value. 
            
        NOTE: To prevent attack vectors like the one described here and discussed here,
        clients SHOULD make sure to create user interfaces in such a way that they set 
        the allowance first to 0 before setting it to another value for the same spender.
        THOUGH The contract itself shouldn’t enforce it, to allow backwards compatibility
        with contracts deployed before*/

        //call allowace aloow some to spending tokens

        allowed[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        //who has given the auhtority to trasnsfer

        return true;
    }

    //------------------------------------------------------------------------------------------------
    function allowance(
        address _tokenowner,
        address _tokenspender
    ) public view returns (uint256) {
        //Returns the amount which _spender is still allowed to withdraw from _owner.
        //we can give our token to some one to else ,to him to _spend
        //how mouch owner has allowed delgate to spend ,<= return
        return allowed[_tokenowner][_tokenspender];
    }

    //------------------------------------------------------------------------------------------------
}

//https://eips.ethereum.org/EIPS/eip-20#events
//https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/edit
//https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
/*The ERC-20 (Ethereum Request for Comments 20), proposed by Fabian Vogelsteller in November 2015,
is a Token Standard that implements an API for tokens within Smart Contracts.*/

//If we deplioythis erc20 token : issue we will face:
// no one has right now ,no payable keyword
//people dont know,the have to know about this and we have recivev wether
//no crowdfunding
//real ether we will give them tokens
//
//shows delegate and Transfer
//for trasnfer we will create constructor to deploy
//
//
//
//
//

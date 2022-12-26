// SPDX-License-Identifier: MIT
pragma solidity 0.8.3;

//https://blog.soliditylang.org/2020/03/26/fallback-receive-split/

contract reciever {
    address internal implementation; //use this and give value then transact

    //we need to have bothfucntion for working contract payment
    fallback() external payable {}

    receive() external payable {
        //only callable if ether is sent by thwe caller
        //function callable by only paying something
    }

    function getBalance() public view returns (uint) {
        //balance is always uint
        //this means this contract
        //address this means address of this contract
        //balance of this contract with address
        return address(this).balance;
    }
}

//-----------------------------------------------------------------------

contract sender {
    //to transfer ether to a contract we have to create a instance of that contract here
    //we send ether to other contrtact useing recieve or fallback
    reciever private _reciever_instance;
    address payable i;

    constructor() {
        _reciever_instance = new reciever();

        i = payable(address(_reciever_instance));
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getBalanceofInstance() public view returns (uint) {
        return address(_reciever_instance).balance;
    }

    fallback() external payable {}

    receive() external payable {
        //only callable if ether is sent by thwe caller
        //function callable by only paying something
        i.transfer(msg.value); //typep castingwas require
    }
}

//callback function is anonymous function
//or whose name is passeed to be called later
//That function is called the "fallback" function. It is the function that is invoked when a transaction with no data
/*field is made to a contract.Notice that there is no "payable" modifier on that contract. When you label a
function as "payable" it is a function that invokable with a non-zeroEther value in the "value" field of
the transaction.The reason for that empty fallback function is to say, if someone tries to send Ether to 
this contract, don't accept it, and throw an exception.*/

/*external
External functions are part of the contract interface, which means they can be called 
from other contracts and via transactions. An external function f cannot be called 
internally (i.e. f() does not work, but this.f() works). External functions are sometimes
more efficient when they receive large arrays of data, because the data is not copied 
from calldata to memory.*/

/*public
Public functions are part of the contract interface and can be either called internally
or via messages. 
For public state variables, an automatic getter function (see below) is generated.
internal
Those functions and state variables can only be accessed internally (i.e. from within the current 
contract or contracts deriving from it), without using this.
private
Private functions and state variables are only visible for the contract they are defined 
in and not in derived contracts.*/

/*
state variables are always in storage
function arguments are in memory by default
local variables of struct, array or mapping type reference storage by default
local variables of value type (i.e. neither array, nor struct nor mapping) are stored in the stack*/

//https://blog.soliditylang.org/2020/03/26/fallback-receive-split/

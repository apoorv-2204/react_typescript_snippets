// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

//view function declares that no state will be changed
//pure function declares no state will be changed or read

contract ViewPure{

    //internal
    uint x=1;

    function addX(uint y) public view returns(uint){

        //we are able to read the value of x
        uint c=x+y;
        return c;
    }

    function AddX(uint i,uint j) public pure returns(uint){
        uint d=i+j;
        return d;
    }
}

//deploy using 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4- this account stores byte code of contract
//call the function using 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
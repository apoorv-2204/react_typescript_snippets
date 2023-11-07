// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract IfElse{
    function condition(uint x) public pure returns(uint){
        if(x>10){
            return 0;
        }
        else if(x<10){
            return 1;
        }
        else{
            return 2;
        }
    }
}

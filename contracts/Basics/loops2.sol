//SPDX-License-Identifier:MIT
pragma solidity ^0.8.6;

contract forLoop{
    uint[] data;

    function forLoopFunc() public returns(uint[] memory){
        for(uint i=0;i<15;i++){
            data.push(i);
        }
        return data;
    }
}
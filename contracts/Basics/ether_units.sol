// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;


contract EtherUnits{

//wei keyword is used for Ether units
    uint public OneWei= 1 wei;
    bool public isOneWei= 1 wei ==10;

    uint public oneEther= 0.003 ether;
    //divided in 2 parts
    //first part- evaluate the expression on right side
    //second part- assign the evaluated expression to ther variable
    bool public isOneEther = 1 ether== 1;
   
}
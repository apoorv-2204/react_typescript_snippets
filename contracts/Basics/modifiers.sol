// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract sl5test {
    uint private constant x = 88;

    uint private statevariable;

    function stateFunction() public returns (uint) {
        statevariable = 100;
        return statevariable;
    }

    function pureView() public pure returns (uint) {
        return x;
    }

    function viewView() public view returns (uint) {
        //retruns
        return statevariable;
        //return//vieew can alllow reading of rt data
    }
}
/*
    StateModifier : constant view pure 
    This all are state modifer or which can change the blockchange
constant is deprecated and view has replaced it view only reads data from blockchain.keywoprd make sure that function not alter storage state in any way or wont write anything to bc
    pure more restrictive compared to view as it make sure that function  wont even read the storage state
pure can only read that storage data which is assigned before run time
*/

//view is used to read balue from blockchain and it doesnot cause any
//cost gas,not gas cost

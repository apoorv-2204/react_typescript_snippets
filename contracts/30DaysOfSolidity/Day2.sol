// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Function {
    uint256 public stateVariable;

    constructor() {
        stateVariable = 10;
    }

    function returnStateVariable() public view returns (uint256) {
        return stateVariable;
    }

    function returnLocalVariable() public pure returns (uint256) {
        uint256 localVaraiable = 20;
        return localVaraiable;
    }
}

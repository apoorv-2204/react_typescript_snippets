// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract FunctionArgument {
    // defaults to zero
    uint256 internal stateVar;

    function set(uint256 _stateVar) public {
        stateVar = _stateVar;
    }

    function get() public view returns (uint256) {
        return stateVar;
    }
}

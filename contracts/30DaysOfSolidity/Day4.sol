// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract day4 {
    function evaluate(int256 _a, int256 _b) public pure returns (int256) {
        return (_a + _b) - (_a - _b);
    }
}

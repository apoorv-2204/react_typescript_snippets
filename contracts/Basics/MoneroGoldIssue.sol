// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
pragma solidity ^0.8.6;

//they were able to create extra tokens
contract moneroGoldscam {
    uint public totalsuppkl;

    function settotal() public {
        totalsuppkl = 5;
    }

    function minustotal() public {
        totalsuppkl -= 1;
    }
}
// to avoid we use sae math library just google it
//we dont neeed it in 0.8

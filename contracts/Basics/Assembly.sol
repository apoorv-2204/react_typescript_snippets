// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

contract _Assembly {
    event display(uint8);

    function solidityLoop() public {
        for (uint i = 0; i < 10; i++) {
            emit display(uint8(i));
        }
    }

    function assemblyLoop() public {
        assembly {
            let i := 0

        loop:
            i := add(i, 1)
            jump(loop, lt(i, 1))
            //label condition lssthan
        }
    }
}

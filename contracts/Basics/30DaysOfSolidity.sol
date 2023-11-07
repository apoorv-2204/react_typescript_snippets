// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Day13 {
    function reverseDigit(uint256 n) public pure returns (uint256) {
        uint256 reverse = 0;
        uint256 temp = n;
        while (temp != 0) {
            reverse = (reverse * 10) + (temp % 10);
            
            temp = temp / 10;
        }
        return reverse;
    }
}

contract Day12 {
    function palindrome(uint256 n) public pure returns (uint256) {
        uint256 reverse = 0;
        uint256 temp = n;
        while (temp != 0) {
            reverse = (reverse * 10) + (temp % 10);
            temp = temp / 10;
        }
        if (reverse == n) return 1;
        else return 0;
    }
}

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

contract Day3 {
    // defaults to zero
    uint256 internal stateVar;

    function set(uint256 _stateVar) public {
        stateVar = _stateVar;
    }

    function get() public view returns (uint256) {
        return stateVar;
    }
}

contract Day4 {
    function evaluate(int256 _a, int256 _b) public pure returns (int256) {
        return (_a + _b) - (_a - _b);
    }
}

contract Day5 {
    function find(int256 a) public pure returns (int256) {
        return a % 3;
    }
}

contract Day6 {
    //Solidity does not support floating point values there are many reasons but the most important is that solidity deals
    //with real money and as we all know while division we lose some minor point values when we convert the value back to an
    //1integer due to that solidity does not support it.
    function average(uint a, uint b, uint c) public pure returns (uint avg) {
        avg = (a + b + c) / 3;
        return avg;
    }
}

// its sunday, so i'm not going to do anything today

contract Day8 {
    function digitSum(uint n) public pure returns (uint) {
        if (n / 10 == 0) {
            return n;
        } else {
            uint temp = n % 10;
            return temp + digitSum(n / 10);
        }
    }
}

contract Day9 {
    function nthTerm(
        uint n,
        uint a,
        uint b,
        uint c
    ) public pure returns (uint) {
        if (n == 1) return a;
        if (n == 2) return b;
        if (n == 3) return c;

        uint i = 4;
        uint next = 0;
        for (; i <= n; i++) {
            next = a + b + c;
            a = b;
            b = c;
            c = next;
        }
        return next;
    }
}

contract Day10 {
    function prime(uint256 n) public pure returns (uint256) {
        if (n == 0) return 0;
        if (n == 1) return 1;
        if (n == 2) return 1;
        uint256 i = 2;
        for (; i * i <= n; i++) {
            if (n % i == 0) return 0;
        }
        return 1;
    }
}

contract Day11 {
    function power(uint256 x, uint256 p) public pure returns (uint256) {
        uint256 ans = 1;

        while (p > 0) {
            // last bit is one mul else not
            if ((p & 1) != 0) {
                ans = ans * x;
            }
            x = x * x;
            p = p >> 1;
        }
        return ans;
    }
}

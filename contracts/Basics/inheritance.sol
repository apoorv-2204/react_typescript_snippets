// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract AZ {
    uint public num;

    constructor() {
        num = 10;
    }

    modifier check(uint _num2) {
        if (_num2 >= 5) {
            _;
        }
    }

    function update(uint _num) public check(_num) {
        num = num + _num;
    }
}

pragma solidity ^0.8.3;

contract Account {
    mapping(address => uint) balance;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function addBalance(uint amt) public {
        //
        //
        require(msg.sender == owner, "Stay in your limit");

        uint a = 4;
        uint b = 5;
        uint c = a + b;

        assert(c == 9);

        balance[msg.sender] += amt + c;
    }

    function getBalance() public view returns (uint) {
        return balance[msg.sender];
    }

    function transfer(address to, uint amount) public {
        // if(balance[msg.sender] < amount)
        //     revert("You dont have enough balance");

        require(balance[msg.sender] > amount, "Insuffienct Balance");

        balance[msg.sender] -= amount;
        balance[to] += amount;
    }
}

pragma solidity ^0.8.3;

contract A {
    function doSomething() external {
        //assert();
    }
}

contract B {
    A a = new A();
    string public status = "Not available";

    function go() public {
        try a.doSomething() {
            status = "Success";
        } catch {
            status = "Failed";
        }
    }
}

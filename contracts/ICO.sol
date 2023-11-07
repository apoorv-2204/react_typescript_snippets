// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// import "hardhat/console.sol";
// console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);

contract ICO is ERC20, Ownable {
    constructor() ERC20("HighValueMedicalCargo", "HVMC") {
        _mint(msg.sender, 10000 * (10 ** uint256(decimals())));
    }

    function mint(
        address account,
        uint256 amount
    ) public onlyOwner returns (bool) {
        // only owner : the deployer of owner can call this
        require(
            account != address(this) && amount != uint256(0),
            "Try to mint to this contract or amount is 0"
        );
        _mint(account, amount);
        return (true);
    }

    function burn(
        address account,
        uint256 amount
    ) public onlyOwner returns (bool) {
        require(
            account != address(this) && amount != uint256(0),
            "Trying to burn from this contract or amount is 0"
        );
        _burn(account, amount);
        return (true);
    }

    function buy() public payable returns (bool) {
        require(
            msg.sender.balance >= msg.value && msg.value != 0 ether,
            "ICO: function buy invalid input"
        );
        uint256 amount = msg.value * 1000;
        _transfer(owner(), _msgSender(), amount);
        return true;
    }

    function withdraw(uint256 amount) public onlyOwner returns (bool) {
        require(
            amount <= address(this).balance,
            "ICO: function withdraw has invalid input"
        );
        //  (bool success, bytes memory data) =  address(this).call{value: amount}("error");

        payable(_msgSender()).transfer(amount);
        return (true);
    }
}
//  Articifacts Fo;der s creatred after compiling the contract
//  two json file , dbg and (abi&bytecode)
// =

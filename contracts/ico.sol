// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
// Uncomment this line to use console.log
// import "hardhat/console.sol";
  // Uncomment this line, and the import of "hardhat/console.sol", to print a log in your terminal
        // console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);
        
contract ICO is ERC20, Ownable {
    constructor() ERC20("HighValueMedicalCargo", "HVMC") {
        _mint(msg.sender, 1000);
    }

    // own burn fnx/.
    function mint(address account, uint256 amount)
        public
        onlyOwner
        returns (bool)
    {
        // only owner : the deployer of owner can call this
        require(
            account != address(this) && amount != uint256(0),
            "ERC20: errior"
        );
        _mint(account, amount);
        return (true);
    }

    // own burn fnx
    function burn(address account, uint256 amount)
        public
        onlyOwner
        returns (bool)
    {
        require(
            account != address(this) && amount != uint256(0),
            "ERC20: errior"
        );
        _burn(account, amount);
        return (true);
    }

    // own withdraw fnx
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

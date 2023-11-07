// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//import "@openzeppelin/contracts/drafts/Counters.sol";
//mocha and chai assert for testing andmocha for test cases
contract Color is ERC721 {
    string[] public colors;
    mapping(string => bool) _colorExists;

    constructor() ERC721("high-value-medical-cargo", "HVMC") {}

    // E.G. color = "#FFFFFF"
    function mint(string memory _color) public {
        //when exp in rquire evalutes tot true it does nothing
        //when it is flase in exp control flow dont pass though it
        require(!_colorExists[_color]);
        //require unique color
        //color  add it
        colors.push(_color);
        uint _id = colors.length - 1;
        //ethereum address of the caller message
        _mint(msg.sender, _id);
        //call the mint function
        //trackit
        _colorExists[_color] = true;
    }

    function totalSupply() public view returns (uint) {
        return colors.length;
    }
}
//internal means it cant be called outside
//

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract ERC721Ex3 is ERC721 {

    uint256 immutable public  MAX_SUPPLY = 1000;
    uint256 immutable public MINT_PRICE = 0.1 ether;
    uint256 public supply = 0;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
    }
    
    function mint() external payable returns(uint256) {
        require(msg.value >= MINT_PRICE, "Underpriced mint");
        require(supply < MAX_SUPPLY, "Max supply exceded");
        
        supply += 1;
        _mint(msg.sender, supply);
        
        return supply;
    }

}


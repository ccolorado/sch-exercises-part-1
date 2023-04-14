// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20Ex1 is ERC20PresetMinterPauser, Ownable {

  constructor(string memory _name, string memory _symbol) ERC20PresetMinterPauser(_name, _symbol) Ownable() {
  }

  function mint(address _to, uint256 _amount) public override {
    super.mint(_to, _amount);
  }

}


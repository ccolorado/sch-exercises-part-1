// SPDX-License-Identifier: MIT
// SCH Course Copyright Policy (C): DO-NOT-SHARE-WITH-ANYONE
// https://smartcontractshacking.com/#copyright-policy
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

/**
 * @title rToken
 * @author JohnnyTime (https://smartcontractshacking.com)
 */
contract rToken is ERC20PresetMinterPauser, Ownable{

    // Complete this contract functionality
    constructor(address _underlyingToken, string memory _name, string memory _symbol)
      ERC20PresetMinterPauser(_name, _symbol) Ownable()
    {
    }


    function mint(address _to, uint256 _amount) public override onlyOwner {
      super.mint(_to, _amount);
    }

    function burn(address _to, uint256 _amount) public onlyOwner {
      _burn(_to, _amount);
    }
}

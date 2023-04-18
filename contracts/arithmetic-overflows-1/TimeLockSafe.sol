// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

/**
 * @title TimeLock
 * @author JohnnyTime (https://smartcontractshacking.com)
 */
contract TimeLockSafe {
    mapping(address => uint) public getBalance;
    mapping(address => uint) public getLocktime;

    constructor() {}

    function depositETH() public payable {
        getBalance[msg.sender] += msg.value;
        getLocktime[msg.sender] = block.timestamp + 30 days;
    }

    function increaseMyLockTime(uint _secondsToIncrease) public {
        uint256 tlock = getLocktime[msg.sender];
        getLocktime[msg.sender] += _secondsToIncrease;
        require(getLocktime[msg.sender] > tlock, "timelock overflown");
    }

    function withdrawETH() public {

        require(getBalance[msg.sender] > 0);
        require(block.timestamp > getLocktime[msg.sender]);

        uint transferValue = getBalance[msg.sender];
        getBalance[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: transferValue}("");
        require(sent, "Failed to send ETH");
    }
}

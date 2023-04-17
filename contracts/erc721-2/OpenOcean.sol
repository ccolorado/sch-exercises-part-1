// SPDX-License-Identifier: MIT
// SCH Course Copyright Policy (C): DO-NOT-SHARE-WITH-ANYONE
// https://smartcontractshacking.com/#copyright-policy
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

/**
 * @title OpenOcean
 * @author JohnnyTime (https://smartcontractshacking.com)
 */
contract OpenOcean {

    struct Item {
      uint256 itemId;
      address collection;
      uint256 tokenId;
      uint256 price;
      address payable seller;
      bool isSold;
    }

    uint256 public MAX_PRICE = 100 ether; // TODO: make constant or inmutable
    uint256 public itemsCounter;
    mapping(uint256 => Item) public listedItems;


    // TODO: Complete this contract functionality

    // TODO: Constants

    // TODO: Item Struct

    // TODO: State Variables and Mappings
    
    constructor() {}

    // List item function
    // 1. Make sure params are correct
    // 2. Increment itemsCounter
    // 3. Transfer token from sender to the contract
    // 4. Add item to listedItems mapping
    function listItem(address _collection, uint256 _tokenId, uint256 _price) external {
      require(_price != 0, 'price is 0');
      require(_price <= MAX_PRICE, 'price above maximum');
      require(_collection != address(0), 'collection address is invalid');

      address payable seller = payable(address(msg.sender));

      IERC721 collection = IERC721(_collection);
      collection.transferFrom(msg.sender, address(this), _tokenId);

      // Item memory _item = Item (
      listedItems[itemsCounter] = Item (
        itemsCounter,
        _collection,
        _tokenId,
        _price,
        seller,
        false
      );

      itemsCounter += 1;
    }

    // Purchase item function 
    // 1. Check that item exists and not sold
    // 2. Check that enough ETH was paid
    // 3. Change item status to "sold"
    // 4. Transfer NFT to buyer
    // 5. Transfer ETH to seller
    function purchase(uint _itemId) external payable {
      require(listedItems[_itemId].collection != address(0), 'inexisting listing');
      require(!listedItems[_itemId].isSold, 'listing already sold');
      require(listedItems[_itemId].price == msg.value, 'wrong price sent');

      (bool sent, ) = listedItems[_itemId].seller.call{value: msg.value}("");
      require(sent, 'can not transfer eth');

      listedItems[_itemId].isSold = true;

      IERC721(listedItems[_itemId].collection).transferFrom(
        address(this), msg.sender, listedItems[_itemId].tokenId);

    }

}

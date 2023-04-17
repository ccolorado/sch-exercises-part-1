const { ethers } = require('hardhat');
const { expect } = require('chai');

describe('ERC721 Tokens Exercise 2', function () {

    let deployer, user1, user2, user3;

    const CUTE_NFT_PRICE = ethers.utils.parseEther('5');
    const BOOBLES_NFT_PRICE = ethers.utils.parseEther('7');

    before(async function () {
        /** Deployment and minting tests */

        [deployer, user1, user2, user3] = await ethers.getSigners();

        // User1 creates his own NFT collection
        let NFTFactory = await ethers.getContractFactory(
            'contracts/utils/DummyERC721.sol:DummyERC721',
            user1
        );
        this.cuteNFT = await NFTFactory.deploy("Crypto Cuties", "CUTE", 1000);
        await this.cuteNFT.mintBulk(30);
        expect(await this.cuteNFT.balanceOf(user1.address)).to.be.equal(30);

        // User3 creates his own NFT collection
        NFTFactory = await ethers.getContractFactory('DummyERC721', user3);
        this.booblesNFT = await NFTFactory.deploy("Rare Boobles", "BOO", 10000);
        await this.booblesNFT.mintBulk(120);
        expect(await this.booblesNFT.balanceOf(user3.address)).to.be.equal(120);

        // Store users initial balance
        this.user1InitialBalance = await ethers.provider.getBalance(user1.address);
        this.user2InitialBalance = await ethers.provider.getBalance(user2.address);
        this.user3InitialBalance = await ethers.provider.getBalance(user3.address);
    });

    it('Deployment & Listing Tests', async function () {
        /** CODE YOUR SOLUTION HERE */


        // Deploy Marketplace from deployer
        let marketFactory = await ethers.getContractFactory(
          'contracts/erc721-2/OpenOcean.sol:OpenOcean',
            deployer
        );

        this.marketContract = await marketFactory.deploy();


        for (let i = 1; i <= 10; i++) {
          await this.cuteNFT.connect(user1).approve(this.marketContract.address, i);
          // User1 lists Cute NFT tokens 1-10 for 5 ETH each
          await this.marketContract.connect(user1).listItem(this.cuteNFT.address, i, CUTE_NFT_PRICE);

          expect(await this.cuteNFT.ownerOf(i)).to.be.equal(this.marketContract.address);

          let _item = await this.marketContract.listedItems(i - 1);
          // Checks that the marketplace mapping is correct (All data is correct), check the 10th item.
          expect(_item.itemId).to.be.equal(i - 1, "missmatch item id");
          expect(_item.collection).to.be.equal(this.cuteNFT.address, "missmatch collection address");
          expect(_item.tokenId).to.be.equal(i, "missmatch token id");
          expect(_item.price).to.be.equal(CUTE_NFT_PRICE, "missmatch listed price");
          expect(_item.seller).to.be.equal(user1.address, "missmatch seller address");
          expect(_item.isSold).to.be.equal(false, "missmatch selling status");

        }

        expect(await this.marketContract.itemsCounter()).to.be.equal(10);

        for (let i = 1; i <= 5; i++) {
          await this.booblesNFT.connect(user3).approve(this.marketContract.address, i);
          // User3 lists Boobles NFT tokens 1-5 for 7 ETH each
          await this.marketContract.connect(user3).listItem(this.booblesNFT.address, i, BOOBLES_NFT_PRICE);
          expect(await this.booblesNFT.ownerOf(i)).to.be.equal(this.marketContract.address);

          let _item = await this.marketContract.listedItems(i + 9);
          // Checks that the marketplace mapping is correct (All data is correct), check the 15th item.
          expect(_item.itemId).to.be.equal(i + 9, "missmatch item id");
          expect(_item.collection).to.be.equal(this.booblesNFT.address, "missmatch collection address");
          expect(_item.tokenId).to.be.equal(i, "missmatch token id");
          expect(_item.price).to.be.equal(BOOBLES_NFT_PRICE, "missmatch listed price");
          expect(_item.seller).to.be.equal(user3.address, "missmatch seller address");
          expect(_item.isSold).to.be.equal(false, "missmatch selling status");

        }
        // Check that Marketplace owns 5 Booble NFTs
        expect(await this.marketContract.itemsCounter()).to.be.equal(15);

    });

    it('Purchases Tests', async function () {
        /** CODE YOUR SOLUTION HERE */

        // All Purchases From User2 //

        // Try to purchase itemId 100, should revert
        await expect(
          this.marketContract.connect(user2).purchase(100)
        ).to.be.revertedWith('inexisting listing');

        // Try to purchase itemId 3, without ETH, should revert
        await expect(
          this.marketContract.connect(user2).purchase(3, {value: 0})
        ).to.be.revertedWith('wrong price sent');

        // Try to purchase itemId 3, with ETH, should work
        let _purchaseItem = await this.marketContract.listedItems(3);

        await this.marketContract.connect(user2).purchase(3, {value: CUTE_NFT_PRICE})
        expect(await this.cuteNFT.ownerOf(_purchaseItem.tokenId)).to.be.equal(user2.address);

        // Can't purchase sold item
        await expect(
          this.marketContract.connect(user2).purchase(3, {value: CUTE_NFT_PRICE})
        ).to.be.revertedWith('listing already sold');

        // User2 owns itemId 3 -> Cuties tokenId 3
        expect(await this.cuteNFT.ownerOf(_purchaseItem.tokenId)).not.to.be.equal(this.marketContract.address, "token owned by makert");

        expect(await this.cuteNFT.ownerOf(_purchaseItem.tokenId)).to.be.equal(user2.address);

        // User1 got the right amount of ETH for the sale

        expect(
          await ethers.provider.getBalance(user1.address)
        ).to.be.gt(
          this.user1InitialBalance.add(CUTE_NFT_PRICE).sub(ethers.utils.parseEther("0.2"))
        )

        // Purchase itemId 11

        // User2 owns itemId 11 -> Boobles tokenId 1
        await this.marketContract.connect(user2).purchase(11, {value: BOOBLES_NFT_PRICE})

        // got the right amount of ETH for the sale
        expect(
          await ethers.provider.getBalance(user3.address)
        ).to.be.gt(
          this.user3InitialBalance.add(BOOBLES_NFT_PRICE).sub(ethers.utils.parseEther("0.2"))
        )
    });
});

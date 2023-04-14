const { ethers } = require('hardhat');
const { expect } = require('chai');

describe('ERC721 Tokens Exercise 1', function () {
    
    let deployer, user1, user2;

    // Constants 
    const DEPLOYER_MINT = 5;
    const USER1_MINT = 3;
    const MINT_PRICE = ethers.utils.parseEther('0.1');

    before(async function () {
        /** Deployment and minting tests */
        
        [deployer, user1, user2] = await ethers.getSigners();

        /** CODE YOUR SOLUTION HERE */
        // Contract deployment
        Token = await ethers.getContractFactory('ERC721Ex3');
        this.token = await Token.deploy('Exercise3', 'ex3');

    });

    it('Minting Tests', async function () {
        /** CODE YOUR SOLUTION HERE */

        // Deployer mints
        await this.token.mint({value: MINT_PRICE});
        await this.token.mint({value: MINT_PRICE});
        await this.token.mint({value: MINT_PRICE});
        await this.token.mint({value: MINT_PRICE});
        await this.token.mint({value: MINT_PRICE});

        // Deployer should own token ids 1-5
        expect(await this.token.balanceOf(deployer.address)).to.be.equal(5);
        
        await this.token.connect(user1).mint({value: MINT_PRICE});
        await this.token.connect(user1).mint({value: MINT_PRICE});
        await this.token.connect(user1).mint({value: MINT_PRICE});
        // User1 should own token ids 6-8
        expect(await this.token.balanceOf(user1.address)).to.be.equal(3);
    
    });

    it('Transfers Tests', async function () {
        /** CODE YOUR SOLUTION HERE */

        // Transfering tokenId 6 from user1 to user2
        await this.token.connect(user1).transferFrom(user1.address, user2.address, 6);

        // Checking that user2 owns tokenId 6
        expect(await this.token.ownerOf(6)).to.be.equal(user2.address);

        // Deployer approves User1 to spend tokenId 3
        await this.token.approve(user1.address, 3);
        
        // Test that User1 has approval to spend TokenId3
        expect(await this.token.getApproved(3)).to.be.equal(user1.address);
        
        // Use approval and transfer tokenId 3 from deployer to User1
        await this.token.connect(user1).transferFrom(deployer.address, user1.address, 3);
        
        // Checking that user1 owns tokenId 3
        expect(await this.token.ownerOf(3)).to.be.equal(user1.address);
        
        // Checking balances after transfer
        // Deployer: 5 minted, 1 sent, 0 received
        expect(await this.token.balanceOf(deployer.address)).to.be.equal(4);
        
        // User1: 3 minted, 1 sent, 1 received
        expect(await this.token.balanceOf(user1.address)).to.be.equal(3);
        
        // User2: 0 minted, 0 sent, 1 received
        expect(await this.token.balanceOf(user2.address)).to.be.equal(1);
        
    });
});

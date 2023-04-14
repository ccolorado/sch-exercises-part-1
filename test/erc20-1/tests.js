const { ethers } = require('hardhat');
const { expect } = require('chai');

describe('ERC20 Tokens Exercise 1', function () {

    let deployer, user1, user2, user3;
    let Token, token;

    // Constants 
    const DEPLOYER_MINT = ethers.utils.parseEther('100000');
    const USERS_MINT = ethers.utils.parseEther('5000');
    const FIRST_TRANSFER = ethers.utils.parseEther('100');
    const SECOND_TRANSFER = ethers.utils.parseEther('1000');

    before(async function () {
        /** Deployment and minting tests */

        [deployer, user1, user2, user3] = await ethers.getSigners();
        // Contract deployment
        Token = await ethers.getContractFactory('ERC20Ex1');
        token = await Token.deploy('Exercise1', 'ex1');

        expect(await token.owner()).to.equal(deployer.address);

        // Minting
        await token.mint(deployer.address, DEPLOYER_MINT);

        // Check Minting
        expect(await token.balanceOf(deployer.address)).to.equal(DEPLOYER_MINT);

    });

    it('Transfer tests', async function () {
      /** Transfers Tests */

      // First transfer
      await token.mint(user1.address, USERS_MINT);
      await token.mint(user2.address, USERS_MINT);
      await token.mint(user3.address, USERS_MINT);

      expect(await token.balanceOf(user1.address)).to.be.equal(USERS_MINT);
      expect(await token.balanceOf(user2.address)).to.be.equal(USERS_MINT);
      expect(await token.balanceOf(user3.address)).to.be.equal(USERS_MINT);

      //  Second transfer
      await token.connect(user2).transfer(user3.address, FIRST_TRANSFER)

      expect(await token.balanceOf(user2.address)).to.be.equal(ethers.utils.parseEther('4900'));
      expect(await token.balanceOf(user3.address)).to.be.equal(ethers.utils.parseEther('5100'));

      // Approval & Allowance test
      await token.connect(user3).approve(user1.address, SECOND_TRANSFER)

      expect(await token.allowance(user3.address, user1.address)).to.be.equal(SECOND_TRANSFER);

      await token.connect(user1).transferFrom(user3.address, user1.address, SECOND_TRANSFER);

      // Checking balances after transfer
      expect(await token.balanceOf(user3.address)).to.be.equal(ethers.utils.parseEther('4100'));
      expect(await token.balanceOf(user1.address)).to.be.equal(ethers.utils.parseEther('6000'));

    });
});

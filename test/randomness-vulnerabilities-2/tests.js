const { ethers } = require('hardhat');
const { expect } = require('chai');

describe('Randomness Vulnerabilities Exercise 2', function () {

    let deployer, attacker;
    const INITIAL_POT = ethers.utils.parseEther('20');
    const GAME_FEE = ethers.utils.parseEther('1');

    before(async function () {
        /** SETUP EXERCISE - DON'T CHANGE ANYTHING HERE */

        [deployer, attacker] = await ethers.getSigners();
        this.attackerInitialBalance = await ethers.provider.getBalance(attacker.address);

        // Deploy wallet and deposit ETH
        const gameFactory = await ethers.getContractFactory(
            'contracts/randomness-vulnerabilities-2/Game2.sol:Game2',
            deployer
        );
        this.game = await gameFactory.deploy({value: INITIAL_POT});

        let inGame = await ethers.provider.getBalance(this.game.address);
        expect(inGame).to.equal(INITIAL_POT);
    });

    it('Exploit', async function () {
        /** CODE YOUR SOLUTION HERE */
        const attackFactory = await ethers.getContractFactory(
            'contracts/randomness-vulnerabilities-2/GameAttack2.sol:GameAttack2',
            attacker
        );

        attack = await attackFactory.deploy(this.game.address, {value: ethers.utils.parseEther('5') });

        await attack.connect(attacker).play();
        await attack.connect(attacker).play();
        await attack.connect(attacker).play();
        await attack.connect(attacker).play();
        await attack.connect(attacker).play();

    });

    after(async function () {
        /** SUCCESS CONDITIONS */

        // Game funds were stolen
        expect(await ethers.provider.getBalance(this.game.address)).to.equal(0);

        // Attacker supposed to own the stolen ETH (-0.2 ETH for gas...)
        expect(
            await ethers.provider.getBalance(attacker.address)
        ).to.be.gt(this.attackerInitialBalance.add(INITIAL_POT).sub(ethers.utils.parseEther('0.2')));
    });
});

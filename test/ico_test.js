const { expect } = require('chai');
const { BigNumber } = require('ethers');
const { ethers } = require('hardhat');

describe("ICO -Erc20 Testing", describe_tests);

function describe_tests() {
    let icoContract;
    let accounts;
    // string to (ethers/ wei)
    const oneEthAmount = ethers.utils.parseEther("1");

    before(async () => {
        /* before describe, execute contract
         * name of contract
         * initial deployement parameters for contract, must be passed
         * contract account and contract byte code
         * getContractFactory sends byte code initialization tx to NetChain
         * Internally hardhat ahanldes set of contracts and their deployment
         * getContractFactory returns a contracts abi and bytecode
        */
        const acquireContract = await ethers.getContractFactory("ICO");

        // like clicking on deplop button in remix
        // sends contracts to network
        icoContract = await acquireContract.deploy();

        // HH contains some accounts like in remix and stoiring them in accounts
        accounts = await ethers.getSigners();

        // like waiting for transaction to be mined, waiting for contract to be mined
        //  waits until contract is part of blockchain 
        await icoContract.deployed();
        ownerWalletConnToContract = icoContract.connect(accounts[0]);

    });

    it("Owner should have all initial funds", async () => {
        // read total supply from contract
        const totalSupply = await icoContract.totalSupply();
        // accounts[0] is the first account in the list of accounts or the owner
        expect(await icoContract.balanceOf(accounts[0].address)).to.equal(totalSupply);
    });

    it("SHould have expected name and symbol of Token", async () => {
        const tokenName = (await icoContract.name());
        expect(tokenName).to.equal("HighValueMedicalCargo");
        (icoContract.symbol()).then((symbol) => {
            expect(symbol).to.equal("HVMC");
        });
    });

    it("Only Owner can mint tokens", async () => {
        const wallet = icoContract.connect(accounts[2]);
        await expect(wallet.mint(accounts[2].address, oneEthAmount)).to.be.revertedWith("Ownable: caller is not the owner");
    });

    it("Only Owner can burn tokens", async () => {
        const wallet = icoContract.connect(accounts[2]);
        await expect(wallet.burn(accounts[2].address, oneEthAmount)).to.be.revertedWith("Ownable: caller is not the owner");
    });

    it("Buy token from ICO", async () => {
        const account3ConnToContract = icoContract.connect(accounts[3]);
        await account3ConnToContract.buy({
            value: oneEthAmount.mul(1)
        });

        expect(await account3ConnToContract.balanceOf(accounts[3].address) / 10 ** 18).to.equal(1000);

        expect(await account3ConnToContract.balanceOf(accounts[0].address) / 10 ** 18).to.equal(9000);
    });

    it("Only Owner Can withdraw funds", async () => {
        const account5ConnToContract = icoContract.connect(accounts[5]);
        // feature of chain, .to.be reverted
        await expect(account5ConnToContract.withdraw(oneEthAmount)).to.be.revertedWith("Ownable: caller is not the owner");
    });

    it("Transfer Token from one account to another on sender request", async () => {
        const wallet0ConnToContract = icoContract.connect(accounts[0]);
        await wallet0ConnToContract.transfer(accounts[1].address, BigNumber.from(oneEthAmount).mul(20))
        expect(
            await wallet0ConnToContract.balanceOf(accounts[1].address)
        ).to.equal(BigNumber.from(oneEthAmount).mul(20));

        expect(
            await wallet0ConnToContract.balanceOf(accounts[0].address)
        ).to.equal(oneEthAmount.mul(8980));
    });

    it("Should not transfer above the clients balance of hvmc token0", async () => {
        const wallet1InteractionToContract = icoContract.connect(accounts[1]);
        // await should be outside for vm fail
        await expect(
            wallet1InteractionToContract.transfer(accounts[3].address, oneEthAmount.mul(1000))
        ).to.be.revertedWith("ERC20: transfer amount exceeds balance");
    });

    it("Should not transfer from accout with bal 0", async () => {
        const wallet4InteractionToContract = icoContract.connect(accounts[4]);
        // await should be outside for vm fail
        await expect(
            wallet4InteractionToContract.transfer(accounts[5].address, oneEthAmount.mul(1000))
        ).to.be.reverted;
    });

    it("test minting token ", async () => {
        const ownerWalletConnToContract = icoContract.connect(accounts[0]);
        let prv_balance = await ownerWalletConnToContract.balanceOf(accounts[0].address);
        await ownerWalletConnToContract.mint(accounts[0].address, oneEthAmount.mul(1200));
        let after_mint = await ownerWalletConnToContract.balanceOf(accounts[0].address);
        expect(after_mint).to.equal(prv_balance.add(oneEthAmount.mul(1200)));
    });

    it("Test burning of token", async () => {
        // important most imp the return value of funcitons
        let prv_balance = await ownerWalletConnToContract.balanceOf(accounts[0].address);

        await ownerWalletConnToContract.burn(accounts[0].address, oneEthAmount.mul(1200));

        let after_burn = await ownerWalletConnToContract.balanceOf(accounts[0].address);

        expect(after_burn).to.equal(prv_balance.sub(oneEthAmount.mul(1200)));
    });

    it("withdraw ethers from contract", async () => {
        // get balance for an account directly we can use get balance 
        const before_withdraw = await accounts[0].getBalance();
        await ownerWalletConnToContract.withdraw(oneEthAmount);
        const after_withdraw = await accounts[0].getBalance();
        // wont match to  pay the gas fees
        // expect(before_withdraw).to.equal(after_withdraw.sub(oneEthAmount));
        expect(after_withdraw.gt(before_withdraw)).to.equal(true);
    });

    it("NOt enough etheres, buying from empty account ", async () => {
        const wallet6ConnToContract = icoContract.connect(accounts[6]);
        const big_amount = ethers.utils.parseEther("999999");
        // await expect(wallet6ConnToContract.buy({ value: big_amount })).to.be.revertedWith("ICO: function buy invalid input");
        var error;
        try {
            await wallet6ConnToContract.buy({ value: big_amount })
        }
        catch (err) {
            error = "sender doesn't have enough funds to send tx"
        }
        expect(error).to.equal("sender doesn't have enough funds to send tx");
    });

}




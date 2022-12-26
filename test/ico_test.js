const { expect } = require('chai');
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
}
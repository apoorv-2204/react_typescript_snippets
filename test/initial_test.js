const Chai = require('chai');
const { ethers } = require('hardhat');

describe("ICO -Erc20 Tesing", describe_tests);

function describe_tests() {
    let icoContract;
    let accounts;
    // string to (ethers/ wei)
    const amount = ethers.utils.parseEther("1");

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
        Chai.expect(await icoContract.balanceOf(accounts[0].address)).to.equal(totalSupply);
    });

    it("SHould have expected name and symbol of Token", async () => {
        const tokenName = (await icoContract.name());
        Chai.expect(tokenName).to.equal("HighValueMedicalCargo");
        (icoContract.symbol()).then((symbol) => {
            Chai.expect(symbol).to.equal("HVMC");
        });
    });

    it("Only Owner can mint tokens", async () => {
        const wallet = icoContract.connect(accounts[2]);
        await Chai.expect(wallet.mint(accounts[2].address, amount)).to.be.revertedWith("Ownable: caller is not the owner");
    });


}
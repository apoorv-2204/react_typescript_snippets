const Chai = require('chai');
const artifacts =

    describe("ICO -Erc20 Tesing", describe_tests);

function describe_tests() {
    let icoContract;
    let accounts;
    // string to (ethers/ wei)
    const amount = ethers.utils.parseEthers("1");

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

    it("Assgin initial balance", async () => {
        const totalSupply = await icoContract.totalSupply();
    });
}
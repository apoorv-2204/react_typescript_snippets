require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");

// task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
//   const accounts = await hre.ethers.getSigners();

//   for (const account of accounts) {
//     console.log(account.address);
//   }
// });// https://hardhat.org/guides/create-task.html

// npx hardhat run scripts / deploy.js--network localhost

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "hardhat",
  solidity: "0.8.6",
  settings: {
    optimizer: {
      enables: true,
      runs: 200
    }
  },
  networks: {
    hardhat: {
      chainId: 1337
      // chain id 1337 switch between different networks
      // 1337 for local host evem based local netowrk
    },
    goerli: {
      url: `https://goerli.infura.io/v3/${process.env.INFURA_API_KEY}`,
      chainId: 5,
    },
    // etherscan: {
    //   apiKey: {
    //     goerli: process.env.ETHERSCAN_API_KEY,
    //   },
    // },

  },
  gasReporter: {
    enabled: true, currency: "INR", outputFile: 'gas-report.txt', noColors: true, showTimeSpent: true,
    coinmarketcap: "eb06a943-2bc6-43b7-8e53-5ebd04c84048",
    token: "matic"
  },
};

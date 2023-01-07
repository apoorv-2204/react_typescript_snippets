require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");

// task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
//   const accounts = await hre.ethers.getSigners();

//   for (const account of accounts) {
//     console.log(account.address);
//   }
// });// https://hardhat.org/guides/create-task.html



/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "hardhat",
  solidity: "0.8.6",
  gasReporter: {
    enabled: true, currency: "INR", outputFile: 'gas-report.txt', noColors: true, showTimeSpent: true,
    coinmarketcap: "eb06a943-2bc6-43b7-8e53-5ebd04c84048",
    token: "matic"
  },
};

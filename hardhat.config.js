require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.6",
  gasReporter: { enabled: true, currency: "INR", outputFile: 'gas-report.txt', noColors: true, showTimeSpent: true, },
};

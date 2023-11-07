//SPDX-License-Identifier:MIT
pragma solidity ^0.8.6;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract chainlinkPriceOracle {
    AggregatorV3Interface internal priceFeed;

    constructor() {
        priceFeed = AggregatorV3Interface(
            0x779877A7B0D9E8603169DdbD7836e478b4624789
        );
    }

    function getLatestPriceFeed() public view returns (int256) {
        (
            uint80 roundId,
            int256 price,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();

        return price / 1e18;
    }

    function fetchByAddress(address contractAddress)
        public
        view
        returns (
            uint80,
            int256,
            uint256,
            uint256,
            uint80 answeredInRound
        )
    {
        return AggregatorV3Interface(contractAddress).latestRoundData();
    }
}

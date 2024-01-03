// We use interfaces to get ABI-Application Binary Interface

// Get funds from users
// Withdraw Funds
// Set a minimum funding value in usd

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// This is what is known as an interface, appears before our "FundMe" variable
interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  // getRoundData and latestRoundData should both raise "No data present"
  // if they do not have data to report, instead of returning unset values
  // which could be misinterpreted as actual reported values.
  function getRoundData(uint80 _roundId)
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );
}

contract FundMe {

    uint256 public minimumUsd = 5; // Minimum amount of USD to be sent

    // To send money to our contract
    // Allow users to send $
    // Have a mininum $ sent, $5
    function fund() public payable  { 
        require(msg.value >= minimumUsd, "didn't send enough ETH");

    }

    function getPrice() public { // This functions gets the price in terms of USD
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306 // Address gotten from the price feed
        //ABI
    }

    function getConversionRate() public { // This function converts the value to its converted value based off of the price

    }

    function getVersion() public view returns(uint256) { // This function retrieves the version of the aggregator interface used in the contract
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    } 
}

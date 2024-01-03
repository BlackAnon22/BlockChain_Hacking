// Get funds from users
// Withdraw Funds
// Set a minimum funding value in usd

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol"; // importing directly from github

contract FundMe {

    uint256 public minimumUsd = 5;

    // To send money to our contract
    // Allow users to send $
    // Have a mininum $ sent, $5
    function fund() public payable  { 
        require(msg.value > minimumUsd, "didn't send enough ETH");

    }

    function getPrice() public {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
    }

    function getConversionRate() public {

    }

    function getVersion() public view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    } 
}

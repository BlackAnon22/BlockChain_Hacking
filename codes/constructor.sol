// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import{PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256; // To attach the functions in our PriceConversion.sol file

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public owner;

    constructor() {
        // The owner is set to the address that deploys the contract
        owner = msg.sender;
    }

    // To send money to our contract
    // Allow users to send $
    // Have a mininum $ sent, $5
    function fund() public payable  { 
        require(msg.value.getConversionRate() >= minimumUsd, "did not send enough ETH");
        funders.push(msg.sender);
        //addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
        addressToAmountFunded[msg.sender] += msg.value; // this is more condensed 
    }

    function withdraw() public {
        require(msg.sender == owner, "Must be owner!"); // Perform restricted action here
        for (uint256 funderIndex = 0; funderIndex < funders.length ; funderIndex++) {
            // to access the 0th element of the funders array, since it is an array of addresses
            address funder = funders[funderIndex];  
            // to reset our mapping addressToAmountFunded
            addressToAmountFunded[funder] = 0;
        }

        // To reset the array
        funders = new address[](0); // The "new" keyword is used to deploy a different contract

        // To withdraw funds

        // 1. transfer
        // msg.sender = type address
        // payable(msg.sender) == type payable address
       // payable(msg.sender).transfer(address(this).balance);

       // 2. send
       //bool sendSuccess = payable(msg.sender).send(address(this).balance);
       //require(sendSuccess, "Send Failed");

       // 3.call
       (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
       require(callSuccess, "Call Failed"); /// requiring callSuccess is true, other wise prints an error that says "call failed"
        
    }

}

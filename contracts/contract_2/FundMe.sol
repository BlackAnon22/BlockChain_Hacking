// This is a contract that get funds from users, set a minimum funding value in usd and then the owner of the contract can withdraw the funds

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import{PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {

    using PriceConverter for uint256; // To attach the functions in our PriceConversion.sol file 

    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        // The owner is set to the address that deploys the contract
        i_owner = msg.sender;
    }

    // To send money to our contract
    // Allow users to send $
    // Have a mininum $ sent, e.g $5
    function fund() public payable  { 
        require(msg.value.getConversionRate() >= MINIMUM_USD, "did not send enough ETH");
        funders.push(msg.sender);
        //addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
        addressToAmountFunded[msg.sender] += msg.value; // this is more condensed 
    }

    function withdraw() public onlyOwner { 
        for (uint256 funderIndex = 0; funderIndex < funders.length ; funderIndex++) {
            // To access the 0th element of the funders array, since it is an array of addresses
            address funder = funders[funderIndex];  
            // To reset our mapping addressToAmountFunded
            addressToAmountFunded[funder] = 0;
        }

        // To reset the array
        funders = new address[](0); // The "new" keyword is used to deploy a different contract

        // To withdraw funds

         // // transfer
        // payable(msg.sender).transfer(address(this).balance);
        
        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

       // call
       (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
       require(callSuccess, "Call Failed"); // requiring callSuccess is true, other wise prints an error message that says "call failed"
        
    }

    modifier onlyOwner {
        // require(msg.sender == i_owner, "Sender is not owner!");
        if(msg.sender != i_owner) {revert NotOwner(); }
        _;
    }

     // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \ 
    //         yes  no
    //         /     \
    //    receive()?  fallback() 
    //     /   \ 
    //   yes   no
    //  /        \
    // receive()  fallback()

    receive() external payable { 
        fund();
    }

    fallback() external payable { 
        fund();
    }
}

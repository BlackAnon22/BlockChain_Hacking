//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import{PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256; // To attach the functions in our PriceConversion.sol file

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

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
        // for loop
        // [1, 2, 3, 4] --> elements
        //  0, 1  2, 3 --> indexes
        // for(/* starting index, ending index, step amount */)

        for (uint256 funderIndex = 0; funderIndex < funders.length ; funderIndex++) {
            // to access the 0th element of the funders array, since it is an array of addresses
            address funder = funders[funderIndex];  
            // to reset our mapping addressToAmountFunded
            addressToAmountFunded[funder] = 0;
        }

        // To reset the array
        funders = new address[](0); // The "new" keyword is used to deploy a different contract

        // To withdraw funds

       // call
       (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
       require(callSuccess, "Call Failed"); /// requiring callSuccess is true, other wise prints an error that says "call failed"
        
    }

}

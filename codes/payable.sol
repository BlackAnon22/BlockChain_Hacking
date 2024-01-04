// The "payable" keyword allows a function to accept the native blockchain currency (ETH,Arbitrum etc)

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FundMe {

    // To send money to our contract
    // Allow users to send $
    // Have a mininum $ sent, $5
    function fund() public payable  { 
        msg.value;

    }
}

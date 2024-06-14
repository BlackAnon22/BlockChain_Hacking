// Lets say we want users to send atleast 1 ETH in the contract we can use the "require" keyword, the keyword is more like a checker

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FundMe {

    // To send money to our contract 
    // Allow users to send $
    // Have a mininum $ sent, $5
    function fund() public payable  {  
        require(msg.value > 1e18); // 1e18 = 1 ETH = 1000000000 Gwei = 1000000000000000000 Wei

    }
}
  

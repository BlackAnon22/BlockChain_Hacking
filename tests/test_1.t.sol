// This is a basic test contract to show how the "setUp()" function is executed before any other function

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";

contract FundMeTest is Test {
    uint256 number = 1;

    // intended to be executed before any test function, here is where we will deploy our contracts
    function setUp() external {
        number = 2; 
    }
 
    function testDemo() public { 
        assertEq(number, 2); 
    }
} 
  

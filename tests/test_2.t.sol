// This is a basic test contract using console.log
// Also a basic test contract to show that the "setUp()" function runs first

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";

contract FundMeTest is Test {
    uint256 number = 1;

    // intended to be executed before any test function, here is where we will deploy our contracts
    function setUp() external {
        number = 2;
    }

    function testDemo() public {
        console.log(number);
        console.log("Hello BlackAnon");
        assertEq(number, 2);
    }
}

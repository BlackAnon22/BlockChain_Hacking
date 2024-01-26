// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    // declares a state variable fundme of type FundMe
    FundMe fundme;

    // intended to be executed before any test function, here is where we will deploy our contracts
    function setUp() external {
        // deploys a new instance of the FundMe contract and assigns it to the fundme state variable.
        fundme = new FundMe();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundme.MINIMUM_USD(), 5e18);
    }
}

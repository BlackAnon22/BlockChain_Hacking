// Deploying a contract using a script

// PS: This is a script not a contract

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

// inherits from Script
contract DeploySimpleStorage is Script { 
    // returns the contract address
    function run() external returns (SimpleStorage) { 
        // start broadcasting
        vm.startBroadcast(); 
        // The "new" keyword is used to deploy a different contract
        SimpleStorage simpleStorage = new SimpleStorage(); 
        // stop broadcasting
        vm.stopBroadcast(); 
        return simpleStorage; 
    }
}


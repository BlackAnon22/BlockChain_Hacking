// Deploying a contract using a script

// PS: This is a script contract to deploy a contract "SimpleStorage"

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18; 

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

// inherits from Script 
contract DeploySimpleStorage is Script { 
    
    function run() external returns (SimpleStorage) { // returns the contract address
        vm.startBroadcast(); // start broadcasting
        SimpleStorage simpleStorage = new SimpleStorage(); // The "new" keyword is used to deploy a different contract
        vm.stopBroadcast(); // stop broadcasting
        return simpleStorage;
    }
}

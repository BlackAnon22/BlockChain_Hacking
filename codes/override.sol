// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SimpleStorage} from "./SimpleStorage.sol"; //imports the SimpleStorage contract

contract AddFiveStorage is SimpleStorage { // inherits the functionalites of the simplestorage contract

    // the override keyword here is used to override the store() function in the simplestorage contract, the virtual keyword is added to the store() function in the simplestorage contract
    function store(uint256 _newNumber) public override { 
        MyFavoriteNumber = _newNumber + 5; // calls the variable "MyFavoriteNumber" from the simplestorage contract and then adds 5 to it
    }

}


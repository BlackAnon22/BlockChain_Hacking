// Lets say you love all the functions in this contract but you want it to just add 5 to the favorite number  

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {

    function store(uint256 _newNumber) public override {
        MyFavoriteNumber = _newNumber + 5;
    }

}


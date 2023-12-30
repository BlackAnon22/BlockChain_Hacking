// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import{SimpleStorage} from "./SimpleStorage.sol"; // with this we can import different contracts 

contract StorageFactory{
    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }
}


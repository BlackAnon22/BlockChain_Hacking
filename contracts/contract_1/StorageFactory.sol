// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

import{SimpleStorage} from "./SimpleStorage.sol"; 

contract StorageFactory{
    SimpleStorage[] public listofsimpleStorageContracts; // a dynamic array is created to take note of the several address the contract is being deployed to
 
    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listofsimpleStorageContracts.push(newSimpleStorageContract); //our array is being updated
    }
    
    // allows us to store a number in a specific SimpleStorage contract identified by its index in the array
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        //SimpleStorage mySimpleStorage = listofsimpleStorageContracts[_simpleStorageIndex];
        //mySimpleStorage.store(_newSimpleStorageNumber);
        listofsimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber); //this is more condensed, commented code also works tho 
    }

     // retrieves a number from a specific SimpleStorage contract identified by its index in the array
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        //SimpleStorage mySimpleStorage = listofsimpleStorageContracts[_simpleStorageIndex];
        //return mySimpleStorage.retrieve();
        return listofsimpleStorageContracts[_simpleStorageIndex].retrieve(); // this is more condensed
    }
}


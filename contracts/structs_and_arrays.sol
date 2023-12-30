// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract simpleStorage{
    uint favoriteNumber;

    struct Person{ // creates the type "person" using the struct keyword
        uint256 listoffavoriteNumbers;
        string name;
    }
    Person[] public listofPeople; // instead of computing each person one by one, an array is created

    // this function adds people and updates the array
    function addPeople(string memory _name, uint256 _listoffavoriteNumbers) public { 
        listofPeople.push(Person(_listoffavoriteNumbers,_name));
    }
}

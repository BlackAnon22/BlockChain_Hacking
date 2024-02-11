// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract simpleStorage{
    uint favoriteNumber;

    struct Person{ // creates the type "person" using the struct keyword
        uint256 listoffavoriteNumbers;
        string name;
    }
    Person[] public listofPeople;  // instead of computing each person one by one, an array is created

    mapping(string => uint256) public nameToFavoriteNumber; // if we had over 1000 people, indexing through won't work. So, mapping can be used. If you search for a particular person you'll get the favorite number

    // this function adds people and updates the array, then we can use indexing to grab a person's favorite number
    function addPerson(string memory _name,uint256 _listoffavoriteNumbers) public {
        listofPeople.push(Person(_listoffavoriteNumbers,_name)); 
        nameToFavoriteNumber[_name] = _listoffavoriteNumbers; // to add someone to our mapping

    }
}

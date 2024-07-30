// This is a contract that allows us to store our favorite number and different people's favorite number

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19; 
 
contract SimpleStorage{
  
    // this defaults to 0    
    uint256 MyFavoriteNumber;  
  
    // creating a new type "Person"   
    struct Person{  
        uint256 favoriteNumber;  
        string name; 
    } 
 
    // creating a dynamic array   
    Person[] public listOfPeople;

    // creating a dictionary
    mapping(string => uint256) public nameOfFavoriteNumber;

    // declaring a function store
    function store(uint256 _favoriteNumber) public{
        MyFavoriteNumber = _favoriteNumber;
    }

    // accessing the state variable
    function retrieve() public view returns(uint256){
        return MyFavoriteNumber; 
    }

    // creating a function that pushes new people into the array and dictionary
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber,_name));
        nameOfFavoriteNumber[_name] = _favoriteNumber;
    }
}

// A contract that gets the name of people alongside their favorite anime characters
// Kind of dumped this project lmao
// I'll be back to it tho

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
 
contract voteCharacters {
    string public animeCharacter; 
 
    struct Person {
        string favoriteAnimeCharacter;  
        string name; 
    }  
 
    // dynamic array of Person
    Person[] public listOfPeople;

    mapping(string => string) public nameToFavoriteAnimeCharacter;

    function store(string memory _favoriteAnimeCharacter) public {
        animeCharacter = _favoriteAnimeCharacter;
    }

    function retrieve() public view returns (string memory) {
        return animeCharacter;
    }

    function addPerson(
        string memory _name,
        string memory _favoriteAnimeCharacter
    ) public {
        listOfPeople.push(Person(_favoriteAnimeCharacter, _name));
        nameToFavoriteAnimeCharacter[_name] = _favoriteAnimeCharacter;
    }
}


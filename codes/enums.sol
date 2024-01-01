//SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

contract test{
    
    //declaring an enumeration type named "FreshJuiceSize"
    enum FreshJuiceSize{SMALL, MEDIUM, LARGE}
    
    //declaring an enum variable named "choice" of type "FreshJuiceSize"
    FreshJuiceSize choice;

    //declaring an enum constant named "defaultChoice" of type "FreshJuiceSize"
    FreshJuiceSize constant defaultChoice = FreshJuiceSize.MEDIUM;

    function setLarge() public{
        choice = FreshJuiceSize.LARGE;
    }   
    function getChoice() public view returns(FreshJuiceSize){
        return choice;
    }
    function getDefaultChoice() public pure returns(uint){
        return uint(defaultChoice);
    }
}

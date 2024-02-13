//SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract myContract{
    uint public number1;

    function myFunction() public {
        uint num; // you don't have to declare a visibility modifier for variables inside functions
    }
    function newFunction() public returns (uint, address){
        uint num1 = 12;
        uint num2 = 13;
        number1 = num1 + num2;
        address myAddress = msg.sender;
        return (number1,myAddress);


    }

}

//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract MyContract{ // The first line is declaring a state variable
    uint public number1; // So the value number1 will be stored on the blockchain

    function myFunction() public { // This is a local variable
        uint num; // this function will not be available in the blockchain and will be available only inisde the function
    
    }
    
    // we'll be using view keyword since we won't be making changes to the state variabble and we are only declaring a local variable and setting its value to a local variable
    function newFunction() public view returns (address) { 
        address myAddress = msg.sender; // any person or any externally owned account calling this function will have his or her address in this global variable
        return myAddress;


    }


}

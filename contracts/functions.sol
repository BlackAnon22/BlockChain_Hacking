//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract myContract {
    
    uint public num; //by default num is set to zero

    function viewNum() public view returns (uint){ // we are trying to read the value of the state variable
        return num; // this returns the value of the  state variable
    }

    function addNumbers(uint a, uint b) public pure  returns (uint){ // this function is not reading any variable from the contract, it is doing its stuff in it's function. This is why you use the "pure" keyword
        uint c= a + b;
        return c;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract MyContract{
    uint8 number1; // 8 bytes
    uint16 number2; // 16 bytes
    uint32 number3; // 32 bytes
    uint number4; // 256 bytes, same as uint256

    int8 number5;
    int16 number6;
    int32 number7;
    int number 8;

    bool BooleanVar;

    address public myAddress; // the public keyword is a visibility modifier. 

    // There are four types of  visibility modifiers: public,private,internal and external

    // public:-Anyone can access it
    // private:-Only internal functions or the contract is the only one that can access the variable
    // internal:-Functions internally can access the variable
    // external:-The variable can be accessed only externally
}

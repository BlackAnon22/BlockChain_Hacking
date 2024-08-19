// This is one of the most common library that was used for a long time
 
// This works for a version below 0.8.0, so when you add 1 to 255, since we can't have 256 it'll start from the lowest number which is zero. 
// Deploying this with a version 0.8.0, actually gives an error, so it basically doesn't add it

// SPDX-License-Identifier: MIT
  
pragma solidity ^0.6.0;
 
contract SafeMathTester { 

    // 255 is the biggest number that can be fit in a uint8
    uint8 public bigNumber = 255; // unchecked
    function add() public { 
        bigNumber = bigNumber + 1; // this works for solidity versions before 0.8.0
    } 
}

 
// This should work for solidity versions 0.8.0 and higher

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeMathTester {

    // 255 is the biggest number that can be fit in a uint8
    uint8 public bigNumber = 255; // checked
    function add() public {
        unchecked {bigNumber = bigNumber + 1;} // this works for solidity versions from 0.8.0
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FallBack{
    uint256 public result;

    receive() external payable { 
        result = 1;
 
    }

    fallback() external payable {  
        result = 2;
    }
}

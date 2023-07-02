//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Storage{
    uint256 number;

    function get() public view returns (uint256){
        return number;
    }
    function set(uint256  num) public{ //calling the function is the same as setting a transaction
        number=num;
    }
    
}

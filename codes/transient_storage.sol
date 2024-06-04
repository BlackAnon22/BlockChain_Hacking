// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract TransientStorage {
    uint256 public persistentData;

    // Function that uses memory for transient storage
    function usetransientStorage(uint256 len) public pure returns(bytes memory) {
        // Transient storage
        bytes memory temporaryData = new bytes(len);

        // Do something with temporaryData
        for(uint256 i = 0; i < len; i++) {
            temporaryData[i] = bytes1(uint8(i));
        }

        return temporaryData;
    }
}
  

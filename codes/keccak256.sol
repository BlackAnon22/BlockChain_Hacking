// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Keccak256Example {
    // Function to compute the keccak256 hash of a given input
    function computeHash(string memory input) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(input));
    }

    // Function to generate a unique identifier using keccak256
    function generateUniqueId(string memory input1, uint256 input2) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(input1, input2));
    }
}

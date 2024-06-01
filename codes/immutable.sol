// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Immutables {

    address public immutable myAddress;
    uint256 public immutable myUint;

    constructor(uint256 _myUint) {
        myAddress = msg.sender;
        myUint = _myUint;
    }
}

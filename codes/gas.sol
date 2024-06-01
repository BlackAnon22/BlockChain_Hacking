// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Gas {

    uint256 public random = 0;

    function forever() public {

        while (true) {
            random += 1;
        }
    }
}

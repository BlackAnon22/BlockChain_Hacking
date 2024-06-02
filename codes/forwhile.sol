// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract forWhile {
    function loop() public pure {
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // skip to the next iteration with continue
                continue;
            }
            if (i == 5) {
                // exit the loop with break         
                break;
            }

            // while loop
            uint256 j;
            while (j < 10) {
                j++;
            }
            
        }
    }
}

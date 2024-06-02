// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract forWhile {
    function loop() public pure {
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // skip and continue to the next iteration
                continue;
            }
            if (i == 5) {
                
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

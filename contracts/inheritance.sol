//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage { //This inherits the functionalities of the SimpleStorage Contract

    function sayBankai() public pure returns(string memory) {
        return "Bankai";
    }

}

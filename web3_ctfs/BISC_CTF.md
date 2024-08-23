# Challenge Name: Safe Challenge

## Task

The task here is to get the flag


## Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Safe {
    address public owner;
    string private flag =  "bisc2023{FAKE_FLAG}"; //this data can be viewed on chain

    constructor() {
        owner = msg.sender; //owner is the deployer
    }

    function opensafe() public view returns (string memory) { 
        if(owner == msg.sender){ //checks of the function caller is the owner. Reverts if not owner
            return flag;
        }
        else {
            return "Your not owner!!";
        }
    }

    function changeOwner(address _owner) public {
        require(owner == msg.sender, "Your not owner!!"); //checks of the function caller is the owner. Reverts if not owner
        owner = _owner;
    }
}
```
Let me explain what this contract does
 

























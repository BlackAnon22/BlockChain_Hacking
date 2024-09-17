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

contract sendFunds {

    constructor(address payable _owner) payable {
        require(msg.value > 0, "Not enough");
        selfdestruct(_owner);
    }

}
```
The `sendFunds` contract transfers Ether to a specified address upon deployment and then self-destructs, ensuring the funds are sent and the contract is destroyed.

Lets get the contract address

![image](https://github.com/user-attachments/assets/ff7bd1b0-1d7a-4972-96f6-69c4bf0a0630)

Before we deploy the attack contract, we can check the balance of the contract

![image](https://github.com/user-attachments/assets/33e45c81-ead7-4ab1-8be7-30fb9f7b6fff)

We can deploy the attack contract using forge by passing the contract address and a value of 1 wei

![image](https://github.com/user-attachments/assets/c3aa926e-b47d-4952-be33-43cec88e222c)

Checking the balance again,

![image](https://github.com/user-attachments/assets/1e174b87-2d69-4ed7-9203-af2698fbeb93)

The balance of the contract is no longer zero

Submitting the instance

![image](https://github.com/user-attachments/assets/b48010ec-8671-4260-bc2c-424b60db04f6)

We have successfully completed this level

--------------------------------

Till Next Time :xD























# Task

Unlock the vault to pass the level!

# Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
    bool public locked;
    bytes32 private password;

    constructor(bytes32 _password) {
        locked = true;
        password = _password;
    }

    function unlock(bytes32 _password) public {
        if (password == _password) {
            locked = false;
        }
    }
}
```

This is a simple storage contract that starts in a locked state. It stores a private `password` and has a public `unlock` function that sets `locked` to `false` if the correct `password` is provided.

So, to beat this level, we need to find the password. This password is saved in a `private` variable. But then despite this being private we can still access everything in a smart contract

So to find the password we need to get the slot of the variable we want to read.

To learn more about slots, you can check [this](https://medium.com/@ozorawachie/solidity-storage-layout-and-slots-a-comprehensive-guide-2cee71817ed8)

To get the slots in our contract


```sol
contract Vault {
    bool public locked;      // slot 0
    bytes32 private password; // slot 1
}
```

- Simple variables like `bool`, `uint`, and `address` are usually assigned one slot each.
- Complex types like structs and mappings require understanding of their internal storage structure.

Lets start out by checking the contract address and contract abi

![image](https://github.com/user-attachments/assets/59c88270-9e0c-4058-adbc-0928f41fc7f9)

Now, we can try to read the password variable using foundry cast since we know the slot already to be `1`

![image](https://github.com/user-attachments/assets/b070f7f3-d6ff-4f62-8d97-0485a3e3ed16)

We got the password hehe, we can convert this to ascii using foundry cast

![image](https://github.com/user-attachments/assets/d96f2885-2d8a-4bb8-b4a8-5b4070ef9138)

Niceeeeeeeeeee, with this we can unlock this vault, but then before we unlock lets check the state of the lock

![image](https://github.com/user-attachments/assets/9245022b-b0b7-4142-9f0b-b4b992016de8)

The current state of the lock is 'true'

Lets unlock

![image](https://github.com/user-attachments/assets/b6b5339d-c307-4ed6-bdb3-ba3b889fa8a1)

Niceeeeeeeeee 

Checking the state of the lock again,

![image](https://github.com/user-attachments/assets/1e6b3a27-3b37-4157-bbcf-03ef8ee7160a)

We've successfully unlocked the vault

We can go ahead to submit our instance

![image](https://github.com/user-attachments/assets/e78f7c81-a66e-491a-8d24-eba28cd1a732)

---------

Till Next Time :xD

































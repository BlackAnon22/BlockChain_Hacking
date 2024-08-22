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













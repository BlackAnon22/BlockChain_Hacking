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
A constructor gets executed when the contract gets deployed, so whoever deployes the contract automatically becomes the owner. There's an error in the contract above that'll allow us claim ownership



































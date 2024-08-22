# Task
We need to take ownership of the contract and withdraw its balance.
<hr>

# Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback {
    mapping(address => uint256) public contributions;
    address public owner;

    constructor() {
        owner = msg.sender;
        contributions[msg.sender] = 1000 * (1 ether);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function contribute() public payable {
        require(msg.value < 0.001 ether);
        contributions[msg.sender] += msg.value;
        if (contributions[msg.sender] > contributions[owner]) {
            owner = msg.sender;
        }
    }

    function getContribution() public view returns (uint256) {
        return contributions[msg.sender];
    }

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    receive() external payable {
        require(msg.value > 0 && contributions[msg.sender] > 0);
        owner = msg.sender;
    }
}
```
<hr>

Let me explain what this contract does

```
This Solidity contract, Fallback, handles contributions and dynamic ownership transfer:

State Variables:

contributions: Tracks the ether contributed by each address.
owner: Holds the address of the current contract owner.

Constructor:

Initializes the contract with the deployer as the owner and sets their contribution to 1000 ether.

Functions:

contribute: Users can contribute less than 0.001 ether. If their total contribution surpasses the owner's, they become the new owner.
getContribution: Returns the calling user's contribution.
withdraw: Allows the current owner to withdraw all contract funds.
receive: Allows ether to be sent to the contract and transfers ownership if the sender has a contribution.
```






















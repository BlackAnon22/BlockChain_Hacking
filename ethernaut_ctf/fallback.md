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

Take a look at this part of the contract

```sol
receive() external payable {
        require(msg.value > 0 && contributions[msg.sender] > 0);
        owner = msg.sender;
    }
```

This too

```sol
function contribute() public payable {
        require(msg.value < 0.001 ether);
        contributions[msg.sender] += msg.value;
        if (contributions[msg.sender] > contributions[owner]) {
            owner = msg.sender;
        }
    }
```

The `receive()` function changes the owner of the contract to the `msg.sender(i.e the person that calls the contract)`, but then the requirement is that `msg.value` has to be greater than 0, also the `contributions[msg.sender]` (i.e the contribution is greater than 1) then we become the owner of the contract

The `contribute()` function is a payable function and it has a require statement, so if the `msg.value < 0.001 ether` it executes the next code. We can use this to check our contributions
 




















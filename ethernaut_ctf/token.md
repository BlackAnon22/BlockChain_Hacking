# Task
The goal of this level is for you to hack the basic token contract below.

You are given 20 tokens to start with and you will beat the level if you somehow manage to get your hands on any additional tokens. Preferably a very large amount of tokens.

# Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Token {
    mapping(address => uint256) balances;
    uint256 public totalSupply;

    constructor(uint256 _initialSupply) public {
        balances[msg.sender] = totalSupply = _initialSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balances[msg.sender] - _value >= 0);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
}
```

This level shows how to abuse arithmetic overflow and underflows

# Vulnerable Code

```sol
function transfer(address _to, uint256 _value) public returns (bool) {
        require(balances[msg.sender] - _value >= 0);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
```
This is a known vulnerability in solidity because the balances takes the mapping of an address to a uint256 and uint256 ranges from 0 to 2^256 -1. So, that `require` statement will always be true because a uint256 will always be greater than 0. Even if we specify an amount that ends up being a negative value the statement will always be true

```sol
balances[msg.sender] -= _value;
```
Here is where we can trigger an arithmetic underflow. If we specify a value greater than the balance we have, it'll yield a negative number which underflows and gives us a number greater than what we originally had

Lets get the contract address and contract abi

![image](https://github.com/user-attachments/assets/fd9053eb-7222-4a48-be00-18676a6242be)

We were given 20 tokens, lets confrim this

![image](https://github.com/user-attachments/assets/59ab2372-2ccf-44d6-b36b-4dabf6dbf700)




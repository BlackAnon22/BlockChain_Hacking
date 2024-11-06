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
The `Token` contract manages token balances. It initializes with a total supply assigned to the deployer and allows users to transfer tokens using the `transfer` function. It updates balances and ensures the sender has enough tokens before transferring. The `balanceOf` function returns the token balance of any address.

This level shows how to abuse arithmetic overflow and underflows

# Vulnerable Code

```sol
function transfer(address _to, uint256 _value) public returns (bool) {
        require(balances[msg.sender] - _value >= 0);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
```
This is a known vulnerability in solidity because the balances takes the mapping of an address to a uint256 and uint256 ranges from `0 to 2^256 - 1`. So, the `require` statement will always be true because a uint256 will always be greater than 0. Even if we specify an amount that ends up being a negative value the statement will always be true

```sol
balances[msg.sender] -= _value;
```
Here is where we can trigger an arithmetic underflow. If we specify a value greater than the balance we have, it'll yield a negative number which underflows and gives us a number greater than what we originally had

Lets get the contract address and contract abi

![image](https://github.com/user-attachments/assets/fd9053eb-7222-4a48-be00-18676a6242be)

Niceeeeee,

![image](https://github.com/user-attachments/assets/59ab2372-2ccf-44d6-b36b-4dabf6dbf700)

That's my balance right there, I have 20 tokens, so to beat this challenge we have to increase that number of tokens

![image](https://github.com/user-attachments/assets/11d77409-d698-4c81-84bb-171d79490ec3)

So, specify the contract address and then the value (which in our case is 21), so it's safe to say when this code gets executed

```sol
balances[msg.sender] -= _value;
```

We'll have something like this

```sol
20 - 21 which equals -1
```

Now, because we are using uint256 which doesn't take a negative value, this actually underflows

![image](https://github.com/user-attachments/assets/05a2d852-26e8-4c56-9f03-a980956b3e54)

Submitting the instance

![image](https://github.com/user-attachments/assets/3d35c15a-2c36-44b5-8216-80a57f8efd3f)

We have successfully completed this chlalenge

--------------------------------------

Till Next Time :xD























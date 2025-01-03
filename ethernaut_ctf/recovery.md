# Task

A contract creator has built a very simple token factory contract. Anyone can create new tokens with ease. After deploying the first token contract, the creator sent 0.001 ether to obtain more tokens. They have since lost the contract address.  
  
This level will be completed if you can recover (or remove) the 0.001 ether from the lost contract address.  
     

# Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Recovery {
    //generate tokens
    function generateToken(string memory _name, uint256 _initialSupply) public {
        new SimpleToken(_name, msg.sender, _initialSupply);
    }
}

contract SimpleToken {
    string public name;
    mapping(address => uint256) public balances;

    // constructor
    constructor(string memory _name, address _creator, uint256 _initialSupply) {
        name = _name;
        balances[_creator] = _initialSupply;
    }

    // collect ether in return for tokens
    receive() external payable {
        balances[msg.sender] = msg.value * 10;
    }

    // allow transfers of tokens
    function transfer(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] = balances[msg.sender] - _amount;
        balances[_to] = _amount;
    }

    // clean up after ourselves
    function destroy(address payable _to) public {
        selfdestruct(_to);
    }
}
```
This Solidity code defines two smart contracts: `Recovery` and `SimpleToken`.

1. Recovery Contract: It creates tokens by calling the generateToken function, which deploys a new instance of the SimpleToken contract, passing the token name, creator's address, and initial supply.

2. SimpleToken Contract:

      - Name: Holds the token's name.
      - Balances: Maps addresses to their token balance.
      - Constructor: Initializes the token by assigning the initial supply to the creator.
      - Receive Function: Automatically assigns tokens when Ether is sent to the contract, giving 10 tokens per Ether.
      - Transfer: Allows users to send tokens to another address.
      - Destroy: This function destroys the contract and sends any remaining Ether to a specified address.

This is a simple token system that allows the creation, transfer, and destruction of tokens while interacting with Ether.

Lets get the contract address and contract abi

![image](https://github.com/user-attachments/assets/8aa92366-829c-416e-b796-12157768b12b)

From the above screenshot, it's evident that the contract address we got is for the `Recovery` contract. This means we'll have to look for the contract address of the contract `SimpleToken`

I got the contract address of the `SimpleToken` contract using [etherscan](https://sepolia.etherscan.io/)

![image](https://github.com/user-attachments/assets/7b3e7da8-53ba-4eb0-a4b6-223a5071183f)
![image](https://github.com/user-attachments/assets/1dbd128b-63ec-4070-a52e-7c5b8b868c83)
![image](https://github.com/user-attachments/assets/f3675ddd-9957-46ee-90b3-c3df31335505)

These are the transactions that have gone through this contract

![image](https://github.com/user-attachments/assets/a7ab95a8-5074-46c3-82a0-8f315b901776)

We got the contract that the `Recovery` contract generated which is the `SimpleToken` contract. We can also see that it has a balance of `0.01 ether`. So, we have the contract address of the `SimpleToken` to be `0x8490A4d3C00D4a6eDBe1694abb4407e60Da9871D`

Now that we have the contract address the next thing to do is to withdraw the `0.01 ether` present in the lost contract, to do this we'll have to call the `destroy` function and then pass in our address.

![image](https://github.com/user-attachments/assets/d8222dfc-1f0b-40c7-82fd-646e8509f52c)

The transaction was a success, now lets check the contract balance again

![image](https://github.com/user-attachments/assets/ea39e656-6140-4ca5-9d75-56029a69e5b7)

We've successfully removed the 0.01 ether from the lost contract address

Submitting the instance

![image](https://github.com/user-attachments/assets/d9f2bee5-0908-4ccd-9ab8-094cdea054b0)

We have successfully completed this level

----------------------------------------------

Till next time :xD
















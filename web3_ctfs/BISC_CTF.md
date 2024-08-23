# Challenge Name: Safe Challenge

## Task

The task here is to get the flag

## Contract Address

0x5e992854Bd912ae170b7b5b8a64323e4e5E0feAF


## Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Safe {
    address public owner;
    string private flag =  "bisc2023{FAKE_FLAG}"; //this data can be viewed on chain

    constructor() {
        owner = msg.sender; //owner is the deployer
    }

    function opensafe() public view returns (string memory) { 
        if(owner == msg.sender){ //checks of the function caller is the owner. Reverts if not owner
            return flag;
        }
        else {
            return "Your not owner!!";
        }
    }

    function changeOwner(address _owner) public {
        require(owner == msg.sender, "Your not owner!!"); //checks of the function caller is the owner. Reverts if not owner
        owner = _owner;
    }
}
```
Let me explain what this contract does
 
The contract defines a simple smart contract called `Safe` with two main functions: `opensafe()` and `changeOwner()`.

- The constructor is a special function that runs once when the contract is deployed to the blockchain. The deployer of the contract becomes the owner, which is stored in the `owner` variable.

- The `opensafe()` function is a public view function that returns a string. If the caller of this function is the current owner of the contract (i.e., the address stored in `owner`), the function will return the `flag` string. If the caller is not the owner, it returns the string "Your not owner!!".

- The `changeOwner()` function allows the current owner to transfer ownership of the contract to a new address. It takes an address as an argument and checks if the caller is the current owner using a `require` statement. If the caller is the owner, the ownership is transferred to the new address; otherwise, the function reverts with the message "Your not owner!!".


The question now is, how can we get the flag??

We definitely can't get it using the `opensafe()` function because we aren't the owner of the contract

Since we have the contract address we can check the owner of the contract, bue then before we move on we have to understand how storage works in blockchain
























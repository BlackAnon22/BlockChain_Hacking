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

Since we have the contract address we can check the owner of the contract, bue then before we move on we have to understand how storage and slots works in blockchain

The flag is saved in a private variable. But then despite this being private we can still access everything in a smart contract

So to find the flag we need to get the slot of the variable we want to read.

To learn more about storage and slots, you can check [this](https://medium.com/@ozorawachie/solidity-storage-layout-and-slots-a-comprehensive-guide-2cee71817ed8)

To get the slots in our contract

```sol
contract Safe {
    address public owner; // slot 0
    string private flag =  "bisc2023{FAKE_FLAG}"; //this data can be viewed on chain // slot 1
```
- Simple variables like `bool`, `uint`, and `address` are usually assigned one slot each.
- Complex types like `structs` and `mappings` require understanding of their internal storage structure.

Now that we've determined the slots, we can start out by checking the owner of the contract I'll be using foundry cast for this

![image](https://github.com/user-attachments/assets/2e1d711d-5553-4f39-b7ef-ad792ccdeddc)

That's the current owner of the contract

We can't be the owner of the contract so we won't be going through that route

What we'll do is access the private variable

![image](https://github.com/user-attachments/assets/0e00ff35-b269-4829-bbaa-1e9c407c63e9)

We got that hex value

The value `0x000000000000000000000000000000000000000000000000000000000000005f` translates to the length of the string stored in the smart contract. The value `0x5f` in hexadecimal is equivalent to `95` in decimal, this indicates that the string stored is 95 bytes long. Since the string is longer than 31 bytes, Solidity stores the actual string data in a different storage slot. The slot where the data begins is determined by hashing the slot number using `keccak256`.

What we'll do now is calculate the hash of the slot number 1 to find out where the string data starts.

![image](https://github.com/user-attachments/assets/e3aa5219-1b79-4aa6-b628-36ca707d349e)

Now that we have the computed hash, we can check the actual data stored there

![image](https://github.com/user-attachments/assets/add4118d-07d0-41c8-a875-2a30d6a49348)

We got that hex value, lets convert to ascii

![image](https://github.com/user-attachments/assets/72fb24ae-8a45-4f6d-aa72-ef5e8963a60b)

We found half the flag

To get the other parts of the flag we'll check the next slot, so instead of using the hash ```0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6``` we'll add ```1``` to it, which gives us ```0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf7```

Lets check what data is stored there

![image](https://github.com/user-attachments/assets/0d2ebcbe-ec4b-49ef-8862-3bc83425074a)

We got a hex value, lets convert to ascii

![image](https://github.com/user-attachments/assets/e81edb74-3a54-4d99-85cd-3264803fb999)

Found the last part of the flag😎

FLAG:-```bisc2023{W0w_f0und_The_6aCk_do0r_t0_th3_5af3!!}```

-------------------------------

Till next time :xD















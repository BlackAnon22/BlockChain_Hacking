# Task

Unlock this contract to beat the level.

# Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Privacy {
    bool public locked = true;
    uint256 public ID = block.timestamp;
    uint8 private flattening = 10;
    uint8 private denomination = 255;
    uint16 private awkwardness = uint16(block.timestamp);
    bytes32[3] private data;

    constructor(bytes32[3] memory _data) {
        data = _data;
    }

    function unlock(bytes16 _key) public {
        require(_key == bytes16(data[2]));
        locked = false;
    }

    /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
    */
}
```
## Breakdown of the contract

1. **State Variables:**
    
- `bool public locked = true;`: This is a boolean variable that is initially set to `true`. The purpose of the contract is to unlock it by setting it to `false`.
- `uint256 public ID = block.timestamp;`: This stores the timestamp of the block at the time of the contract's deployment.
- `uint8 private flattening = 10;`: A private unsigned integer with a value of `10`.
- `uint8 private denomination = 255;`: A private unsigned integer with the maximum value for an `uint8`.
- `uint16 private awkwardness = uint16(block.timestamp);`: This stores the current timestamp as a `uint16` integer.
- `bytes32[3] private data;`: This is a private array that holds three `bytes32` values.

2. **Constructor:**
 ```sol
   constructor(bytes32[3] memory _data) {
    data = _data;
}
```
- The constructor initializes the `data` array with the values passed to it during deployment.

3. **Unlock Function:**
```sol
function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
}
```
- The `unlock` function takes a `bytes16` key as input.
- It checks if the passed key matches the first 16 bytes of the third element (`data[2]`) in the `data` array.
- If the condition is true, it sets `locked` to `false`, effectively unlocking the contract.



Lets grab the contract address and contract abi

![image](https://github.com/user-attachments/assets/9273b920-e316-4745-b046-b649f12187f4)

Now that we have the contract address lets check the state of the lock by calling the "locked" function

![image](https://github.com/user-attachments/assets/f138dad3-9f54-4f8d-bbd1-72b1c757d8bf)

So to complete this level, the state of this lock should return "false"

Before we move on we have to understand how storage works, to know more about storage and slots you can check this [article](https://medium.com/@ozorawachie/solidity-storage-layout-and-slots-a-comprehensive-guide-2cee71817ed8).

![image](https://github.com/user-attachments/assets/9917f89d-4b7b-4c0f-9095-3ed7146bd02d)

why does the variable `flattening`, `denomination` and `awkwardness` occupy slot 2??

State variables of contracts are stored in storage in a compact way such that multiple values sometimes use the same storage slot. A storage slot can store exactly 32 bytes (or 256 bits) and if a value type does not fit the remaining part of a storage slot, it is stored in the next storage slot.

Why does `bytes32` occupy slot 3-5??

Well, this is because `bytes32[3] private data;` holds three `bytes32` values.

![image](https://github.com/user-attachments/assets/4694b10d-061a-4e0b-a1a9-44708ddd2c3e)

The next thing to do will be to grab the data that is being stored in `data[2]` as this is the key that'll help us unlock the contract. We can do this using foundry cast

![image](https://github.com/user-attachments/assets/bc1242e2-9764-4fc7-aec2-4a426ffdbf34)

That's the actual data that is being stored in that slot which is the key, but then it's in `bytes32`. To unlock the contract we need to pass in a `bytes16` key, so what we need to do is to extract the first 16 bytes of the value. We can do this using bash

We'll store the `bytes32` value in a variable

![image](https://github.com/user-attachments/assets/72548139-e538-495a-8c0f-2d2e7e4a9f94)

Then we extract the first 16 bytes

![image](https://github.com/user-attachments/assets/e59cb379-a753-4047-89d9-e2118532f8f7)

Explanation:

- `echo $data` outputs the value of the `data` variable.
- `sed 's/0x//'` removes the `0x` prefix.
- `s/.\{32\}$//` removes the last 32 characters (16 bytes) to keep the first 16 bytes.

Now that we have the value in `bytes16` we can unlock this contract

![image](https://github.com/user-attachments/assets/a30f0146-cf8f-498a-ae7f-e05d1689522b)

Checking the state of the lock again,























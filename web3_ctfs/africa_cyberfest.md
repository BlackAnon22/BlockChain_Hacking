# Challenge Name: BlockHeist

## Task

Nuk's crypto assets makes him a diety to some.

We have to show the world he got it through illegal means.

You have to pull the hack off too

Goodluck

## Contract Address

0x2876ad7baf96864c992150ff16f909ab12440adb


## Contract

```sol
// Stripped to only important sections of contract source code
pragma solidity ^0.7.6;

contract Haxor {
    mapping (address => uint256) private userBalances;
    uint8 public TOKEN_PRICE = 2 wei;
    function buy(uint256 _tokenToBuy) external payable {
        require(
            msg.value == _tokenToBuy * TOKEN_PRICE, 
            string(abi.encodePacked("error ", _tokenToBuy, msg.value))
        );

        userBalances[msg.sender] += _tokenToBuy;
        TOKEN_PRICE++;
    }
    function getUserBalance(address _user) external view returns (uint256) {
        return userBalances[_user];
    }
```

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

Lets start out by getting my balance 

![image](https://github.com/user-attachments/assets/c23e017b-8a1f-4bda-b086-0c967176d343)

Checking the contract balance

![image](https://github.com/user-attachments/assets/18d6dcfb-5240-416e-806a-4688e4b89d4a)

The balance in the contract is ` 0.0055 ETH`

--------------------

# Challenge Name: ByteOps

![image](https://github.com/user-attachments/assets/50f367dd-1c05-474f-b98f-83e7f53ff827)

Upon downloading the file I got this value

```
6182665f351415600b57005b5f80fd
```














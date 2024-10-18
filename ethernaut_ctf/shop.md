# Task

Сan you get the item from the shop for less than the price asked?

# Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Buyer {
    function price() external view returns (uint256);
}

contract Shop {
    uint256 public price = 100;
    bool public isSold;

    function buy() public {
        Buyer _buyer = Buyer(msg.sender);

        if (_buyer.price() >= price && !isSold) {
            isSold = true;
            price = _buyer.price();
        }
    }
}
```

![image](https://github.com/user-attachments/assets/2dbd4a6e-c18f-44e0-ac06-ec1d7d4931a0)


























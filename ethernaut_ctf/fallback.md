# Task
We need to take ownership of the contract and withdraw its balance.
<hr>

# Contract

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback {
    mapping(address => uint256) public contributions;
    address public owner;

    constructor() {
        owner = msg.sender;
        contributions[msg.sender] = 1000 * (1 ether);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function contribute() public payable {
        require(msg.value < 0.001 ether);
        contributions[msg.sender] += msg.value;
        if (contributions[msg.sender] > contributions[owner]) {
            owner = msg.sender;
        }
    }

    function getContribution() public view returns (uint256) {
        return contributions[msg.sender];
    }

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    receive() external payable {
        require(msg.value > 0 && contributions[msg.sender] > 0);
        owner = msg.sender;
    }
}
```
<hr>

Take a look at this part of the contract

```sol
receive() external payable {
        require(msg.value > 0 && contributions[msg.sender] > 0);
        owner = msg.sender;
    }
```

This too

```sol
function contribute() public payable {
        require(msg.value < 0.001 ether);
        contributions[msg.sender] += msg.value;
        if (contributions[msg.sender] > contributions[owner]) {
            owner = msg.sender;
        }
    }
```

The `receive()` function changes the owner of the contract to the `msg.sender(i.e the person that calls the contract)`, but then the requirement is that `msg.value` has to be greater than 0, also the `contributions[msg.sender]` (i.e the contribution is greater than 1) then we become the owner of the contract

The `contribute()` function is a payable function and it has a require statement, so if the `msg.value < 0.001 ether` it executes the next code. We can use this to check our contributions
 

Now lets solve this,

Lets get the contract's abi

![image](https://github.com/user-attachments/assets/f2bd28ca-1871-4792-aae0-964e837913d1)

Now that we have the abi we can move on to checking the current owner of the contract

![image](https://github.com/user-attachments/assets/384392b6-42be-4ad6-966e-7c8648582659)

That's the current owner of this contract

The first goal will be to claim ownership of this contract, after that we can try withdrawing funds

Lets check the number of contributions

![image](https://github.com/user-attachments/assets/d22671f0-5a32-4b5d-8559-1abc038aa704)

We have 0 contributions

Lets contribute

![image](https://github.com/user-attachments/assets/3aa17695-ad6f-4269-816f-f01ba521ddaa)

Now lets check our contributions again

![image](https://github.com/user-attachments/assets/47dbaa29-1a21-41cb-a826-f3ae4af36999)

Nice Nice, The next thing to do now is to own the account and to do that we have to meet the next condition which is to pay money to the contract `msg.value > 0` so it must be greater than 0

![image](https://github.com/user-attachments/assets/3d0af4b1-a16c-4c8e-9da3-2196d069d28b)

Lets check the owner of the contract now

![image](https://github.com/user-attachments/assets/1b53fd80-a743-496b-910f-29480aaea5fe)

Niceeeeeeeeeeeeee, we became the owner

We can now withdraw funds

![image](https://github.com/user-attachments/assets/a572e366-f390-4f2c-9eb2-9c0abb99fe42)

To confirm that the funds has been withdrawn

![image](https://github.com/user-attachments/assets/8e7f998b-e96c-4a5e-b1c2-7f946bc2c091)

We can go ahead to submit our instance

![image](https://github.com/user-attachments/assets/2d2983b9-1832-4f6b-a8f3-6c884e0dc7da)


-------------------------------------

Till Next Time :xD









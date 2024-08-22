# Task

The task here is to look into the level's info method `contract.info()` or `await contract.info()`
<hr>

# Contract

There's no contract code
<hr>


First lets check the contract's address and abi

![image](https://github.com/user-attachments/assets/5433bfb6-1e0b-42c1-ad04-8dfb34f0b0ec)

We have our contract address already, we also can see that we have 10 functions and 1 constructor. 

The first task is to look into the ```info``` method, which basically gives us instructions on what to do next.

I solved this using foundry cast

```
cast call 0xC7604910af9c13A9fc9d3A293d19Ef5F6cC28e86 "info()(string)"
```

- **cast**: command-line tool for performing Ethereum RPC calls.
- **call**: call the contract function.
- **0x7520cce24AdF1a50dc8Fd2945d4a5EF59D7560DA**: Contact Address where smart contract is deployed.
- **info()**: Function name in the deployed contract.
- **string**: Contract gives the output in hex format, rather than converting it to ASCII in a later step we can pass the string command to give output in ASCII format.

To beat this challenge

![image](https://github.com/user-attachments/assets/918c9a8e-4f3a-4f7c-b144-8ac8207fc288)

The next thing to do is to authenticate that password using the `authenticate` method

To authenticate we'll need the private key of our metamask

 To get the metamask private key, click on the metamask extension -> Three dots on your metamask -> Account Details -> Export Private Key.

![image](https://github.com/user-attachments/assets/56b0f1c7-4e0e-4690-a11e-1dc13b051f4b)

Now that we've sent the transaction to the chain we can now submit the instance

![image](https://github.com/user-attachments/assets/08df4f21-1363-4dbb-9ec6-6c5a35d51a28)








 

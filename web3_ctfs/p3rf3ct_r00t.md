# Contract Address
 
0x5E4728870e3C2b05df8966A8719819f079C1711f
<hr>   
 
![image](https://github.com/user-attachments/assets/3f756369-339d-4917-8245-a8da935781f6)

Checking the contract file   
 
![image](https://github.com/user-attachments/assets/cf9dca96-1c7e-429a-a3ef-c9c10528cabf)
 
This is a simple contract actually     

What does this contract do?? 
  
The`P3rf3ctFlag` smart contract defines a private uint256 variable `_flag`, initialized via the constructor. It includes a `setFlag` function, which takes a uint256 argument but doesn't modify or interact with the state; it simply returns true. The contract currently serves no functional purpose beyond storing the `_flag` value upon deployment.

How did I get the flag??

There's nothing private when it comes to the blockchain actually, this is because we have something called `storage`, I've explained this in the `ethernaut ctf` section.

The private variable `_flag` is stored in a slot of index `0`, so I can call the content of this variable by using foundry cast

![image](https://github.com/user-attachments/assets/dbea117a-d9e7-4f16-a002-d8892c5bcacf)

Easy Peasy Right??:)

FLAG:-```r00t{bl0ck_3xpl0r3rs_3xp0s3_4l05_init}```

-----------------------------------------------

Till Next Time :xD

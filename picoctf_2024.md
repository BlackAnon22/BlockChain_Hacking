My teammates(LocalMen) and I participated in the picoCTF_2024 organized by Carnegie Mellon University, which took place between March 12, 2024 to March 26, 2024. It was a great learning experience and I really learnt a lot.

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/fd900f40-a20f-4ef3-9793-118345219d87)
![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/7ea096f1-898f-482f-ada4-e27c10639cbe)

This is a writeup of the challenges I solved during the event



# Challenges Solved
## General Skills
-      Super SSH (25 points)
-      Commitment Issues (50 points)
-      Time Machine (50 points)
-      Blame Game (75 points)
-      Collaborative Development (75 points)
-      binhexa (100 points)
-      Binary Search (100 points)
-      endianness (200 points)
-      dont-you-love-banners (300 points)
-      SansAlpha (400 points)


## Web Exploitation
-     Bookmarklet (100 points)
-     WebDecode (100 points)
-     IntroToBurp (100 points)
-     Unminify (200 points)
-     No Sql Injection (300 points)
-     Trickster (300 points)
-     Elements (500 points)


## Forensics
-     Scan Surprise (50 points)
-     Verify (50 points)
-     CanYouSee (100 points)
-     Secret of the Polygot (100 points)
-     Mob Psycho (200 points)
-     endianness-v2 (300 points)
-     Blast from the Past (300 points)
-     Dear Diary (400 points)


## Cryptography
-     interencdec (50 points)
-     rsa_oracle (300 points)

## Reverse Engineering
-      packer (100 points)





# General Skills

##  Super SSH (25 points)
<hr>

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/6fb1149c-36bd-48de-aa48-59608593e232)

For this task they provided us with the username, the port the ssh service is running on, the domain to connect to and then the password. So, we can use all this to connect to the remote instance via ssh

command:```ssh ctf-player@titan.picoctf.net -p 49566```

```
┌──(bl4ck4non👽bl4ck4non-sec)-[~/Downloads/CTF/picoCTF_2024]
└─$ ssh ctf-player@titan.picoctf.net -p 49566
ctf-player@titan.picoctf.net's password: 
Welcome ctf-player, here's your flag: picoCTF{s3cur3_c0nn3ct10n_45a48857}
Connection to titan.picoctf.net closed.
```
Well, connecting to the ssh instance gave us the flag

FLAG:- ```picoCTF{s3cur3_c0nn3ct10n_45a48857}```

------------------------------------------------

## Commitment Issues (50 points)
<hr>

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/ad849b47-3413-4552-bd85-4f9b5ea3bb88)

Download the challenge file and unzip

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/d937b226-792f-46cc-93f3-2e7df0f5cdcc)

We actually have lots of files here and they all are git files, we were told from the challenge description that "he deleted the flag he accidentally wrote down". To view the changes made to this git files we can use the command ```git show```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/323e2132-15b1-460e-9344-912cc9351999)

Well, that's our flag there 

FLAG:- ```picoCTF{s@n1t1z3_c785c319}```

----------------------------------------

## Time Machine (50 points)
<hr>

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/2983efd3-7e87-40a3-b215-e275eb8a6e48)

Download the challenge file and unzip

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/99c86e02-4157-4d1f-abd8-5f9fb750801b)

We've got some git files here also, just like in the previous challenge the ```git show``` command helps us inspect files in the git repository

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/153eb578-6769-4cde-b7ee-3bc1ebd001ee)

We got our flag

FLAG:- ```picoCTF{t1m3m@ch1n3_e8c98b3a}```

-----------------------------------

## Blame Game (75 points)
<hr>

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/5eaae91a-3401-429f-b37e-3a8c8725ffea)

Download the challenge files and unzip

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/b26fa3e5-71e1-4007-9b26-0cd38ce78735)

unlike the previous challs the files for this chall are much, from the challenge description we are to look for the commit that's preventing the program from working. Well, ```git show``` won't work in this case actually. The guy we'll be needing in a situation like this is "grep", I called him already he's on his way hehe

command:```grep -ir "picoCTF{```

```
┌──(bl4ck4non👽bl4ck4non-sec)-[~/…/CTF/picoCTF_2024/general_skills/blame_game]
└─$ cd drop-in 
                                                                                                                                                                                                                                             
┌──(bl4ck4non👽bl4ck4non-sec)-[~/…/picoCTF_2024/general_skills/blame_game/drop-in]
└─$ grep -ir "picoCTF{"
.git/logs/HEAD:caa945839a2fc0fb52584b559b4e89ac7c46bf54 8c83358c32daee3f8b597d2b853c1d1966b23f0a picoCTF{@sk_th3_1nt3rn_2c6bf174} <ops@picoctf.com> 1710202031 +0000    commit: optimize file size of prod code
.git/logs/refs/heads/master:caa945839a2fc0fb52584b559b4e89ac7c46bf54 8c83358c32daee3f8b597d2b853c1d1966b23f0a picoCTF{@sk_th3_1nt3rn_2c6bf174} <ops@picoctf.com> 1710202031 +0000       commit: optimize file size of prod code
```
We got our flag😎

FLAG:- ```picoCTF{@sk_th3_1nt3rn_2c6bf174}```

-------------------------------------

## Collaborative Development (75 points)
<hr>

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/216a43a5-97a7-4cf1-acfa-a44d6d17d256)

Download the challenge file and unzip

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/ba13d003-3c6a-4a70-8d45-bbc12bd69100)

We'll be using the "Git Extractor" tool for this, you can download it [here](https://github.com/internetwache/GitTools/blob/master/Extractor/extractor.sh)

To run the tool

command:```bash extractor.sh drop-in <folder you want the output to be stored at>```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/c00c6ae9-9e9f-408d-8847-7f3bdfb41d5e)

We have 4 folders here, checking each folder we have this

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/1f7036b7-0751-4113-9fbc-1fad5671457b)

The flag was scattered amongst the folder so all you have to do is rearrange i

FLAG:- ```picoCTF{t3@mw0rk_m@k3s_th3_dr3@m_w0rk_6c06cec1}```

---------------------------------------

## binhexa (100 points)
<hr>

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/ad3d7949-8845-4788-9f19-03dd2c1bd9d5)

They gave us the challenge instance to connect to 

command:```nc titan.picoctf.net 49964```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/4be20ba1-a191-4942-b54f-ca6058777bd1)

So we are meant to search for the flag here, to get the flag we have to perform the unique operations. We can use this [website](https://www.rapidtables.com/calc/math/binary-calculator.html)

Using that website should get you to the last task, lets solve for the first task

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/2a325e0f-c45b-4ffe-8a77-271efcd36ce3)
![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/42db7bca-c7dc-493d-8201-819af59011cf)
![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/757e6d55-9204-4036-b4bf-1093d741c1e7)

To enter the result of the last operation which is ```000100111110``` to hex, we can use this [website](https://www.rapidtables.com/convert/number/binary-to-hex.html)

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/1a0136b1-253a-42fb-bc73-6546090feefc)
![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/6446514f-1b48-4479-b106-0fe0b7c5dcbb)

We got our flag

FLAG:- ```picoCTF{b1tw^3se_0p3eR@tI0n_su33essFuL_d6f8047e}```

------------------------------------------

## Binary Search (100 points)
<hr>

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/ac044467-2657-46f0-9e3a-e249761fde79)

When you launch the instance

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/4ff55a79-b2ac-4893-9637-055772c96a1e)

Since we have the username and password we can connect to the challenge instance using ssh as stated there

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/f114f75e-4551-4c83-b847-bc182ee2b75d)

This is a game where you guess numbers, well I've seen this chall before during the "cyberstarters CTF" last year so it was quite easy to figure out.

First thing you do is basically start from the middle, so lets start with say ```500```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/ad0c4e07-5fc5-4397-b438-259ddb31a81b)

We have to go lower, now lets use ```400```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/7ca24694-6e44-4e9e-99b3-f807790baa49)

Now, we are meant to go higher, now lets use ```450```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/1a5071c3-b16d-4ce8-92c6-30eb7b7a66d7)

We have to go higher, this means the number is between ```450``` and ```500```, lets use 470

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/2832e0e0-2ea5-48ee-a3b5-e5bf3b0d170f)

Higher again, lets use ```480```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/be301df5-954d-433c-8eb7-dcb236de884f)

Higher again, lets use ```490```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/284a719a-76f7-4c9d-bb76-a7d2f2b78fba)

Lower, so the right number is between ```480``` and  ```490```. Lets use ```485``` this time

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/ca59e739-4c69-48e7-bacb-9472a4fe4c99)

Higher, nice, lets use ```489```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/3e0819a9-c4d4-4e5d-92a2-abf637ec931a)

Lower, we've narrowed the right number between ```485``` and ```489```. Now, we'll just try ```486```,```487``` and ```488```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/4515bde2-24de-470d-b589-2d4d316f21ff)

```486``` worked hehe.

FLAG:- ```picoCTF{g00d_gu355_1597707f}```

-----------------------------------

## endianness (200 points)
<hr>

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/e72dc0e7-e95f-459f-b1cf-5388acb16aa1)

Lets connect to the challenge instance

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/6282c3b7-ba21-43f7-94e0-05a64cc67b5d)

So we are meant to find the little endian and big endian representations of a word

To do this you can use this [website](https://learnmeabitcoin.com/technical/general/little-endian)

First we have to convert the word ```wjsyg``` to hex. You can do that using [cyberchef](https://gchq.github.io/CyberChef/)

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/8375c753-892f-4b62-a7c7-e22c2370bbb5)

So we have this ```776a737967```, now we'll convert this to the Little Endian representation

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/504ac22b-3ece-48c5-ace1-c398bce9be9f)

There you have it,

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/c90dabc5-d9c5-4212-a2ca-22c1f3c507eb)

It worked, now for the Big Endian representation

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/ece19dcb-f472-4b4e-9a88-f430095e1498)

Yup, that's it

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/769a6935-6ba3-4f5b-90e2-107c705dd8b5)

We got our flag. You can read more about Little and Big Endians [here](https://www.techtarget.com/searchnetworking/definition/big-endian-and-little-endian)

FLAG:- ```picoCTF{3ndi4n_sw4p_su33ess_25c5f083}```

---------------------------------

## dont-you-love-banners (300 points)
<hr>

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/c89ee0f3-fee9-4c61-8d62-9b8ae8eaebf7)

In this chall, we have 2 instances, in the first instance some crucial information has been leaking while the second instance is to connect to the running application.

Well, lets connect first with the instance that has been leaking crucial information

command:```nc tethys.picoctf.net 54896```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/4481394a-f2aa-4e19-94b4-69c2a194daaa)

We actually got a password from the server, well lets keep that somewhere.

Now, lets connect to the running application

command:```nc tethys.picoctf.net 49671```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/7dad4803-9906-448b-9559-f77dc8e3d0c7)

We were asked for a password, using the password we got from the first instance

password:```My_Passw@rd_@1234```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/1d21f354-5ece-4d02-8fcd-88d3a89d23ba)

The answer to this question is ```Defcon```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/6ed010a3-e5e5-469e-8113-71b66d5decbc)

The answer to this last one is ```John Draper```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/4fcfea4e-b75a-47a1-8c59-8299d9a98226)

Now that we are in, lets go ahead to escalate our privileges.

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/61990c80-72c7-4120-8941-b94241952111)

smooth, we have the hash for the root user, well lets crack it using "brother john"😂

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/c119f7e3-b819-4e8a-8bb7-e3570b5cf7c3)

We got the password to be ```iloveyou```, with this password we can actually switch user

command:```su root```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/ce2019ca-704b-463f-a687-b18e9f916550)

That's our flag right there

FLAG:- ```picoCTF{b4nn3r_gr4bb1n9_su((3sfu11y_f7608541}```

---------------------------------------

## SansAlpha (400 points)
<hr>

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/b16721ed-dde3-4b0f-9aa0-b742982243fc)

Alright so, in this task we have a bash shell but then we can't use alphabets, only numbers and (most) symbols are allowed. 

Lets connect to the challenge instance

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/4aa6ccb5-83f4-426b-821d-c81bccccb09d)

Well, as you can see we can't use any characters here hehe.

What we'll make use of here is something known as wildcards

```
Wildcards are characters used in shell commands to represent one or more other characters. They're commonly used in file management commands to specify patterns of filenames that you want to match. Here are some common wildcards:

* (asterisk): Matches any sequence of characters, including none.
? (question mark): Matches any single character.
[ ] (square brackets): Matches any one character within the specified range or set.
Here's how they work in practice:

*: Matches zero or more characters.
Example: *.txt matches any file ending in .txt.
?: Matches exactly one character.
Example: file?.txt matches file1.txt, fileA.txt, but not file12.txt.
[ ]: Matches any one character within the specified range or set.
Example: [123].txt matches 1.txt, 2.txt, or 3.txt.
```
The wildcard I used for this chall is the question mark.

lets test this on my terminal first before we go the challenge instance

```
┌──(bl4ck4non👽bl4ck4non-sec)-[~/Downloads/CTF/picoCTF_2024/general_skills]
└─$ ~/??
                                                                                                                                                                                                                                             
┌──(bl4ck4non👽bl4ck4non-sec)-[~/go]
└─$ ~/????
zsh: permission denied: /home/bl4ck4non/Demo
                                                                                                                                                                                                                                             
┌──(bl4ck4non👽bl4ck4non-sec)-[~/go]
└─$ ~/??????
zsh: permission denied: /home/bl4ck4non/Public
                                                                                                                                                                                                                                             
┌──(bl4ck4non👽bl4ck4non-sec)-[~/go]
└─$ ~/?????????               
zsh: permission denied: /home/bl4ck4non/Documents
```
Good, now lets test this on the challenge instance, lets see if it'll help us with the directory structures

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/e0355e04-4df3-45c0-a2cd-abab0a0b1537)

So there's a directory ```/home/ctf-player/blargh```

Lets keep digging, lets check for sub-directories this time

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/1ec7c857-a3cc-4f06-a748-83fd2707aefc)

So inside the ```blargh``` directory we have ```flag.txt``` and some bunch of other files.

Now, how can we read the ```flag.txt``` file????

Well, lets go back to my terminal. To check for available binaries, binaries like ```base32```,```base64```,```awk```,```cat```,```

```
                                                                                                                                                                                                                                             
┌──(bl4ck4non👽bl4ck4non-sec)-[~/…/CTF/picoCTF_2024/general_skills/sansalpha]
└─$ nano bankai.txt
                                                                                                                                                                                                                                             
┌──(bl4ck4non👽bl4ck4non-sec)-[~/…/CTF/picoCTF_2024/general_skills/sansalpha]
└─$ cat bankai.txt 
flag{y0u_c4n't_catch_m3}
                                                                                                                                                                                                                                             
┌──(bl4ck4non👽bl4ck4non-sec)-[~/…/CTF/picoCTF_2024/general_skills/sansalpha]
└─$ /usr/bin/awk bankai.txt
awk: cmd. line:1: bankai.txt
awk: cmd. line:1:       ^ syntax error
                                                                                                                                                                                                                                             
┌──(bl4ck4non👽bl4ck4non-sec)-[~/…/CTF/picoCTF_2024/general_skills/sansalpha]
└─$ /usr/bin/base32 bankai.txt
MZWGCZ33PEYHKX3DGRXCO5C7MNQXIY3IL5WTG7IK
                                                                                                                                                                                                                                             
┌──(bl4ck4non👽bl4ck4non-sec)-[~/…/CTF/picoCTF_2024/general_skills/sansalpha]
└─$ /usr/bin/base64 bankai.txt
ZmxhZ3t5MHVfYzRuJ3RfY2F0Y2hfbTN9Cg==
                                                                                                                                                                                                                                             
┌──(bl4ck4non👽bl4ck4non-sec)-[~/…/CTF/picoCTF_2024/general_skills/sansalpha]
└─$ /usr/bin/strings bankai.txt
flag{y0u_c4n't_catch_m3}
```
Now, lets confirm if we can use these binaries to read the ```flag.txt``` files on the challenge instance

So to read with strings we can try something like this ```/usr/bin/strings ~/blargh/flag.txt```, using wildcards we have this ```/???/???/????? ~/??????/????????```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/cf39c08c-4e0c-428e-8304-57fc948fd8fc)

So we don't have ```strings``` available.

Lets try the base64 binary, we can do something like this ```/usr/bin/base64 ~/blargh/flag.txt```, using wildcards we have this ```/???/???/????64 ~/??????/????????```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/13a26511-edea-4200-8fa3-6b8c040ac483)

Also didn't work. Lets check out the last binary. We can try this ```/usr/bin/base32 ~/blargh/flag.txt```, using wildcards we have ```/???/???/????32 ~/??????/????????```

![image](https://github.com/BlackAnon22/BlockChain_Hacking/assets/67879936/f7e1c553-a08c-4ad4-96d7-d9e399377a07)

Lets decode this

command:```echo "OJSXI5LSNYQDAIDQNFRW6Q2UIZ5TO2BRGVPW25JRG4YXMM3SGUZV6MJVL5WTIZDOGM2TKXZUHE2DKNRTGBQX2===" | base32 -d```

```
┌──(bl4ck4non👽bl4ck4non-sec)-[~/…/CTF/picoCTF_2024/general_skills/sansalpha]
└─$ echo "OJSXI5LSNYQDAIDQNFRW6Q2UIZ5TO2BRGVPW25JRG4YXMM3SGUZV6MJVL5WTIZDOGM2TKXZUHE2DKNRTGBQX2===" | base32 -d
return 0 picoCTF{7h15_mu171v3r53_15_m4dn355_4945630a}
```
We got our flag😎

FLAG:- ```picoCTF{7h15_mu171v3r53_15_m4dn355_4945630a}```

------------------------------------------------------





































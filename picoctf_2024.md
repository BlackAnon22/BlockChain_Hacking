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














































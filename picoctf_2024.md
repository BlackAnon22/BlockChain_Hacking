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


























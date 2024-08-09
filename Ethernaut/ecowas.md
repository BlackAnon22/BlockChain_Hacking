# Logusus
<hr>

`1.png`

## PortScan

Lets use rustscan

command:```rustscan -a 10.8.0.2 -- -A```

`2.png`

We have 2 open ports, port 22 which runs the ssh and port 80 which runs the http service. Our enumeration will be focuesed on port 80

## Enumeration (Port 80)

Navigating to the webpage

```3.png```

We have a login page, but then we don't have a username and password

`4.png`
`5.png`

Checking the ```/profile``` directory, we see this

`6.png`

So we have `Dashboard`,`Swagger`,`IAM`,`Profile` and `About`

Lets check the Dashboard

```7```

You can see we don't have any data available, this is because we are not logged in actually

Lets check for Swagger

`8`

Ladies and Gentlemen with us here is an API target hehe

Lets start with this endpoint ```/api/v1/user/public```

`9`

We got emails and ids for 2 users, user `lilian` and user `elian`

Checking Swagger again, we have this endpoint

`10`

So we can do a password change for users once we know their user id, since we have 2 user ids, we can try to change password for one of the users.

Lets change password for user ```lilian```

`11`

You should get this response after executing

`12`

Niceeee, now we can login as user ```lilian```

```
login: lilian.mcclure@logusus.sec-dojo.com
password: Password123
```

`13`
`14`

Now that we are logged in, lets enumerate further

Going back to Swagger you should get this

`15`

Good, lets continue

`16`

In the response you got, you should see this

`17`

This means we have 5 users in total, one of the user has an access level of 50, two of those users has an access level of 99, while the last two users have an access level of 1.

From swagger we can try to update the access level of a particular user, all we need is the token and email of that user. Since we have lilian's token lets try to update her access level

`18`

Lets execute this

`19`

From the above screenshot, we can see that we don't have the permisson to update a user access leve, well this is because we don't have managerial permissions



Now this is where it gets crazy😂, I did a bit of roundabout💀😂

Have you ever seen a directory traversal using a file upload path??

Well, let me show you, this might be unintended though

I actually figured this out after solving the lab, did a bit of experiment after solving the lab. That was when I found out that I had been trapped in a Genjutsu😅.

Lets get the flag😎

Since we have an account as user lilian, from swagger we can try to change the user's avatar

This is what we'll do
```
1. upload an image file
2. capture the request on burpsuite, send to repeater then clear the contents of that png file
3. we'll edit the name of the file and perform a directory traversal
```
All we need to achieve this is just lilian's token, and to get this token you can just click on "copy token" 

`20`

Checking burpsuite

`21`

I had this, so I sent it over to repeater

`22`

Now we can clear the content of this png file

`23`

Yup, something like that

It's time for some directory traversal, since we know that the user flag is located in ```/home/local.txt``` and the root flag is located in ```/root/proof.txt```, we'll edit ```sqli.png``` and replace with ```/../../../home/local.txt``` and ```/../../../root/proof.txt```, one of these should get us the flag

`24`
`25`


When you check the two ids we have, there's some sort of similarities

```
62fba5c1d2803ed44e507281
62fba61ed2803ed44e507282
```
From what we have above you should be able to spot 2 differences, the let me break it down further

```
62fba"5c1"d2803ed44e50728"1"
62fba"61e"d2803ed44e50728"2"
```
It should be more visible now, since there was no rate limiting on this particular target it means I can bruteforce hell out of this target💀😂

What I did was generate a wordlist using crunch, then I did a bit of rotation for that last number





















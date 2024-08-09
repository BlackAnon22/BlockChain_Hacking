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

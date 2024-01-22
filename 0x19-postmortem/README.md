# Postmortem

> DevOps
> SysAdmin

![image](https://github.com/RichardMiruka/alx-system_engineering-devops/assets/105627752/74bbdf16-f842-472e-83c1-c40d2cc11760)

[Google API infrastructure outage incident report](http://googledevelopers.blogspot.ca/2013/05/google-api-infrastructure-outage_3.html)

A postmortem is a tool widely used in the tech industry. After any outage, the team(s) in charge of the system will write a summary that has 2 main goals:

- To provide the rest of the company’s employees easy access to information detailing the cause of the outage. Often outages can have a huge impact on a company, so managers and executives have to understand what happened and how it will impact their work.
 
- And to ensure that the root cause(s) of the outage has been discovered and that measures are taken to make sure it will be fixed.

# Resources

* [Incident Report, also referred to as a Postmortem](https://intranet.alxswe.com/rltoken/vkEjk-M6yBWW-wyB-7-I9Q)
* [The importance of an incident postmortem process](https://intranet.alxswe.com/rltoken/QwvgCYt2zjKRT7qMRe7I8A)
* [What is an Incident Postmortem?](https://intranet.alxswe.com/rltoken/kBjhT2PIr4X-U8FLI97--Q)
* [On-call](https://intranet.alxswe.com/concepts/39)


## Issue Summary :
From Oct 29 12:30 p.m to Oct 31 9:30 p.m Requests to the website responded with an ERROR 500, this affected 35% of users since the requests corresponded to a query module. The users could not access to the web page and the services associated because the apache server was down. The suspension was due to an incorrect file name in the last update.

## Timeline (Eastern Standard Time)
- Oct 29
* 12:30 p.m : Code push to server
* 1:30 p.m : Deploy code 
* 1:45 p.m : Outage begins
* 1:50 p.m : Masive Customers complaints 
* 2:00 p.m : Customer services create a ticket
* 2:10 p.m : The support engineer receive the ticket and start to attend the issue
* 2:30 a.m: Check http requests. Why a 500 error?
* 3:00 a.m : Check the apache server configuration files line by line. sites-available, /etc/apache2/, /var/www/html/.
![](https://github.com/Emanuel-js/alx-system_engineering-devops/blob/main/0x19-postmortem/images/sites%20available.png?raw=true)
![](https://github.com/Emanuel-js/alx-system_engineering-devops/blob/main/0x19-postmortem/images/document%20root.png?raw=true)
- Oct 30
* 8:00 a.m: Check the logs associated (error logs, access logs) 
* 10:00 a.m: Use the ps aux comand to detect what process are associated to the apache server. apache2.
![](https://github.com/juliushakes/alx-system_engineering-devops/blob/main/0x19-postmortem/images/psaux.png?raw=true)
* 10:30 a.m: Use the strace command to the root apache server process with null result for every line. -root
![](https://github.com/juliushakes/alx-system_engineering-devops/blob/main/0x19-postmortem/images/strace%20127.png?raw=true)
* 11:00 a.m: Use the strace command to the data apache server process with a long list of return -1 errors. www-data
[Links](https://github.com/juliushakes/alx-system_engineering-devops/blob/main/0x19-postmortem/images/strace%20161.txt)
- May 31
* 8:00 a.m: Read the result of the strace command verifying line by line the associated services and possible errors
* 11:00 am: Found error on deploy. The file /var/www/html/wp-includes/class-wp-locale.phpp was a typo error 
* 11:25 am: Run script to fix it
[Links](https://github.com/juliushakes/alx-system_engineering-devops/blob/main/0x17-web_stack_debugging_3/0-strace_is_your_friend.pp)
* 12:00 am: Error fixed and requests responded 200
![](https://github.com/juliushakes/alx-system_engineering-devops/blob/main/0x19-postmortem/images/working.png?raw=true)

### Root Cause and Resolution 
The root of the problem was due to an incorrect file name in the last update of the site, specifically in the extension of the updated php module.

Initially it was verified that the files were in the appropriate apache path “sites / available”, with the `ps aux` command the processes associated with apache were verified, then with the `strace` command the returns were checked the file was identified, a script was generated to correct the problem, it was validated with the `curl` command and access from the browser.
![](https://github.com/juliushakes/alx-system_engineering-devops/blob/main/0x19-postmortem/images/accessing.png?raw=true)

### Corrective and Preventative Measures
In light of the incident in the last two days, an evaluation and review of the update process carried out was made, it was determined that stages were omitted for the release of this module to production, to prevent future incidents, the following improvements were implemented:

* A QA team was formed that will be in charge of validating and testing changes and updates
* A QA environment was created where pre-production integration tests are carried out
* Github CI/CD services were integrated to deployment updates and code revisions

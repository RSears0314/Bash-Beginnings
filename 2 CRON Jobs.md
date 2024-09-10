A cron job refers to a system that allows users to scedule execution of a program. 
a cron entry is put into the cron table (crontab) which notes the time and the command to be executed.
The daemon is called crond. (A daemon is a non interactive program thats running in the backgroud of a computer) 

'$ sudo apt update && sudo apt install cron' - updates/installs cron if it is not already.\
'$ps aux | grep cron' - checks the crons that are running.\

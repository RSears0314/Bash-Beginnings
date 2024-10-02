#NOTES

#This script checks basic network connectivity, storing the recieved data in a file it creates, then searching those files for the data it needs to return the diagnosis

#The "grep" command (in this use case) is searching a file for a specfic script;
#Syntax: if grep -q "STRING" "FILE TO SEARCH". The -q flag allows it to run silently


touch network_check_data.txt #This creates a data document to store the computers network data during the running of the script
echo "Commencing the network and system check..."
ping 8.8.8.8 -c 3 -w 5 > network_check_data.txt #Pinging google to make sure the network works, then storing the data in the network_check_data.txtx file

#############################################################################
if grep -q " 0% packet loss" network_check_data.txt; then
        echo "Your network connection is stable. Commencing interface check..."
elif grep -q "100% packet loss" network_check_data.txt; then
        echo "Your network connection appears to be down. Please check your internet settings. Commencing next check..."elif grep -q "67% packet loss" network_check_data.txt; then
        echo "Your network connection is stable, but DNS seems to be working slower than usual"
else echo "Test inconclusive, commencing network interface check..."
fi

sleep 2s #Pauses the shell to make the script more readable for the user
#############################################################################

ip link show > network_check_data.txt #Checking the status of the network links, then storing the data in the network_check_data.txtx file

#############################################################################
if grep -q "LOOPBACK,UP" network_check_data.txt; then
        echo "Your Loopback interface is working properly"
else grep -q "state DOWN" network_check_data.txt;
        echo "Your Loopback or an internet interface appears to be having issues..."
fi

sleep 1s
#############################################################################

uptime_String=$'\nNetwork test complete, listing system uptime...' #The use of single quotations here is important
echo "$uptime_String" #The use of double quotations here is important

sleep 2s

uptime -p #Uptime shows the device uptime, and the p flag shows it in a 'pretty' way

rm network_check_data.txt #Deletes the data file the script creates

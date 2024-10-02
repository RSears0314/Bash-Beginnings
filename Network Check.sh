touch network_check_data.txt
echo "Commencing the network and system check..."
ping 8.8.8.8 -c 3 -w 5 > network_check_data.txt

if grep -q " 0% packet loss" network_check_data.txt; then
        echo "Your network connection is stable. Commencing interface check..."
elif grep -q "100% packet loss" network_check_data.txt; then
        echo "Your network connection appears to be down. Please check your internet settings. Commencing next check..."elif grep -q "67% packet loss" network_check_data.txt; then
        echo "Your network connection is stable, but DNS seems to be working slower than usual"
else echo "Test inconclusive, commencing network interface check..."
fi

sleep 2s

ip link show > network_check_data.txt

if grep -q "LOOPBACK,UP" network_check_data.txt; then
        echo "Your Loopback interface is working properly"
else grep -q "state DOWN" network_check_data.txt;
        echo "Your Loopback or internet interface appears to be having issues..."
fi

sleep 1s

uptime_String=$'\nNetwork test complete, listing system uptime...'
echo "$uptime_String"

sleep 2s

uptime -p

rm network_check_data.txt
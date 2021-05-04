set -e
/usr/local/bin/blueutil --power 1

# connect to headphones
sleep 2 && /usr/local/bin/blueutil --connect 30-50-75-92-ca-f5

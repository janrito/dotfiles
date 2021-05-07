set -e
$(brew --prefix)/bin/blueutil --power 1

# connect to headphones
sleep 2 && $(brew --prefix)/bin/blueutil --connect 30-50-75-92-ca-f5

#!/bin/bash

# Bitcoin price script using WINKDEX API (https://winkdex.com/)
# WARNING: Run no more than once per minute.

# Create local wink folder "$HOME/bin/wink" if it doesn't exist yet                                                                                                                 

if [ ! -d /$HOME/bin/wink ];                                                                                                                                                        
  then                                                                                                                                                                              
    mkdir -p /$HOME/bin/wink
fi

# get current BTC price in cents, log to wink.log

curl -s -H "User-Agent: wink-sh" "https://winkdex.com/api/v0/price" > $HOME/bin/wink.log

# cut and print BTC value in 'cents', log to cents.log

cat $HOME/bin/wink.log | cut -d ":" -f 5 | cut -d "," -f 1 > $HOME/bin/cents.log

# set variable PRICE and calculate dollars and cents using 'bc'

PRICE=$(echo "`cat $HOME/bin/cents.log` * .01" | bc)

# print PRICE along with current time and attribution

echo "The price for one bitcoin as of `date +\"%r\"` is \$$PRICE. [WINKDEX.COM]"

# set variable DOLLARS (integer value/btc, no cents, no "$"), log to dollars.log

DOLLARS=$(echo $PRICE | cut -d '.' -f1)

echo "$DOLLARS/btc" > $HOME/bin/dollars.log

# set variable DOLLAR_PRICE (with cents, with "$"), log to dollar_price.log

DOLLAR_PRICE="\$$(echo "`cat $HOME/bin/cents.log` * .01" | bc)"

echo $DOLLAR_PRICE > $HOME/bin/dollar_price.log

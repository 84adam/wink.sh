#!/bin/bash

# Bitcoin price script using WINKDEX API (https://winkdex.com/)
# WARNING: Run no more than once per minute.

# get current BTC price in cents, log to wink.log

curl -s -H "User-Agent: wink-sh" "https://winkdex.com/api/v0/price" > wink.log

# cut and print BTC value in 'cents', log to cents.log

cat wink.log | cut -d ":" -f 5 | cut -d "," -f 1 > cents.log

# set variable PRICE and calculate dollars and cents using 'bc'

PRICE=$(echo "`cat cents.log` * .01" | bc)

# print PRICE along with current time and attribution

echo "The price for one bitcoin as of `date +\"%r\"` is \$$PRICE. [WINKDEX.COM]"

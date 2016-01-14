#!/bin/bash

# Bitcoin price script using WINKDEX (https://winkdex.com/)
# WARNING: Run no more than once per minute.

# get current BTC price in cents, log to wink.log

curl -s -H "User-Agent: wink-sh" "https://winkdex.com/api/v0/price" > wink.log

# cut and print BTC value in 'cents', log to cents.log

cat wink.log | cut -d " " -f 4 | cut -d "," -f 1 > cents.log

# divide the 'cents' value by 100 and print dollar value to shell
# NOTE: this chops off the cent values; indiscriminate rounding

echo "The price for one bitcoin as of `date +\"%r\"` is: $"$((`cat cents.log` / 100))". [WINKDEX.COM]"

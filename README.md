# wink.sh
<h3>A bash script to display the Bitcoin price in USD using the WINKDEX API.</h3>

<h5>Instructions:</h5>

1. Download and move to `/home/user/bin` directory.
2. Make the script executable: `chmod u+x wink.sh`
2. Check for /$HOME/bin in $PATH: `echo $PATH | egrep $HOME/bin` ; set using `PATH=$PATH/$HOME/bin` if necessary
3. Run: `wink.sh`
4. Use responsibly: run no more than once per minute.

<h5>Example output:</h5>
`The price for one bitcoin as of 10:05:30 PM is $742.43. [WINKDEX.COM]`
<h5>Log files stored in '/$HOME/bin/wink' directory:</h5>
* `.../wink.log` JSON data from winkdex.com
* `.../cents.log` USD cents per BTC
* `.../dollars.log` USD dollars per BTC
<br>
<h5>Links:</h5>
* https://winkdex.com
* http://docs.winkdex.com

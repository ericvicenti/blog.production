# Blog Production Config files

Forked from (ericvicenti/markshow.production)[https://github.com/ericvicenti/markshow.production], now featuring manual setup:

1. Run commands from setup.sh (only the safe configurations are made there, the rest are here)
2. Set up monit by combining this monitrc file with yours
	* `monit restart`
	* go ahead and use the monit ui at port 2812 with user and pass set in the monitrc file
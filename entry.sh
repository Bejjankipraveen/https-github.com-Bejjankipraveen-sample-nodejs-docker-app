#!/bin/sh
node server.js &

/usr/sbin/crond -f -l 8
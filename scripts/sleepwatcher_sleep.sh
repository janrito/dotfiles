#!/bin/sh

echo "SLEEPWATCHER $(date +%Y-%m-%dT%H:%M:%S%z): sleep"

# turn bluetooth off
blueutil --power 0

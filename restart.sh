#! /bin/sh 
kill -9 `cat ./tmp/pids/puma.pid`
rails s puma -e development
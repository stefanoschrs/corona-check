#!/bin/bash

flightPass=${1}
passport=${2}

curl \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "data%5Bstatus%5D=1&data%5Bflight_pass%5D=${flightPass}&data%5Bpassport%5D=${passport}&data%5Blab_id%5D=&data%5Bunique_id%5D=" \
  http://www.covid-testcyprus.com/main-handle-request.php | jq

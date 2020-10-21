#!/bin/bash

if [[ "${1}" == "" ]]; then
  echo "Missing id"
  exit 1
fi

wget -O results.pdf "https://www.mdi-limbach-berlin.de/fileadmin/user_upload/Berlin/PDF/Testergebnisse-Covid/Corona_$(date +%Y%m%d).pdf"

pdftohtml -s -q -i -noframes results.pdf

result=$(cat results.html | grep -C 1 ${1} | tail -1 | grep -oE ">.+<" | tr -d '<>')

if [[ "${result}" == "" ]]; then
  echo "Not found"
else
  echo "${result}"
fi

rm results.{pdf,html}

#!/bin/bash

set -e

docker build -t html-proofer .

echo -------------

# intercept output while still printing the output
# http://stackoverflow.com/a/12451419/358804
exec 5>&1
# expect failure
OUTPUT=$((! docker run -v "$(pwd)/test/index.html:/index.html" html-proofer /index.html) 2>&1 | tee >(cat - >&5))

echo -------------

if echo $OUTPUT | grep -q '1 file'; then
  echo "PASS: Found the test file."
else
  echo "FAIL: Didn't find the test file."
  exit 1
fi

if echo $OUTPUT | grep -q '#unknown'; then
  echo "PASS: Found the broken link."
else
  echo "FAIL: Didn't find the broken link."
  exit 1
fi

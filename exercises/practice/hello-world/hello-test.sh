#!/bin/sh
cobc -free -x hello.cob
EXPECTED="Hello, World!"
RESULT="$(./hello)"

echo $RESULT | grep "^$EXPECTED\$"  &> /dev/null

if [ $? == 0 ]; then
    echo "OK"
else
    echo "EXPECTED: $EXPECTED\nFOUND: $RESULT"
fi

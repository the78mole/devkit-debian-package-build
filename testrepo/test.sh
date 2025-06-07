#!/usr/bin/env bash

FOO= 42     # Error: space in variable assignment
echo $FOO   # should use ${FOO}

#    <- intentional blank line with trailing whitespace

#!/bin/bash
# This doesn't work fully automatic, but it's a good start
dart_js_facade_gen  --base-path=$1 --  `find $1 -name \*.d.ts`

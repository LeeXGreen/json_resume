#!/bin/bash

for t in elegant eloquent flat flat-optimized kendall kwan material modern nominaltech onepage paper sceptile short slick spartan stackoverflow crisp flat modern
do
  resume export -t $t resume-$t.html
  resume export -t $t resume-$t.pdf
done

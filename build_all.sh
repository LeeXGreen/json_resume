#!/bin/bash

for t in caffeine elegant eloquent flat flat-optimized kendall kwan material modern nominaltech onepage paper sceptile short slick spartan stackoverflow crisp flat modern
do
  resume export -t $t resume-$t.html
done &

for t in caffeine elegant eloquent flat flat-optimized kendall kwan material modern nominaltech onepage paper sceptile short slick spartan stackoverflow crisp flat modern
do
  resume export -t $t resume-$t.pdf
done &

#!/bin/bash

theme=short
resume export -t $theme resume-$theme.html && ruby build_sub_bullets.rb resume-$theme.html
open resume-$theme.html

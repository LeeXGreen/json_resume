#!/bin/bash

theme=$1
resume export -t $theme resume-$theme.html
resume export -t $theme resume-$theme.pdf

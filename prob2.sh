#!/bin/bash

#Checking files with names "values*" for wordcounts <100,
#then printing wc an file names to terminal and "failed_runs.txt"

for f in problem_2/values*;do
  val_len=$(wc -w < "$f")
  if [ "$val_len" -lt 100 ]; then
    echo "# of values | filename"
    echo "$(wc -w "$f")"
    wc -w "$f" >> failed_runs.txt
  fi
done
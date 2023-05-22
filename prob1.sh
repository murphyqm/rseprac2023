#!/bin/bash

#To change incorrect file extensions from .csv to .dat in the folder problem_1
for f in problem_1/*.csv; do mv "$f" "${f/%csv/dat}"; done
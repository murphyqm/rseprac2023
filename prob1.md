# Rename incorrect file extensions

To fix the mislabelling of data files with the incorrect file extension(`.csv`) to the correct extensions (`.dat`), I ran the script `prob1.sh` from the terminal in the parent directory containing the `problem_1` directory.

`prob1.sh` contents:

```shell
#!/bin/sh

#To change incorrect file extensions from .csv to .dat in the folder problem_1

for f in problem_1/*.csv; do mv "$f" "${f/%csv/dat}"; done
```

This script looks in the folder `problem_1` for anything that is a file with the suffix `.csv`, and replaces `.csv` with `.dat`.

If this happens again, you can modify or create a bash script like `prob1.sh`, substituting `.csv` and `.dat` for the wrong/correct file extensions respectively. If you create a new file, make sure to give it executable permissions before attempting to run it from the terminal:

```shell
#give executable permissions
$ chmod +x prob1.sh
#run the script
$ ./prob1.sh 
```

Alternatively, you can navigate into the directory holding the mislabelled files and run this one-liner from the terminal:

```shell
$ for f in *.csv; do mv "$f" "${f/%csv/dat}"; done
```

This does the same as the script `prob1.sh` just in the current working directory.

If you want to use this in other contexts, just remember to be careful with `*.csv` if there are other files in the directory that you do not want edited; this may misbehave with more complicated naming regimes with `.` elsewhere other than before the file extension.
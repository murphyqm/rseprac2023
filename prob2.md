# Find files will less than 100 values

To check how many values are saved in each file you can use `wc -w`: this uses wordcount, and the `-w` tells you that wordcount is all we want (otherwise it will return other values too like line length and character count). Since the datafiles are tab separated and in the same row, line count will not help.

You can run the following line from the terminal in the parent directory containing the `problem_2` directory:

```shell
$ for f in problem_2/values*;do val_len=$(wc -w < "$f");if [ "$val_len" -lt 100 ]; then echo $(wc -w "$f"); fi; done
```

This searches through the problem_2 directory, looking for anything with "values" as a suffix, and then checks the wordcount of the file and if it's less than 100 it outputs the wordcount and the filename.

On the files provided in `Problem_2`, it will return the following output:

```shell
$ 99 problem_2/values44
```

If you want a record of this, I've also provided `prob2.sh`, a bash script that you can put in the parent directory containing the "problem_2" folder.

`prob2.sh` contents:

```shell
for f in problem_2/values*;do
  val_len=$(wc -w < "$f")
  if [ "$val_len" -lt 100 ]; then
    echo "# of values | filename"
    echo "$(wc -w "$f")"
    wc -w "$f" >> failed_runs.txt
  fi
done
```

To run the script:
```shell
$ ./prob2.sh 
```

This script does essentially the same thing as the one-liner above, except in addition to printing out the resulting anomalous files, it also appends them to a textfile called `failed_runs.txt`. The `>>` means that this line is appended onto the file everytime you run the script (eg. if you are running it on different folders); you can replace it with `>` if you'd prefer to overwrite `failed_runs.txt` everytime. 

If you want to use this in other contexts, update the suffix/prefix of the files as needed. If you create a new bash file, remember to give it executable permissions before attempting to run it:

```shell
#give executable permissions
$ chmod +x prob2.sh
```

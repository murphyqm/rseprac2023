# Basic code optimisation

A few general pointers for when you want to speed up your code:
1. Make sure it's working as intended first; and that you know what the output/behaviour *should* be (this is where some tests would be useful!), so that you can flag it if your optimisation attempts break something
2. How fast does it _need_ to be? It's good to make your code efficient and performant - but within a certain limit, as in general highly efficient and fast code can be more difficult to read and harder to maintain. Good enough is good enough - a certain wait time and inefficiency is preferable to spending lots of research time and losing readability trying to shave off microseconds when it's not actually necessary. Think about the context the code is being used in (locally or on a cluster, interactively or as queued jobs/in the background, once but with computationally expensive inputs or many times but each iteration less expensive) - this will inform what kind of optimisation is going to be useful.
3. **Profile** your code: find out where it is slowing down, where the bottlenecks are... and importantly, where they are **not** so you don't waste time trying to optimise a section that isn't causing any issues. This can be done to look at CPU usage (using `cProfile`, `line_profiler`), but you can also profile memory usage (using `memory_profiler`).
4. Fix the bottlenecks if possible, until the code is acceptably efficient - and continue testing the code to ensure that you don't unintentionally break it while trying to optimise it.

### Make sure the script is doing the right thing first
Looking at the script `pyscript.py`, before you start to try to optimise it, there are a few small issues! 

- First, when using the `range` function - in Python 2 (which has been sunset), this used to return a `list` type, but in Python 3 it returns a "sequence type" instead ([see docs here](https://docs.python.org/3/library/stdtypes.html#range)). The problem with this type is its immutable - you'll want to wrap the range function on line 7 with a `list()` function to make the code useable.
- Second, when iterating over a list, the iterator (e.g. the `j` in `s[j]`) needs to be an integer - use the floor division operator again (`//`) to divide without a remainder (or some other means of ensuring an `int` result that is mathematically appropriate).

### Now find bottlenecks - profiling

There are a few different options for profiling your code - essentially, analysing how intensive different parts of it are, where its spending most of its execution time etc., and also what bits are fine and don't need tweaking. Profiling will slow your code down while testing, so very large and slow scripts will take a while. It will be worth it!

We can start with simply seeing how long different parts of it run. We can use the tool `line_profile` to get line-by-line information about run times. This module can be installed via conda or pip depending on your Python env:

```shell
# Anaconda install from within your project env:
$ conda install line_profiler
```
or
```shell
# pip install from within your project env:
$ pip install line_profiler
```

Then, inside your file `pyscript.py`, you need to add a "decorator" (`@profile`) to the function you want to profile (your `primes()` function), just above the definition of the function, and save the file. This will look something like this:

```python
@profile
def primes(n):
  ...
```
Then, from the terminal, in the directory containing this script, you can run the profiler script `kernprof` with the options `-l` (to profile functions with the `@profile` decorator) and `-v` (to output timing information):

```shell
$ kernprof -l -v pyscript.py
```
This will output line by line the time spent running your code (and will save the output to a `.lprof` file that can be used for visualising the results). You can now begin to identify where bottlenecks might be occurring - where is the program spending most of it's time? 

>In general, with a more complex script with multiple different function calls etc. `cProfile` is another very useful profiling tool, along with the visualisation tool `SnakeViz`; however, in this case `line_profiler` is a better fit as everything is contained in one function, so I won't get into using this other tool here -  but is good to keep in mind for possible future profiling. 

### Speed ups

**N.B. remember to keep testing that your code output is as expected when optimising!**

Since you want some more general feedback, here are some potential fixes that might help speed up your code run time across this script and others. Because your algorithm has a higher performance complexity than O(1) (e.g., the execution time is not independent of the input value - a large number will take longer than a small number!), note that some of these are dependent on the value you give the code to calculate - with `primes(100)`, some changes might actually *slow down* the script due to initial allocation csts, but with `primes(10000)` result in speed-ups. So a few questions to ask yourself:
- What is your general use-case? Running one iteration of the function with a large number (`primes(10000)`), or multiple iterations of the function with smaller numbers (`primes(100)`)?
- What is an acceptable speed up? How efficiently does it *need* to run?

Armed with the answers to those questions and your `line_profiler` output, see if these suggestions help:

- Can mathematical expressions be replaced by inbuilt functions from libraries like `math` or `numpy`?
- Is there a way to replace types such as lists with more efficient objects like arrays?
- Use in-place operations when possible, like `i += 1` instead of ` i = i + 1`
- Parallelisation - if loops within your code can be executed in any order without dependence on previous loop, then it's a great candidate for vectorisation; if you've employed numpy arrays then `Numba` could be a good option to gain some speed-up: it's a *just-in-time* compiler - more information [here](https://numba.pydata.org/).

There are lots of articles, books and courses available on producing performant, optimised code if this is something of general interest - including HPC's [SWD6: High performance Python](https://arc.leeds.ac.uk/training/courses/swd6/) course.
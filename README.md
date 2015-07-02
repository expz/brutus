# brutus
Scripts useful for the Brutus supercomputer at ETH Zurich

### checkjobs

This script reads the list of active jobs once per second. When it notices that a job has finished, it automatically prints the resulting output file.

**Modify this script if you have long output files otherwise it will print out the entire file.**

### reformat.sh

Remove every line which does not start with a number and save the output in the `edited` directory.

### trimhead.sh

Remove header summaries from the output files of Brutus jobs and save the output in the `edited` directory.

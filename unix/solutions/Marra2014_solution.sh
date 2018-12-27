###################################################
# Exercise 1.10.1 on Marra & DeWoody (2014)
###################################################
# 1) Change directory to the /CSB/unix/sandbox

# If you saved the directory CSB in your home
# directory, as suggested, you should be able
# to go to the sandbox by typing

cd ~/CSB/unix/sandbox

###################################################
# 2) What is the size of the file
# Marra2014_data.fasta?

# The option -l of the command ls also reports
# the size of the file. Adding the flag -h
# makes it "human-readable" (i.e., using K, M,
# instead of printing the number of bytes). 

ls -lh ../data/Marra2014_data.fasta

# This should return 533K

# Alternatively, the command du (disk usage) can
# be used for a more compact output:

du -h ../data/Marra2014_data.fasta 

###################################################
# 3) Create a copy of Marra2014_data.fasta in the
# sandbox and name it my_file.fasta

# To copy a file, use the command cp

cp ../data/Marra2014_data.fasta my_file.fasta

# To make sure the copy went well, list the files
# in the sandbox

ls

###################################################
# 4) How many contigs are classified as
# isogroup00036?

# To count the occurrences of a given string, use
# grep with the option -c

grep -c isogroup00036 my_file.fasta 

# This should return 16

# If you don't remember the -c option, you can use
# a pipe:

grep isogroup00036 my_file.fasta | wc -l

###################################################
# 5) Replace the original "two-spaces" delimiter
# with a comma.

# In the file, the information on each contig
# is separated by two spaces:
# >contig00001  length=527  numreads=2  ...

# We would like to obtain:
# >contig00001,length=527,numreads=2,...

# We can accomplish by using cat to print the
# file, and substitute the spaces using the
# command tr in combination with the option
# -s (squeeze).

# Before overwriting the file, let's make sure
# we didn't make any mistake: pipe the result
# to head to see the result.

cat my_file.fasta | tr -s ' ' ',' | head -n 3

# This should return:

#>contig00001,length=527,numreads=2,...
#ATCCTAGCTACTCTGGAGACTGAGGATTGAAGTTC...
#TTTACAATTAACCCACAAAAGGCTGTTACTGAAGG...

# which is what we want.

# Note that

# cat my_file.fasta | tr -s ' ' ',' > my_file.fasta

# would not work in Linux (see http://goo.gl/KIYV2N)

# To avoid this problem, save in a temporary file
# and then overwrite the file:

cat my_file.fasta | tr -s ' ' ',' > my_file.tmp
mv my_file.tmp my_file.fasta

###################################################
# 6) How many unique isogroups are in the file?

# We need to extract the isogroupXXXXX information
# for each contig, sort them, and use uniq to
# remove duplicates.

# First, using grep '>' my_file.fasta extracts
# all the lines with contig information:

grep '>' my_file.fasta | head -n 2
# >contig00001,length=527,numreads=2,gene=isogroup00001,status=it_thresh
# >contig00002,length=551,numreads=8,gene=isogroup00001,status=it_thresh

# Now use cut to extract the 4th column

grep '>' my_file.fasta | cut -d ',' -f 4 | head -n 2
#gene=isogroup00001
#gene=isogroup00001

# Finally, use sort | uniq | wc -l to count the
# number of unique occurrences.

grep '>' my_file.fasta | cut -d ',' -f 4 | sort | uniq | wc -l

# The answer is 43

# Alternatively, one can use grep writing a more
# complex "regular expression" (more on this later!):

grep -o 'isogroup[[:digit:]]\+' my_file.fasta

# which means "print all the occurrences of the
# string isogroup followed by one or more digits"

# Then, just sort, remove duplicates and count:

grep -o 'isogroup[[:digit:]]\+' my_file.fasta | sort | uniq | wc -l

###################################################
# 7) Which contig has the highest number of reads
# (numreads)? How many reads does it have?

# We need to isolate the number of reads as well
# as the contig names. We can use a combination
# of grep and cut:
grep '>' my_file.fasta | cut -d ',' -f 1,3 | head -n 3

# >contig00001,numreads=2
# >contig00002,numreads=8
# >contig00003,numreads=2

# Now we want to sort according to the number of
# reads. However, the number of reads is part of
# a more complex string. We can use -t '=' to
# split according to the = sign, and then take
# the second column (-k 2) to sort numerically (-n)

grep '>' my_file.fasta | cut -d ',' -f 1,3 | sort -t '=' -k 2 -n | head -n 5

# >contig00089,numreads=1
# >contig00176,numreads=1
# >contig00210,numreads=1
# >contig00001,numreads=2
# >contig00003,numreads=2

# Using the flag -r we can sort in reverse order:

grep '>' my_file.fasta | cut -d ',' -f 1,3 | sort -t '=' -k 2 -n -r | head -n 1

# >contig00302,numreads=3330

# Finding that contig 00302 has the highest
# coverage, with 3330 reads.

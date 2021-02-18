#!/bin/bash
if [ ! -d test ] 
then
    mkdir test;
fi
rm ./test/*.txt;
g++ testgenerate.cpp -o testgenerate.o;
P=$1;
cases=$2;
echo "$cases" > cases.txt;
./testgenerate.o < cases.txt;

g++ --coverage $P.cpp -o $P.o;

for ((i=1; i<=$cases; i++))
do
./$P.o < ./test/$i.txt;
done
covered=$(gcov -b -c $P.gcda | grep -i "Taken" | awk '{print $4}' | cut -d':' -f2 | cut -d"%" -f1);
echo "$covered" > BranchCoverage.txt;
rm P.gcda;


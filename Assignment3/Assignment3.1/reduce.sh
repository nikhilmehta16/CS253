#!/bin/bash
P=$1;
T=$2;
k=$3;
cases=$(cat cases.txt);
TotalBranchCoverage=$(cat BranchCoverage.txt);
touch TestTaken.txt;
> TestTaken.txt;
touch TillBranchCoverage.txt;
echo "0" > TillBranchCoverage.txt;
touch ./test/S.txt;
 > ./test/S.txt;

for((i=0; i<$k; i++))
do
    TillBranchCoverage=$(cat TillBranchCoverage.txt);
    tempBranchCoverage=$TillBranchCoverage;
    tempTest="";
    echo "$TillBranchCoverage,$tempBranchCoverage";

    if [[ $(echo "$tempBranchCoverage == $TotalBranchCoverage" | bc) -eq 1 ]]; then
        echo "$((i)) tests are sufficient.";
        break;
    fi

    for((j=1; j<=$cases; j++))
    do
    g++ --coverage $P.cpp -o $P.o;
    while read line;do
        if [[ $line != null ]]; then
        ./$P.o < ./test/$line.txt;
        fi
    done < "TestTaken.txt"
    ./$P.o < ./test/$j.txt;
    coverage=$(gcov -b -c $P.gcda | grep -i "Taken" | awk '{print $4}' | cut -d':' -f2 | cut -d"%" -f1);
    
    if [[ $(echo "$coverage > $tempBranchCoverage" | bc) -eq 1 ]]; then

        tempTest=$j;
        tempBranchCoverage=$coverage;
        
    fi
    done

    if [[ $(echo "$tempBranchCoverage > $TillBranchCoverage" | bc) -eq 1 ]]; then
        echo "$tempBranchCoverage" > TillBranchCoverage.txt;
        echo "$tempTest" >> TestTaken.txt;
        cat ./test/$tempTest.txt >> ./test/S.txt;
        echo "$(cat TillBranchCoverage.txt),$(cat TestTaken.txt)"
    fi

done
rm TestTaken.txt;
rm TillBranchCoverage.txt;


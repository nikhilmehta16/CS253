#!/bin/bash
wget https://api.covid19india.org/v4/data.json;
mv data.json covid_Data.json;
echo "state,district,confirmed_cases,recovery_rate" >> processed_Covid_Data_190549.csv; #headers_for_csv_file
for state in $(jq '.|keys[]' covid_Data.json);

do
    jq ".$state | select(.districts != null) | .districts |keys[]" covid_Data.json > /tmp/districtNames
    maxConfirmedDistrict=""  #will contain the district name of max recovery rate if exists otheriwise empty
    maxConfirmed=0
    max_recovery_rate=0
   
    while read district
     do
        if [[ $district == "\"Unknown\"" ]]; then #some_do_not_have_district
        continue
        fi

        confirmed=$(jq ".$state.districts.$district.total.confirmed|values" covid_Data.json)
        recovered=$(jq ".$state.districts.$district.total.recovered|values" covid_Data.json)
        
        if [[ $confirmed == "" || $recovered == "" ]];then #their are districts with not enough data
         continue
        fi

        recovery_rate=$(echo "scale=4; $recovered * 100 / $confirmed" | bc)

        if [[ $(echo "$confirmed >= 5000 && $recovery_rate >= $max_recovery_rate" | bc) -eq 1 ]]; then
            max_recovery_rate=$recovery_rate
            maxConfirmedDistrict=$district
            maxConfirmed=$confirmed
        fi

    done < /tmp/districtNames #input file for the while loop
    if [[ $maxConfirmedDistrict != "" ]];then
        echo "$state,$maxConfirmedDistrict,$maxConfirmed,$max_recovery_rate" >> processed_Covid_Data_190549.csv
    fi
done

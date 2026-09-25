#!/usr/bin/env bash

mkdir -p data_analysis

(cut -d ',' -f 3 faculty_4.csv | tr "+" "\n" | sed 's/^ *//; s/ *$//' | sort | uniq) > ./data_analysis/research_themes.txt
(cat ./data_analysis/research_themes.txt | wc -l ) >> ./data_analysis/research_themes.txt


( cut -d "," -f 3 faculty_4.csv| tr "+" "\n" | sed 's/^ *//; s/ *$//' | sort | uniq -c | sort -n | awk '$1 > 12 {$1 = ""; print $0}' | sed 's/^ *//; s/ *$//') > ./data_analysis/very_big_groups.txt


(cat faculty_4.csv | grep 'Artificial Intelligence' | grep 'Machine Learning') > ./data_analysis/joined.csv 

(cut -d "," -f 1 faculty_4.csv| sort -k 2) > ./data_analysis/sorted_names.txt

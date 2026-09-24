#!/usr/bin/env bash

mkdir -p data_analysis

(cut -d ',' -f 3 faculty_4.csv | tr "+" "\n" | sed 's/^ *//; s/ *$//' | sort | uniq) > ./data_analysis/research_themes.txt
(cat ./data_analysis/research_themes.txt | wc -l ) >> ./data_analysis/research_themes.txt

(cut -d ',' -f 3 faculty_4.csv | tr "+" "\n" | sed 's/^ *//; s/ *$//' | sort | uniq -c | awk '$1 > 12 { $1 = ""; print $0 }') > ./data_analysis/very_big_groups.txt

awk -F ',' '
    NR==FNR {
        if ($3 ~ /Artificial Intelligence/) { ai[$1] = 1 }
        next
    }
 
    $3 ~ /Machine Learning/ {
        if ($1 in ai) { print $0 }
    }
' faculty_4.csv faculty_4.csv > ./data_analysis/joined.csv

(cut -d ',' -f 1 faculty_4.csv | sed 's/^ *//; s/ *$//' | sort -k 2 ) > ./data_analysis/sorted_names.txt
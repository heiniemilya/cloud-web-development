#!/bin/bash
echo "--- ANALYYSIRAPORTTI ---" > analysis_report.txt

# 1. Kielten tunnistus
echo "Käytetyt kielet:" >> analysis_report.txt
# Etsitään eri päätteitä ja lisätään listaan jos löytyy
find . -type f -name "*.py" | grep -q . && echo "- Python" >> analysis_report.txt
find . -type f -name "*.java" | grep -q . && echo "- Java" >> analysis_report.txt
find . -type f -name "*.js" | grep -q . && echo "- JavaScript" >> analysis_report.txt
find . -type f -name "*.ts" | grep -q . && echo "- TypeScript" >> analysis_report.txt
find . -type f -name "*.html" | grep -q . && echo "- HTML" >> analysis_report.txt
find . -type f -name "*.css" | grep -q . && echo "- CSS" >> analysis_report.txt

# 2. Suunnittelumallien tunnistus
echo -e "\nHavaitut suunnittelumallit:" >> analysis_report.txt
# Etsitään avainsanoja
grep -r "getInstance" . --exclude="analysoi.sh" | grep -q . && echo "- Singleton" >> analysis_report.txt
grep -rE "create[A-Z]|factory" . --exclude="analysoi.sh" | grep -q . && echo "- Factory Method" >> analysis_report.txt
grep -r "notify" . --exclude="analysoi.sh" | grep -q . && echo "- Observer" >> analysis_report.txt
grep -r "Strategy" . --exclude="analysoi.sh" | grep -q . && echo "- Strategy" >> analysis_report.txt
grep -r "Decorator" . --exclude="analysoi.sh" | grep -q . && echo "- Decorator" >> analysis_report.txt

# Tulostetaan raportti 
cat analysis_report.txt

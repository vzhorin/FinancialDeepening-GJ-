#!/bin/bash

if [ $# -ne 10 ]; then
	/home/tiberius/workspace/econworks/Models/FinancialDeepening-GJ/bin/run_gj_main-age3-local.sh /opt/mcr-v78/v78
else
	/home/tiberius/workspace/econworks/Models/FinancialDeepening-GJ/bin/run_gj_main-age3-local.sh /opt/mcr-v78/v78 ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} 
fi
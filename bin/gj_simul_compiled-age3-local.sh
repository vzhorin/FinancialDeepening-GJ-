#!/bin/bash

ln -s inputs/gj_log76.mat gj_log76.mat 
/home/tiberius/workspace/econworks/Models/FinancialDeepening-GJ/bin/run_gj_simul-age3-local.sh /opt/mcr-v78/v78 $1 $2 $3

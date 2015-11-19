#!/bin/bash

ln -s inputs/gj_log76.mat gj_log76.mat 
ln -s inputs/thai_gro.mat  thai_gro.mat
ln -s inputs/thai_dat.mat  thai_dat.mat
ln -s inputs/hist.mat  hist.mat
ln -s inputs/policy.mat  policy.mat
ln -s inputs/sim.mat  sim.mat

if [ $# -ne 5 ]; then
/home/tiberius/workspace/econworks/Models/FinancialDeepening-GJ/bin/run_gj_master-age3-local.sh /opt/mcr-v78/v78
else
/home/tiberius/workspace/econworks/Models/FinancialDeepening-GJ/bin/run_gj_master-age3-local.sh /opt/mcr-v78/v78 $1 $2 $3 $4 $5
fi

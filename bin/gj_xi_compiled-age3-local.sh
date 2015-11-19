#!/bin/bash

ln -s inputs/thai_gro.mat thai_gro.mat 
ln -s inputs/thai_dat.mat thai_dat.mat 
/home/tiberius/workspace/econworks/Models/FinancialDeepening-GJ/bin/run_gj_xi-age3-local.sh /opt/mcr-v78/v78 $1 $2 $3 $4


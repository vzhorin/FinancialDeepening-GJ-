#!/bin/bash

ln -s inputs/gj_log76.mat gj_log76.mat 
/home/tstef/local/x64/ECON-GJ/bin/run_gj_transition-uc64.sh /home/tstef/local/x64/mcrROOT/v76 $1 $2

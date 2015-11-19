#!/bin/bash

ln -s inputs/gj_log76.mat gj_log76.mat 
/home/tstef/local/x32/ECON-GJ/bin/run_gj_transition-uc32.sh /home/tstef/local/x32/MCR/v76 $1 $2

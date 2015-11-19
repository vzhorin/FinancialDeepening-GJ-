#!/bin/bash

ln -s inputs/gj_log76.mat gj_log76.mat 
ln -s inputs/thai_gro.mat  thai_gro.mat
ln -s inputs/thai_dat.mat  thai_dat.mat
ln -s inputs/hist.mat  hist.mat
ln -s inputs/policy.mat  policy.mat
ln -s inputs/sim.mat  sim.mat


/home/tstef/local/x32/ECON-GJ/bin/run_gj_master-uc32.sh /home/tstef/local/x32/MCR/v76 $1 $2 $3 $4 $5

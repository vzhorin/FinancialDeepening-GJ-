#!/bin/bash

ln -s inputs/gj_log76.mat gj_log76.mat 
ln -s inputs/thai_gro.mat  thai_gro.mat
ln -s inputs/thai_dat.mat  thai_dat.mat
ln -s inputs/hist.mat  hist.mat
ln -s inputs/policy.mat  policy.mat
ln -s inputs/sim.mat  sim.mat

if [ $# -ne 5 ]; then
/home/tiberius/local/ECON-GJ/bin/run_gj_master-tp.sh /home/andrewj/CADGrid/TestArea/mcrROOT/v76
else
/home/tiberius/local/ECON-GJ/bin/run_gj_master-tp.sh /home/andrewj/CADGrid/TestArea/mcrROOT/v76 $1 $2 $3 $4 $5
fi

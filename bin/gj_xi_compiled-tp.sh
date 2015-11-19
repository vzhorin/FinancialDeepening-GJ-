#!/bin/bash

ln -s inputs/thai_gro.mat thai_gro.mat 
ln -s inputs/thai_dat.mat thai_dat.mat 
/home/tiberius/local/ECON-GJ/bin/run_gj_xi-tp.sh /home/andrewj/CADGrid/TestArea/mcrROOT/v76 $1 $2 $3

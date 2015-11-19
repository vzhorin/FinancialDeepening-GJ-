#!/bin/bash

ln -s inputs/gj_log76.mat gj_log76.mat 
/home/tiberius/local/ECON-GJ/bin/run_gj_transition-tp.sh /home/andrewj/CADGrid/TestArea/mcrROOT/v76 $1 $2

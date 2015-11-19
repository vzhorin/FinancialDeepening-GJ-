#!/bin/bash

ln -s inputs/gj_log76.mat gj_log76.mat 
/u/ac/tstef/local/ECON-GJ/bin/run_gj_transition-ncsa-w.sh /u/ac/tstef/local/MCR-NCSA/v75 $1 $2

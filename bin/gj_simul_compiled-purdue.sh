#!/bin/bash

ln -s inputs/gj_log76.mat gj_log76.mat 
/home/ba01/u102/stef/local/ECON-GJ/bin/run_gj_simul-purdue.sh /home/ba01/u102/stef/local/MCR-Purdue-X64/v77 $1 $2 $3

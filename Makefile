all:
	@echo "compile-master"
	

compile-age3:	compile-main-age3 compile-simul-age3  compile-xi-age3  compile-collect-age3  compile-transition-age3 
	@echo "compiled at age3"	


compile-master:
	/soft/matlab-7.5-r1/bin/mcc \
	 -o gj_master \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_master.m \
	-a New/gj_collect.m \
	-a New/gj_main.m \
	-a New/gj_plot3dwealth.m \
	-a New/gj_simul.m \
	-a New/gj_transition.m \
	-a New/gj_xi.m \
	-a New/gj_xi_disp.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	

		
compile-main: 
	/soft/matlab-7.5-r1/bin/mcc \
	 -o gj_main \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_main.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	



compile-simul: 
	/soft/matlab-7.5-r1/bin/mcc \
	 -o gj_simul \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_simul.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	



compile-xi: 
	/soft/matlab-7.5-r1/bin/mcc \
	 -o gj_xi \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_xi.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	

compile-collect: 
	/soft/matlab-7.5-r1/bin/mcc \
	 -o gj_collect \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_collect.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	
	

compile-transition: 
	/soft/matlab-7.5-r1/bin/mcc \
	 -o gj_transition \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_transition.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	


compile-master-age3:
	/usr/local/bin/mcc \
	 -o gj_master_a64 \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_master.m \
	-a New/gj_collect.m \
	-a New/gj_main.m \
	-a New/gj_plot3dwealth.m \
	-a New/gj_simul.m \
	-a New/gj_transition.m \
	-a New/gj_xi.m \
	-a New/gj_xi_disp.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	

compile-main-age3: 
	/usr/local/bin/mcc \
	 -o gj_main_a64_v78 \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_main.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	



compile-simul-age3: 
	/usr/local/bin/mcc \
	 -o gj_simul_a64_v78 \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_simul.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	



compile-xi-age3: 
	/usr/local/bin/mcc \
	 -o gj_xi_a64_v78 \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_xi.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	

compile-collect-age3: 
	/usr/local/bin/mcc \
	 -o gj_collect_a64_v78 \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_collect.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	
	

compile-transition-age3: 
	/usr/local/bin/mcc \
	 -o gj_transition_a64_v78 \
	-W main -T link:exe \
	-d  bin -v \
	New/gj_transition.m \
    -a GenericFunctions/anasample2.m \
    -a GenericFunctions/asorder.m \
    -a GenericFunctions/ChebCoefAl.m \
    -a GenericFunctions/ChebCoef.m \
    -a GenericFunctions/feconst.m \
    -a GenericFunctions/ginipure.m \
    -a GenericFunctions/gro2level.m \
    -a GenericFunctions/lzgini.m \
    -a GenericFunctions/mvave2.m \
    -a GenericFunctions/ols.m \
    -a GenericFunctions/quadlg.m \
    -a GenericFunctions/theil.m \
    -a GenericFunctions/timedum.m \
    -a ValuePolicyFunction/Gfai1.m \
    -a ValuePolicyFunction/Gfai2.m \
    -a ValuePolicyFunction/Gfai3.m \
    -a ValuePolicyFunction/Gfaicrs1.m \
    -a ValuePolicyFunction/Gfaicrs2.m \
    -a ValuePolicyFunction/Gfaicrs3.m \
    -a ValuePolicyFunction/Gfaicrs.m \
    -a ValuePolicyFunction/Gfai.m \
    -a ValuePolicyFunction/GJCRS.m \
    -a ValuePolicyFunction/GJcrsv.m \
    -a ValuePolicyFunction/GJcrsw0.m \
    -a ValuePolicyFunction/gjInifuncrs.m \
    -a ValuePolicyFunction/gjInifun.m \
    -a ValuePolicyFunction/gjk.m \
    -a ValuePolicyFunction/GJmain1yr.m \
    -a ValuePolicyFunction/gjp.m \
    -a ValuePolicyFunction/gjV.m \
    -a ValuePolicyFunction/gjWchebap.m \
    -a ValuePolicyFunction/gjWo.m \
    -a ValuePolicyFunction/GJZZcrs.m \
    -a ValuePolicyFunction/GJZZ.m \
    -a ValuePolicyFunction/LLL.m \
    -a ValuePolicyFunction/LL.m \
    -a ValuePolicyFunction/wpcrs.m \
    -a ValuePolicyFunction/wp.m \
    -a Simulation/ere1.m \
    -a Simulation/ere2.m \
    -a Simulation/ere3.m \
    -a Simulation/GJgraphRobust.m \
    -a Simulation/gjtransLog.m \
    -a Simulation/TDrealp2.m \
    -a Simulation/Zsffun.m \
    -a Regression/GJEngine2.m \
    -a Regression/GJMonSimMatrix2.m \
    -a Regression/GJregFB.m \
    -a Regression/GJregKL.m 	


clean:
	rm -f param-*.out
	rm -f model-*.out	
	rm -f *.rlog
	rm -rf *.d
	rm -f *.log *~ *.kml *.xml
	rm sim-* policy-*
	
	
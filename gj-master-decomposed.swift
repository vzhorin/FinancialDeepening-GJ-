type file{};

(file policyFile)gj_main(float GJbet, float GJdel, float gam, float GJq, float GJTA, float GJTB, float GJEA, float GJEB, float GJsig){
	app{
		gj_main @filename(policyFile) GJbet GJdel gam GJq GJTA GJTB GJEA GJEB GJsig;
	}
}

(file simFile)gj_sim(file policyFile,  file logFile){
	app{
		gj_sim @filename(policyFile)  @filename(simFile);
	}
}

(file simFile)gj_collect(int numFiles, string simResultsPrefix, file simResults[]){
	app{
		gj_collect numFiles  simResultsPrefix @filename(simFile);
	}
}

(file  criterionFile)gj_xi(file histFile, file simFile, int simTotal, file thaiGro, file thaiDat){
	app{
		gj_xi @filename(histFile)  @filename(simFile) simTotal @filename(criterionFile);
	}
}

(file  histFile)gj_transition(file policyFile, file logFile){
	app{
		gj_transition @filename(policyFile)  @filename(histFile);
	}
}

(file simResults[])batch_gj_sim(file policyFile, int parallelInstances){
	file logFile<single_file_mapper; file="inputs/gj_log76.mat">;
	int instanceRange=[1:parallelInstances];
	foreach i in  instanceRange {
		simResults[i]=gj_sim(policyFile,  logFile);
	}
}

gj_decomposed(float GJsig, float GJq, float gam, float GJdel, float GJbet){
	//this needs to be at least 100
	int numberOfSimulations = 100;

	float GJTA=1.047;
	float GJTB = 1.147;
	float GJEA = -0.6;
	float GJEB = 0.6;
	
	//string runID="{VDL:RUNID}";
	string runID=@strcat(GJsig,"-",GJq,"-",gam,"-",GJdel,"-",GJbet);
	trace(runID);
	
	file simFile<single_file_mapper; file="sim_1.mat">;
	file logFile<single_file_mapper; file="inputs/gj_log76.mat">;
	file thaiGro<single_file_mapper; file="inputs/thai_gro.mat">;
	file thaiDat<single_file_mapper; file="inputs/thai_dat.mat">;

	file policyFile<single_file_mapper; file=@strcat("policy-",runID,".mat")>;
	policyFile=gj_main(GJbet, GJdel, gam, GJq, GJTA, GJTB, GJEA, GJEB, GJsig);
	
	file simOutputs[]<simple_mapper; prefix=@strcat("sim-",runID,"_"), suffix=".mat">;
	simOutputs = batch_gj_sim(policyFile, numberOfSimulations);
	
	file mergedSim<single_file_mapper; file=@strcat("mergedSim-",runID,".mat")>;
	mergedSim = gj_collect (numberOfSimulations, @strcat("sim-",runID,"_"),  simOutputs);
	
	file historyFile<single_file_mapper; file = @strcat("history-",runID,".mat")>;
	historyFile = gj_transition(policyFile, logFile);
	
	file criterionFile <single_file_mapper; file=@strcat("criterion-",runID,".mat")>;
	criterionFile = gj_xi (historyFile, mergedSim, numberOfSimulations, thaiGro, thaiDat);
}


gj_param_sweep(){
	
	//float GJbetMIN=0.9550;
	float GJbetMAX=0.99;
	float GJbetSTEP=0.005;
	
	//float GJdelMIN=1.02;
	float GJdelMAX=1.06;
	float GJdelSTEP=0.005;
	
	//float gamMIN=0.95;
	float gamMAX=1;
	float gamSTEP=0.005;
	
	//float GJqMIN=1;
	float GJqMAX=15;
	float GJqSTEP=1;

	//float GJsigMIN=1;
	float GJsigMAX=2;
	float GJsigSTEP=0.05;

	// These are the right ones
	//int GJbetSteps=@toint(@strcut(@strcat((GJbetMAX-GJbetMIN)/GJbetSTEP),"([0-9]*).?[0-9]*"));
	//int GJdelSteps=@toint(@strcut(@strcat((GJdelMAX-GJdelMIN)/GJdelSTEP),"([0-9]*).?[0-9]*"));
	//int gamSteps=@toint(@strcut(@strcat((gamMAX-gamMIN)/gamSTEP),"([0-9]*).?[0-9]*"));
	//int GJqSteps=@toint(@strcut(@strcat((GJqMAX-GJqMIN)/GJqSTEP),"([0-9]*).?[0-9]*"));
	//int GJsigSteps=@toint(@strcut(@strcat((GJsigMAX-GJsigMIN)/GJsigSTEP),"([0-9]*).?[0-9]*"));
	
	//trace(GJbetSteps);
	//trace(GJdelSteps);
	//trace(gamSteps);
	//trace(GJqSteps);
	//trace(GJsigSteps);

	//these are for range limiting purposes, only use the default value
	int GJbetSteps=0;
	int GJdelSteps=0;
	int gamSteps=0;
	int GJqSteps=0;
	int GJsigSteps=0;
	
	//these are the defaults, start from them
	float GJsigMIN=1;
	float GJqMIN=5;
	float gamMIN=0.98;
	float GJdelMIN=1.054;
	float GJbetMIN=0.96;

	foreach GJbetIndex in [0:GJbetSteps]{
	foreach GJdelIndex in [0:GJdelSteps]{
	foreach gamIndex in [0:gamSteps]{
	foreach GJqIndex in [0:GJqSteps]{
	foreach GJsigIndex in [0:GJsigSteps]{
		gj_decomposed(GJsigMIN+GJsigIndex*GJsigSTEP,
				GJqMIN+GJqIndex*GJqSTEP,
				gamMIN+gamIndex*gamSTEP,
				GJdelMIN+GJdelIndex*GJdelSTEP,
				GJbetMIN+GJbetIndex*GJbetSTEP);
	}}}}}
}

gj_param_sweep();

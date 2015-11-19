type file{};

(file policyFile)gj_main(){
	app{
		gj_main ;
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

int numberOfSimulations = 100;

file policyFile<single_file_mapper; file="policy.mat">;
file simFile<single_file_mapper; file="sim_1.mat">;
file logFile<single_file_mapper; file="inputs/gj_log76.mat">;
file thaiGro<single_file_mapper; file="inputs/thai_gro.mat">;
file thaiDat<single_file_mapper; file="inputs/thai_dat.mat">;

//policyFile = gj_main();

file simOutputs[]<simple_mapper; prefix="sim_", suffix=".mat">;
simOutputs = batch_gj_sim(policyFile, numberOfSimulations);

file mergedSim<single_file_mapper; file="mergedSim.mat">;
//mergedSim = gj_collect (numberOfSimulations, "sim_",  simOutputs);

file historyFile<single_file_mapper; file = "history.mat">;
//historyFile = gj_transition(policyFile, logFile);

file criterionFile <single_file_mapper; file="criterion.mat">;
//criterionFile = gj_xi (historyFile, mergedSim, numberOfSimulations, thaiGro, thaiDat);

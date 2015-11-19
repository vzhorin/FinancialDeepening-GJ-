type file{};

(file  histFile)gj_transition(file policyFile, file logFile){
	app{
		gj_transition @filename(policyFile)  @filename(histFile);
	}
}

file policyFile<single_file_mapper; file="policy.mat">;
file logFile<single_file_mapper; file="inputs/gj_log76.mat">;
file historyFile<single_file_mapper; file = "history.mat">;

historyFile = gj_transition(policyFile, logFile);
type file{};

(file result) gj_master (float GJbet, float GJdel, float gam, float  GJq, float GJsig, file log, file growth, file data, file hist, file sim, file pol){
	app {
		gj_master GJbet GJdel  gam  GJq  GJsig ;
	}
}

(file result) gj_master_single (file log, file growth, file data){
	app {
		gj_master;
	}
}

gj_run(){
	float GJsig=1;
	float GJq=5;
	float gam=0.98;
	float GJdel=1.054;
	float GJbet=0.96;
	
	file outFile <single_file_mapper; file="criterion.csv">;

	file logFile<single_file_mapper; file="inputs/gj_log76.mat">;
	file thaiGro<single_file_mapper; file="inputs/thai_gro.mat">;
	file thaiDat<single_file_mapper; file="inputs/thai_dat.mat">;
	file histFile<single_file_mapper; file="inputs/hist.mat">;
	file polFile<single_file_mapper; file="inputs/policy.mat">;
	file simFile<single_file_mapper; file="inputs/sim.mat">;
	
	outFile = gj_master(GJbet, GJdel, gam, GJq, GJsig, logFile, thaiGro, thaiDat, histFile, simFile, polFile);

}

file outFile <single_file_mapper; file="criterion.csv">;

	file logFile<single_file_mapper; file="inputs/gj_log76.mat">;
	file thaiGro<single_file_mapper; file="inputs/thai_gro.mat">;
	file thaiDat<single_file_mapper; file="inputs/thai_dat.mat">;
	file histFile<single_file_mapper; file="inputs/hist.mat">;
	file polFile<single_file_mapper; file="inputs/policy.mat">;
	file simFile<single_file_mapper; file="inputs/sim.mat">;

outFile =gj_master_single(logFile, thaiGro, thaiDat);


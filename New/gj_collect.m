function gj_collect(sim_total, temp_set, sim_file) %collects individual simulations files 

Allgrowk_array= [];
H_array= [];
Theil_array = [];
if(ischar(sim_total)==1) sim_total = str2num(sim_total); end;

for i = 1:sim_total
    load(strcat(temp_set,num2str(i, '%04d'),'.mat'));
    Allgrowk_array = [Allgrowk_array;Allgrowk];
    H_array = [H_array; H];
    Theil_array = [Theil_array; Theil];
    
    clear All_growk H Theil;       
    delete(strcat(temp_set,num2str(i, '%04d'),'.mat'));
    
end

Allgrowk = Allgrowk_array;
H = H_array;
Theil = Theil_array;

save(sim_file, 'sim_number', 'scale', 'kgrid', 'Allgrowk', 'H', 'Theil');





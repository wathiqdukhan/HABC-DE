% Project Title: Non-dominated Sorting Genetic Algorithm2 (NSGA-2)
function reg
global RUN DSTLIM TERMLIM pCrossover pMutation mu
    function dualfprintf(fid,message)
        fprintf(fid,[message '\n']);
        fprintf([message '\n']);
    end
rng(100)
runs =5;
fileID = fopen('main_out.txt','w');
%termlim = [0,0.0001,0.0005,0.001,0.005,0.01]
for dst = 1:2
    for termlm = 0:0.001:0.0%-0.001:0.001:0.001
    TERMLIM =  termlm;
    
        DSTLIM = dst;
        NDS = zeros(1,runs);
        HV = zeros(1,runs);
        DeltaSpread = zeros(1,runs);
        for pmu = 0.01:0.01:0.01
            for cr = 1:-0.2:0
                for mut=0:0.2:1
                
                    for i = 1: runs
                        RUN = i;
                        pCrossover = cr;
                        pMutation = mut;
                        mu = pmu;
                        dualfprintf(fileID,['RUN : ' num2str(i) ' , TERMLIM : ' num2str(TERMLIM) ' , DSTLIM : ' num2str(DSTLIM), ', pCrossover : ' num2str(pCrossover) ', pMutation : ' num2str(pMutation) ' , mu : ' num2str(mu)]);
                        tic
                        [NDS(i),HV(i),DeltaSpread(i)] = nsga2;
                        sec = toc;
                        dualfprintf(fileID,['NDS : ' num2str(NDS(i)) ' , HV : ' num2str(HV(i)) ' , SPREAD : ' num2str(DeltaSpread(i)),' RT: ' num2str(sec)]);
                        dualfprintf(fileID,'----------------------------------------------------------------');
                        
                    end
                    
                    dualfprintf(fileID,['NDS : ' num2str(NDS)])
                    
                    NDSavg = mean(NDS);
                    NDSstd = std(NDS);
                    dualfprintf(fileID,['NDSavg : ' num2str(NDSavg)])
                    dualfprintf(fileID,['NDSstd : ' num2str(NDSstd)])
                    
                    
                    HVavg = mean(HV);
                    HVstd = std(HV);
                    dualfprintf(fileID,['HV : ' num2str(HV)])
                    dualfprintf(fileID,['HVavg : ' num2str(HVavg)])
                    dualfprintf(fileID,['HVstd : ' num2str(HVstd)])
                    DeltaSpreadavg = mean(DeltaSpread);
                    DeltaSpreadstd = std(DeltaSpread);
                    dualfprintf(fileID,['DeltaSpread : ' num2str(DeltaSpread)])
                    dualfprintf(fileID,['DeltaSpreadavg : ' num2str(DeltaSpreadavg)])
                    dualfprintf(fileID,['DeltaSpreadstd : ' num2str(DeltaSpreadstd)])
                end
            end
        end
    end
end


fclose(fileID);
end


function x = sample(nVar)
global ImplicationInteraction CompinationInteraction ...
    ExclusionInteraction InteractionEnabled DIST

%r = rand;
r = randsample([1:nVar],1,true,DIST)/nVar;
%r = abs(nVar/2 + randn*10)/nVar;
%numer = max(min(randn*(nVar/5),nVar/2),-nVar/2)+nVar/2;
%r = numer/nVar;
if r <= 1%0.05
%    x = ones(1,nVar);
%elseif r > 0.95
%    x = zeros(1,nVar);
%else    
    x = randsample(0:1,nVar,true,[1-r,r]);    
    if InteractionEnabled
        count = 0;
        done = false;
        while(count<5 && done==false)
            done = true;
            count=count+1;
            ncses = size(ImplicationInteraction,1);
            for i = 1 : ncses
                el1 = ImplicationInteraction(i,1);
                el2 = ImplicationInteraction(i,2);
                if(x(el1) == 1 && x(el2) == 0)
                    x(el2)=1;
                    done=false;
                end
            end

            ncses = size(CompinationInteraction,1);
            for i = 1 : ncses
                el1 = CompinationInteraction(i,1);
                el2 = CompinationInteraction(i,2);
                if(x(el1) == 1 && x(el2) == 0 || x(el1) == 0 && x(el2) == 1)
                   x(el1) = 1;
                   x(el2) = 1;  
                   done=false;
                end
            end
                ncses = size(ExclusionInteraction,1);
            for i = 1 : ncses
                el1 = ExclusionInteraction(i,1);
                el2 = ExclusionInteraction(i,2);
                if(x(el1) == 1 && x(el2) == 1)
                    k = randsample([el1,el2],1) ;
                    x(k) = 0;    
                    done=false;
                end
            end
        end                
    end
else
    r
    error('r  ')    
end


end
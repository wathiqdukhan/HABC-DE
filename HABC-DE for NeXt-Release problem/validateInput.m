function valid = validateInput(x)
global ImplicationInteraction CompinationInteraction ...
    ExclusionInteraction InteractionEnabled  
valid=true;
if InteractionEnabled == true
    ncses = size(ImplicationInteraction,1);
    for i = 1 : ncses
        el1 = ImplicationInteraction(i,1);
        el2 = ImplicationInteraction(i,2);
        if(x(el1) == 1 && x(el2) == 0)
            valid=false;
            return
        end
    end
    
    ncses = size(CompinationInteraction,1);
    for i = 1 : ncses
        el1 = CompinationInteraction(i,1);
        el2 = CompinationInteraction(i,2);
        if(x(el1) == 1 && x(el2) == 0 || x(el1) == 0 && x(el2) == 1)
           valid=false;
            return
        end
    end
    
    ncses = size(ExclusionInteraction,1);
    for i = 1 : ncses
        el1 = ExclusionInteraction(i,1);
        el2 = ExclusionInteraction(i,2);
        if(x(el1) == 1 && x(el2) == 1)
            valid=false;
            return
        end
    end
end

end
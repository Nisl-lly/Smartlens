function [flag]=islegal(pop1)
    if ( pop1(1) + pop1(2)+ pop1(3)+pop1(6)+pop1(7)<5) && (pop1(4)*1.5+ pop1(5)<7)&&( pop1(1) + pop1(2)+ pop1(3)+pop1(6)+pop1(7)+pop1(4)/4+pop1(5)<7)&&(pop1(4)>0.3)
        flag=true;
    else
        flag=false;
    end
end

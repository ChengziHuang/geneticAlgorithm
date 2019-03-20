function [child]=mutation(parent,probability)

if rand() <= probability
    P = parent;
    %select two random cities to interchange
    random1 = 0;
    random2 = 0;
    while random1 == random2
        random1 = randi([1 13]);
        random2 = randi([1 13]);
    end
    %mutation
    P(:,[random1,random2])=P(:,[random2,random1]);
    child=P;
else
    child = 0;
end

end
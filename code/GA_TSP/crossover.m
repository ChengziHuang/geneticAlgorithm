function [child1, child2]=crossover(parent1, parent2)
child1 = 0;
child2 = 0;

if crosscheck(parent1,parent2) == 1
    p1 = [1 1 1 1 1 1 1 1 1 1 1 1 1];
    p2 = [2 2 2 2 2 2 2 2 2 2 2 2 2];
    %make sure the children are valid
    while length(p1)>length(unique(p1)) || length(p2)>length(unique(p2))
        %randomly select a cross point
        crossPoint = randi([1 12]);
        p1 = [parent1(:,1:crossPoint) parent2(:,crossPoint+1:13)];
        p2 = [parent2(:,1:crossPoint) parent1(:,crossPoint+1:13)];
    end
    child1 = p1;
    child2 = p2;
end

end
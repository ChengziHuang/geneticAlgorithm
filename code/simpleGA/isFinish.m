function result = isFinish(individual)
    result = 1;
    for gene = 1 : size(individual, 2)
        if individual(gene) == 0
            result = 0;
            break;
        end
    end
end
function fitness = calculateFitness(data, population)
    [populationSize, chromosomeLength] = size(population);
    fitness = ones(1, populationSize);
    
    for index = 1 : populationSize
        fitness(index) = getDistance(data, population(index, :), chromosomeLength);
    end

end

function d = getDistance(data, route, num)
    d = 0;
    for index = 1 : (num -1)
        from = route(index);
        to = route(index + 1);
        if from < to
            d = d + data(from, to);
        else 
            d = d + data(to, from);
        end
    end
    
    from = route(num);
    to = route(1);
    if from < to
        d = d + data(from, to);
    else 
        d = d + data(to, from);
    end
end
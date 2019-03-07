function fitness = calculateFitness(population)
    [populationSize, chromosomeLength] = size(population);
    fitness = ones(1, populationSize);

    for index = 1 : populationSize
        individualFitness = 0;
        for geneIndex = 1 : chromosomeLength
            if population(index, geneIndex) == 1
                individualFitness = individualFitness + 1;
            end
        end
        fitness(1, index) = individualFitness;
    end
end
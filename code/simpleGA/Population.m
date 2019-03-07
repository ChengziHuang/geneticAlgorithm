function population = Population(ChromosomeLength, PopulationSize)
    population = ones(PopulationSize, ChromosomeLength);

    for populationIndex = 1 : PopulationSize
        for gene = 1 : ChromosomeLength
            if (0.5 > rand())
                population(populationIndex, gene) = 1;
            else 
                population(populationIndex, gene) = 0;
            end
        end
    end
end
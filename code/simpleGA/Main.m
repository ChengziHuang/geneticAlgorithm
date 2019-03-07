clc,clear
chromosomeLength = 120;
populationSize = 200;
crossoverRate = 0.9;
mutationRate = 0.02;
population = Population(chromosomeLength, populationSize);
fitness = calculateFitness(population);
ga = GeneticAlgorithm(population, crossoverRate, mutationRate, fitness);

generation = 1;
[selectIndividual, currentFitness] = ga.selectBestIndividual();

visual = selectIndividual;
visualFit = currentFitness;

newPopulation = ones(populationSize, chromosomeLength);
while isFinish(selectIndividual) ~= 1 || generation > 10000
    for index = 1 : populationSize
        father = ga.select();    
        mother = ga.select();
        offspring = ga.crossover(father, mother);
        offspring = ga.mutation(offspring);
        newPopulation(index, :) = offspring;
    end
    fitness = calculateFitness(newPopulation);
    ga.population = newPopulation;
    ga.fitness = fitness;
    [selectIndividual, currentFitness] = ga.selectBestIndividual();
    generation = generation + 1;
    visual(generation, :) = selectIndividual;
    visualFit(1, generation) = currentFitness;
end

x = 1 : generation;
plot(x, visualFit,'-*b');
public class TSP {
    public static int maxGenerations = 3000;
    public static void main(String[] args) {
        int numCities = 100;
        City cities[] = new City[numCities];

        for (int cityIndex = 0; cityIndex < numCities; cityIndex++) {
            int xPos = (int) (100 * Math.random());
            int yPos = (int) (100 * Math.random());
            cities[cityIndex] = new City(xPos, yPos);
        }

        GeneticAlgorithm ga = new GeneticAlgorithm(100, 0.001, 0.9, 2, 5);

        Population population = ga.initPopulation(cities.length);

        //TODO: Evaluate population

        //keep track of current generation
        int generation = 1;

        while (!ga.isTerminationConditionMet(generation, maxGenerations)) {
            //TODO: print fittest individual from population
            Route route = new Route(population.getFittest(0), cities);

            System.out.println("G" + generation + " Best distance: " +  route.getDistance());


            //TODO: Apply crossover
            population = ga.crossoverPopulation(population);
            //TODO: Apply mutation
            population = ga.mutatePopulation(population);
            //TODO: Evaluate population
            ga.evalPopulation(population, cities);
            //Increment the current generation
            generation++;
        }

        //TODO: Display results
        System.out.println("Stopped after " + maxGenerations + "generations.");
        Route route = new Route(population.getFittest(0), cities);
        System.out.println("Best distance: " + route.getDistance());
    }
}
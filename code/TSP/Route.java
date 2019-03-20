public class Route {
    private City route[];
    private double distance = 0;

    public Route(Individual individual, City cities[]) {
        int chromosome[] = individual.getChromosome();

        this.route = new City[cities.length];

        for (int geneIndex = 0; geneIndex < chromosome.length; geneIndex++) {
            this.route[geneIndex] = cities[chromosome[geneIndex]];
        }
    }

    public double getDistance() {
        if (this.distance > 0) {
            return this.distance;
        }

        double totalDistance = 0;

        for (int cityIndex = 0; cityIndex < this.route.length - 1; cityIndex++) {
            totalDistance += this.route[cityIndex].distanceFrom(this.route[cityIndex + 1]);
        }

        totalDistance += this.route[this.route.length - 1].distanceFrom(this.route[0]);
        this.distance = totalDistance;

        return totalDistance;
    }
}

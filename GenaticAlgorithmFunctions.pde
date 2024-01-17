void calculateFitness(){
    float currentRecord = 999999999;
    for (int i = 0; i < popSize; ++i) {
        int[] temp = new int[no_of_cities];
        population[i].getCities(temp);
        float dist = calcDist(cities, temp);
        if (dist < recordDist) {
            recordDist = dist;
            float prevBest = shortestList.get(shortestList.size() - 1);
            println(recordDist, " - ", String.format("%.5f", (prevBest - recordDist) * 100 / prevBest ), "% reduction");
            shortestList.append(recordDist);
            clone(temp, shortest, no_of_cities);
        }
        if (dist < currentRecord) {
            currentRecord = dist;
            clone(temp, currentBest, no_of_cities);
        }

        population[i].setFitness(1 / (pow(dist, 8) + 1));
    }
}

void normalizeFitness(element[] array){
    float sum = 0;
    for (int i = 0; i < popSize; ++i) {
        sum += array[i].getFitness();
    }
    for (int i = 0; i < popSize; ++i) {
        array[i].setFitness(array[i].getFitness() / sum);
    }
}

void createNextGeneration(){
    element[] newPop = new element[popSize];
    //generating random population
    for (int i = 0; i < popSize; ++i) {
        int[] tempArr = new int[no_of_cities];
        clone(order, tempArr, no_of_cities);
        shuffle(tempArr, no_of_cities, 100);
        element newElement = new element(tempArr, no_of_cities);
        newPop[i] = newElement;
    }

    for (int i = 0; i < popSize; ++i) {
        int[] order1 = new int[no_of_cities];
        pickOne(population, order1);
        // int[] order2 = new int[no_of_cities];
        // pickOne(population, order2);
        //crossover
        mutate(order1, mutationRate);
        newPop[i].setCities(order1);
    }
    clone(newPop, population, popSize);
}


void pickOne(element[] pop, int[] pickedOne){
    int index = 0;
    float r = random(1);

    while (r > 0) {
        if (index == popSize) {
            break;
        }
        r -= pop[index].getFitness();
        index++;
    }
    if (index != 0) {
        index --;
    }
    int[] temp = new int[no_of_cities];
    population[index].getCities(temp);    
    clone(temp, pickedOne, no_of_cities);
}


void mutate(int[] order, float mutRate){
    for (int i = 0; i < no_of_cities; ++i) {
        if (random(1) < mutRate) {
            int indexA = int(random(no_of_cities));
            int indexB = (indexA + 1) % no_of_cities;
            swap(order, indexA, indexB);
        }
    }
}
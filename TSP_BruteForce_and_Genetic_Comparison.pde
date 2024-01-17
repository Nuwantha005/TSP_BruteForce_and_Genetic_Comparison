int no_of_cities = 25;
int popSize = 800;
float recordDist = 999999999;
float mutationRate = 0.5;
int totalPerm, currentPerm;
float recordDist_bruteForce;

int[] currentBest = new int[no_of_cities];
int[] order = new int[no_of_cities];
int[] order_bruteForce = new int[no_of_cities];
PVector[] cities = new PVector[no_of_cities];
int[] shortest = new int[no_of_cities];
int[] shortest_bruteForce = new int[no_of_cities];
element[] population = new element[popSize];
int no_of_generations = 1;
FloatList shortestList = new FloatList();


void setup() {
    size(1000,600);
    
    totalPerm = fact(no_of_cities);
    currentPerm = 1;

    //generating random city list
    for (int i = 0; i < no_of_cities; ++i) {
        cities[i] = new PVector(random(50, width / 2 - 50), random(50, height - 50));
        order[i] = i;
        order_bruteForce[i] = i;
        shortest[i] = i;
        shortest_bruteForce[i] = i;
    }
    recordDist = calcDist(cities, order);
    recordDist_bruteForce = recordDist;
    shortestList.append(recordDist);
    println(recordDist);
    
    //generating random population
    for (int i = 0; i < popSize; ++i) {
        int[] tempArr = new int[no_of_cities];
        clone(order, tempArr, no_of_cities);
        shuffle(tempArr, no_of_cities, 100);
        element newElement = new element(tempArr, no_of_cities);
        population[i] = newElement;
    }
    
}

void draw() {
    background(0);
    fill(255);
    
    calculateFitness();
    normalizeFitness(population);
    createNextGeneration();
    
    for (int i = 0; i < no_of_cities; ++i) {
        circle(cities[i].x, cities[i].y,5);
    }
    
    
    stroke(255);
    strokeWeight(1);
    noFill();
    beginShape();
    for (int i = 0; i < no_of_cities; ++i) {
        vertex(cities[currentBest[i]].x, cities[currentBest[i]].y);
    }
    endShape();
    
    stroke(90,255,100);
    strokeWeight(3);
    noFill();
    beginShape();
    for (int i = 0; i < no_of_cities; ++i) {
        vertex(cities[shortest[i]].x, cities[shortest[i]].y);
    }
    endShape();
    
    textSize(20);
    text("No of Generations:  " + no_of_generations ,10, 30);
    // text(String.format("%.2f", percentage) + " % Complete", width - 165, 30);
    text("Best Distance: " + recordDist, 10, height - 20);
    
    no_of_generations++;
    
    
    
    //BrruteForce Code
    for (int i = 0; i < no_of_cities; ++i) {
        circle(width / 2 + cities[i].x, cities[i].y,5);
    }
    
    //Find the largest x s.t. P[x] < P[x+]
    int largestI = -1;
    for (int i = 0; i < no_of_cities - 1; i++) {
        if (order_bruteForce[i] < order_bruteForce[i + 1]) {
            largestI = i;
        }
    }
    if (largestI == -1) {
        stroke(90,255,100);
        strokeWeight(3);
        noFill();
        beginShape();
        for (int i = 0; i < no_of_cities; ++i) {
            vertex(width / 2 + cities[shortest_bruteForce[i]].x, cities[shortest_bruteForce[i]].y);
        }
        endShape();
        
        noLoop();
    } else {
        
        int largestJ = -1;
        //Find the larges y s.t. P[x] < P[y]
        for (int j = 0; j < no_of_cities; ++j) {
            if (order_bruteForce[largestI] < order_bruteForce[j]) {
                largestJ = j;
            }
        }
        
        //Swap P[x] and P[y]
        int temp = order_bruteForce[largestI];
        order_bruteForce[largestI] = order_bruteForce[largestJ];
        order_bruteForce[largestJ] = temp;
        
        //Reverse P[x+1 ... n]
        int reverseArrayLength = no_of_cities - largestI - 1;
        int[] partToBeRevesed = new int[reverseArrayLength];
        int[] revesedArray = new int[reverseArrayLength];
        
        for (int i = 1; i < reverseArrayLength + 1; ++i) {      //creating a new array with items to be reversed
            partToBeRevesed[i - 1] = order_bruteForce[i + largestI];
        }
        for (int k = 0; k < reverseArrayLength; ++k) {      //reversing the array
            revesedArray[k] = partToBeRevesed[reverseArrayLength - (k + 1)];
        }
        for (int k = 0; k < reverseArrayLength; ++k) {      //adding reversed array to the main array
            order_bruteForce[largestI + k + 1] = revesedArray[k];
        }
        
        float dis = calcDist(cities, order_bruteForce);
        if (dis < recordDist_bruteForce) {
            for (int i = 0; i < no_of_cities; ++i) {
                shortest_bruteForce[i] = order_bruteForce[i];
            }
            recordDist_bruteForce = dis;
            println(recordDist_bruteForce);
        }
        
        
        stroke(255);
        strokeWeight(1);
        noFill();
        beginShape();
        for (int i = 0; i < no_of_cities; ++i) {
            vertex(width / 2 + cities[order_bruteForce[i]].x, cities[order_bruteForce[i]].y);
        }
        endShape();
        
        stroke(90,255,100);
        strokeWeight(3);
        noFill();
        beginShape();
        for (int i = 0; i < no_of_cities; ++i) {
            vertex(width / 2 + cities[shortest_bruteForce[i]].x, cities[shortest_bruteForce[i]].y);
        }
        endShape();
    }
    float percentage = (float(currentPerm) / float(totalPerm)) * 100;
    textSize(20);
    text("Permutation " + currentPerm + " of " + totalPerm ,width / 2 + 10, 30);
    text(String.format("%.2f", percentage) + " % Complete", width - 165, 30);
    text("Best Distance: " + recordDist_bruteForce, width / 2 + 10, height - 20);
    currentPerm++;
    
}

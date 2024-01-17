class element{
    float fitness;
    int no_of_cities;
    int[] cities;

    element(int[] cities_list, int cityCount, float fitness_val){
        fitness = fitness_val;
        no_of_cities = cityCount;
        cities = new int[no_of_cities];
        for (int i = 0; i < no_of_cities; ++i) {
            cities[i] = cities_list[i];
        }
    }

    element(){
        fitness = 0;
        no_of_cities = no_of_cities;
        for (int i = 0; i < no_of_cities; ++i) {
            cities[i] = 0;
        }
    }

    element(int[] cities_list, int cityCount){
        no_of_cities = cityCount;
        cities = new int[no_of_cities];
        for (int i = 0; i < no_of_cities; ++i) {
            cities[i] = cities_list[i];
        }
    }

    float getFitness(){
        return fitness;
    }

    void setFitness(float fit){
        fitness = fit;
    }

    void getCities(int[] list){
        for (int i = 0; i < no_of_cities; ++i) {
            list[i] = cities[i];
        }
    }

    void setCities(int[] cities_list){
        cities = new int[no_of_cities];
        for (int i = 0; i < no_of_cities; ++i) {
            cities[i] = cities_list[i];
        }
    }
}
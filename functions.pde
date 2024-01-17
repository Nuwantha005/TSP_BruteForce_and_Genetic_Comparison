
void swap(int[] array, int i, int j) {
    int temp = array[i];
    array[i] = array[j];
    array[j] = temp;
}


void clone(int[] array1,int[] array2, int length) {
    for (int i = 0; i < length; ++i) {
        array2[i] = array1[i];
    }
}

void clone(element[] array1,element[] array2, int length) {
    for (int i = 0; i < length; ++i) {
        array2[i] = array1[i];
    }
}

float calcDist(PVector[] points, int[] orderArray) {
    float sum = 0;
    for (int i = 0; i < no_of_cities - 1; ++i) {
        sum += dist(points[orderArray[i]].x,points[orderArray[i]].y,points[orderArray[i+1]].x,points[orderArray[i+1]].y);
        //sum += dist(points[orderArray[i]].x, points[orderArray[i]].y, points.[orderArray[i+1]].x, points[orderArray[i+1]].y);
    }
    return sum;
}

void shuffle(int[] array,int arSize, int times){
    for (int i = 0; i < times; ++i) {
        swap(array, int(random(arSize)), int(random(arSize)));
    }
}


int fact(int n){
    if (n == 0) {
        return 1;
    } else {
        return n * fact(n-1);
    }
}
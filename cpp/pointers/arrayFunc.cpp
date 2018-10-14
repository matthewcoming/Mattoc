#include <iostream>
#include <string>
#include <array>
#include <iostream>
#include <cstdlib>
#include <cmath>

using namespace std;

void myFunc(int myArray[]) {
    myArray[0] = 1;
}

int *myPointFunc(int myArray[]) {
    myArray[0] = 1;
    return myArray;
}

int main() {
    int myArr[10] = {1,2,3,4,5};
    int* myArr2[10] = myFunc(myArr)
}


#include <iostream>
#include <string>
#include <array>
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <chrono>

using namespace std;


int main() {
    int distinctNums[10] = {0,1,2,3,4,5,6,7,8,9};
    srand(time(NULL));
    int matrix[3][3];

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
        int tempRand = rand() % (10-i);
        matrix[i][j] = distinctNums[tempRand];

        }
    }
    cout << "Your Matrix is: " << endl;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
    int sum = 0;
    sum = sum + (matrix[0][0]*(matrix[1][1]*matrix[2][2] - matrix[1][2]*matrix[2][1]));
    sum = sum + (matrix[0][1]*(matrix[1][0]*matrix[2][2] - matrix[1][2]*matrix[2][0]));
    sum = sum + (matrix[0][2]*(matrix[1][0]*matrix[2][1] - matrix[1][1]*matrix[2][0]));

    cout << "your determinent is: " << sum << endl;
}


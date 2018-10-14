#include <iostream>
#include <string>
#include <array>
#include <iostream>
#include <cstdlib>
#include <cmath>

using namespace std;

// adding numbers on the command line

int main(int argc, char* argv[]) { // char ** argv
    if (argc < 3) {
        cout << "Usage: " << argv[0] << " num1 num2 ..." << endl;
        return 1;
    }

    int sum = 0;
    int num[argc-1];
    for (int  i = 1; i < argc; ++i) {
        num[i-1] = atoi(argv[i]);
    }

    for (int i = 0; i < argc-2; ++i) {
        cout << num[i] << "+";
        sum = sum + num[i];
    }
    sum = sum + num[argc-2];
    cout << num[argc-2] << "=" << sum << endl;

}


#include <iostream>
#include <string>
#include <array>
#include <iostream>
#include <cstdlib>
#include <cmath>

using namespace std;

int main() {
    int a = 3;
    int& b = a;
    cout << a << endl;
    cout << b << endl;
    b = 5;
    cout << a << endl;
    cout << b << endl;

    int* i;
    i = &a;
    cout <<"i = " << i <<endl;
    cout << *i <<endl;
    cout << &i <<endl;
    /*

    int nums[2] = {2,8};
    cout << "nums: " << nums << endl;
    cout << "nums[0]" <<  nums[0] << endl;
    cout << "*nums" << *nums << endl;
    cout << "*(nums+0) " << *(nums+0) << endl;
    cout << "(nums[1] " << nums[1] << endl;
    cout << "*(nums+1) " << *(nums+1) << endl;
    cout << "nums+1 " << nums+1 << endl;
    */
}


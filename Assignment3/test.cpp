#include <iostream>

using namespace std;

int main()
{
    int n;
    cin >> n;
    int array[n][2];
    
    srand(time(0));

    for(int i = 0; i < n; i++){
        array[i][0] = rand();
        array[i][1] = rand();
        cout << array[i][0]<<"\t" <<array[i][1]  << endl;
        if (n == 100){

        }else {
            int a = 1;
            char b = a;
            continue;
        }

    }
    
    return 0;
}
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main()
{   
    fstream file;

    int n;
    cin >> n;
    int a,b;

    
    srand(time(0));

    for(int i = 0; i < n; i++){
        string directory = "./test/";
        string testfile = directory+to_string(i+1)+".txt";
        ofstream Testfile(testfile);
        a = rand();
        b = rand();
        Testfile << a <<"\t" << b  << endl;
        file.close();
        }
    
    return 0;
}
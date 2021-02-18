#include <iostream>

using namespace std;

int tp(int n1,int n2 ){
    if(n1%3==0 || n2%100==0) n1++;
    else if(n1%2==0 || n2%11==0) n2++;
    else if (n1==n2) n1 = n1*2;
    else if (n1 > n2) n2 = n2*2;
    cout << n1 << "\t" << n2 << endl;
    return 0;
}

int main(){
    int n,b;
    cin >> n >>b;
    tp(n,b);
  //  else if(n==7) n = n+1;
    //cout << n;

}
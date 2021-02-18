#include <iostream>

using namespace std;

int tp(int n1,int n2 ){
    if(n1%3==0 || n2%100==0){
         n1++;
         if(n1>n2) {
             n1+=2;
             if(n2%7==0) n2+=7;
             else n2-=7;
         }else {
            if(n2%23==0) n2+=23;
            else if(n2%31==0)n2+=23;
         }
    }else if(n1%2==0 || n2%11==0){ 
    n2++;
         if(n1>n2) {
             n1+=2;
             if(n2%7==0) n2+=7;
             else n2-=7;
         }else {
            if(n2%23==0) n2+=23;
            else if(n2%31==0)n2+=23;
         }    
    }else if (n1==n2){
        n1 = n1*2;
         if(n1>n2) {
             n1+=2;
             if(n2%7==0) n2+=7;
             else n2-=7;
         }else {
            if(n2%23==0) n2+=23;
            else if(n2%31==0)n2+=23;
         }
    }else if (n1 > n2) {
        n2 = n2*2;
         if(n1==n2) {
             n1+=2;
             if(n2%7==0) n2+=7;
             else n2-=7;
         }else {
            if(n2%23==0) n2+=23;
            else if(n2%31==0)n2+=23;
         }
    }else if(n1%n2==0) {
            n1 = n2-n1;
         if(n1==n2) {
             n1+=2;
             if(n2%7==0) n2+=7;
             else n2-=7;
         }else {
            if(n2%23==0) n2+=23;
            else if(n2%31==0)n2+=23;
         }

    }else if(n2%n1==0) {
            n2 = n2-n1;
         if(n1==n2) {
             n1+=2;
             if(n2%7==0) n2+=7;
             else n2-=7;
         }else {
            if(n2%23==0) n2+=23;
            else if(n2%31==0)n2+=23;
         }

    }
    return 0;
}

int main(){
    int n,b;
    cin >> n >>b;
    tp(n,b);
 

}

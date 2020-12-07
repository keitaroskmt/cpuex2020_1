#include<stdio.h>
#include<iostream>
#include<fstream>
#include<string>

using namespace std;

int main(int argc,char *argv[]){

    ifstream ifs(argv[1]);

    string opcode = "lui";
    int n = 3;
    string line;
    string line2;
    string substr;

    while(getline(ifs,line)){
        if(line.compare(0,2,"L.")==0){
            if(line.size()>10){
                if(line.compare(7,n,opcode)==0 || line.compare(8,n,opcode)==0 || line.compare(9,n,opcode)==0 ){
                    cout << line << endl;
                    getline(ifs,line);
                    //if(line.compare(19,9,"00000 000")!=0){
                        cout << line << endl;
                    //}
                }else{
                    getline(ifs,line);
                }
            }
        }
    }

    return 0;
}
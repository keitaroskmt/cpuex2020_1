#include <stdio.h>

int main(){
    FILE *fp;
    fp = fopen("main_with0.mem","w");

    int n = 624288;
    char buf[33] = "00000000000000000000000000000000\n";

    for(int i=0;i<n;i++){
        fwrite(&buf,sizeof(buf),1,fp);
    }
    fclose(fp);

    return 0;
}
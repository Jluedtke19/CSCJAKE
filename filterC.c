#include <stdio.h>

int main(int argc, char** argv){
  char c;
  
  while(scanf("%c", &c ) != EOF){
    if((c + 4) > 90){
      c = 64 +  (c-90);
    }
    else{
      c += 4;
    }
    printf("%c", c);
  }
}

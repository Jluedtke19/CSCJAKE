#include <stdio.h>

int main(int argc, char** argv){
  char c;
  int i = 1;
  
  while(scanf("%c", &c ) !=EOF){
    if( i % 5 == 0 ){
      i++;
      printf("%c", c);
      printf("%c", 32);
      
    }
    else{
      printf("%c", c);
      i++;
    }
  }
}

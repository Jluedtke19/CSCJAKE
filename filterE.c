#include <stdio.h>

int main(int argc, char** argv){
  char c;
  int i =1;
  
  while(scanf("%c", &c ) !=EOF){
    if( i == 47){
      printf("\n");
      printf("%c", c);
      i=1;
  }
    else{
      printf("%c", c);
      i++;
    }
  }
}


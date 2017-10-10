#include <stdio.h>

#define FALSE 0
#define TRUE 1

int isLowercaseLetter( char c) {
  if('a' <= c && c <= 'z') {
    return TRUE;
  }
  else {
    return FALSE;
  }
}
int isUppercaseLetter( char c){
  if('A' <=c && c<= 'Z'){
    return TRUE;
}
else {
  return FALSE;
 }
}

int main(int argc, char** argv){
  char c;
  
  while(scanf("%c", &c ) !=EOF){
    if(isLowercaseLetter(c)== TRUE){
      c -= 32;
      printf("%c" , c);
    }
    else{
      printf("%c", c);
    }
  }
}

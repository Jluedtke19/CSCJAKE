#include <stdio.h>
#include "means.h"

int main(int argc, char** argv){

  int x1, y1, x2, y2;
  scanf("%d", x1);
  scanf("%d", y1);
  scanf("%d", x2);
  scanf("%d", y2);
  
  printf("The Euclidean distance is %f", euclidean(x1, y1, x2, y2));
  printf("The Manhattan distance is %d", manhattan(x1, y1, x2, y2));

}

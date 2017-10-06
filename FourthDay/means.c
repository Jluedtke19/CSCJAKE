#include <math.h>
#include <stdlib.h>
#include <stdio.h>

double euclidean(int x1, int y1, int x2, int y2){
  return( (sqrt(pow(( x1 - y1), 2) + pow((x2 - y2),2))));
}

int manhattan(int x1, int y1, int x2, int y2){
  return( abs(x1 - x2) + abs( y1 - y2));
}

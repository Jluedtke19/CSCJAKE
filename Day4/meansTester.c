#include <stdio.h>
#include "means.h"

int main(int argc, char** argv){

  int x1, y1, x2, y2;
  int n;
  int nums[4];

  for(int i = 0; i <4; i++){
    scanf("%d", &n);
    nums[i]=n;
  } 
  x1 = nums[0];
  //printf("%d", x1);
  y1 = nums[1];
  x2 = nums[2];
  y2 = nums[3];

  printf("The Euclidean distance is %f", euclidean( nums[0], nums[1], 
						    nums[2], nums[3]));
  printf("The Manhattan distance is %d", manhattan(nums[0],nums[1]
						   ,nums[2],nums[3]));
}

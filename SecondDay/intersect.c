#include <stdio.h>

int main(int argc, char** argv){
  int n;
  int points[8];
  //read in points, two points on first line then next two
  for(int i =0; i <8; i++){
    scanf("%d", &n);
    points[i]=n;
     }
  //printf("%d ", points[2]);
  int a = points[2] - points[0];
  int b = points[4] - points[6];
  int c = points[3] - points[1];
  int d = points[5] - points[7];
  int e = points[4] - points[0];
  int f = points[5] - points[1];
  
  double s = (((d*e) -(b*f))/((a*d)-(b*c)));
  double t = (((a*f)-(c*e))/((a*d)-(b*c)));
  
  if( (s<=1 && s >= 0)  && (t<=1 && t >= 0)){
    printf("The lines intersect");
  }
  else{
    printf("The lines don't intersect");
  }

}

#include <stdio.h>
#include <stdlib.h>
int main ( int argc , char** argv ) {
	int offset = atoi( argv [ 1 ] ) ;
	printf("The_letter_that_is%d_places_after_'a'_is'%c'.\n",
		offset , 'a' + offset  );
}
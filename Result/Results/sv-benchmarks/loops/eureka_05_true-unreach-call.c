

int main(void){

	int array[SIZE],i;

	for(i=SIZE-1; i>=0; i--)
		array[i]=i;

	SelectionSort();

	for(i=0; i<SIZE; i++)
		__VERIFIER_assert(array[i]==i);

}


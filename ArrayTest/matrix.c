int matrix(int n,int A [][],int B [][])
{
  
	int i;
	int k;
	int j;
	int C [n][n];
	i=0;
	k=0;
	j=0;
	
	while(i < n){
	   k=0;
           while(k < n){
		   j=0;
                   while(j < n){
                       C[i][j] = C[i][j]+A[i][k] * B[k][j];
		       j=j+1;
                   }
	    k=k+1;
           }
	i=i+1;
    }

   

}
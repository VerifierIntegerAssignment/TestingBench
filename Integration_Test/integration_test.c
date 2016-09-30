int add(int a,int b);
int product(int a,int b);
int output;
void main()
{

   int X=10;
   
   int Y=20;
   
   int Z;
   

   Z=add(X,Y)+product(X,Y);
   

}


int add(int a,int b)
{
	int S;
	S = a+b;
	return S;
}

int product(int a,int b)
{
	int P;
	P = a*b;
	return P;
}
int main()
{
   int age;
   int X;
   X=0;
   if(age>=18)
   {
	X=2*X;
        goto Vote;
   } 
   X=2*age;
   if(X>=20)
   {
	X=X+1;
	
   }
   Vote:
   	age=X;
}
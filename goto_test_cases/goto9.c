int main()
{
   int age;
   int X;
   int Y;
   int Z;
   int T;
   X=0;
   Y=X+5;
   Z=2*Y;

   if(age>=18) goto Vote;
   X=2*age;

   while(X>=20)
   {

	Y=age+X;
     Vote:
   	Z=age+Y;
	
   }
   age=X;  


}
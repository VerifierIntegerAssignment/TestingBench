int main()
{
   int age;
   int X;
   X=0;
   if(age>=18)
        goto Vote;
   X=2*age;

   if(X>=20)
   {
	X=X+1;
	age=age+1;
   }
   else if (X>=40)
   {
	X=X+2;
	age=age+2;
   }
   else
   {
	X=X+3;
	Vote:
   	age=X;
	age=age+3;
   }
}
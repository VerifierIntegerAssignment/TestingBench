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
   	age=X;
	
   }
   else if(X>=40)
   {
        X=X+1;
	age=age+1;
   }
   else
   {
        X=X+1;
   	age=X;
	if(X>=20)
   {
	X=X+1;
   	age=X;
	
   }
   else if(X>=40)
   {
        X=X+1;
	age=age+1;
   }
   else
   {
        X=X+1;
	Vote:
   	age=X;

   }


   }

   age=age+1;
}
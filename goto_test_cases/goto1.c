int main()
{
   int age;
   int X;
   int Y;
   int Z;
   X=0;
   
   Y=X+5;
   
   Z=2*Y;

   if(age>=18)
   {
        goto Vote;
   } 
   X=2*age;
   age=X+1;
   while(X>=20)
   {
	Y=age+X;
   	
	Z=age+Y;
	Vote:
   		age=X;
	X=X+1;  


   }
  
}
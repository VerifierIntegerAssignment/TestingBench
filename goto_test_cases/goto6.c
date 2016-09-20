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
   if(X>=20)
   {
	goto NoVote;
	
   }
   Vote:
   	age=X;
   
	Y=age+X;
   
	Z=age+Y;
   
  NoVote:
   	age=Z;
  


}
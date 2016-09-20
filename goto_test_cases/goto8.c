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
   while(X>=20)
   {
	
	if(age>=18)
        {
          goto NoVote;
        } 
	Y=age+X;
	
        NoVote:
   	   
        Z=age+Y;
	
   }
   Vote:
   	age=X;  


}
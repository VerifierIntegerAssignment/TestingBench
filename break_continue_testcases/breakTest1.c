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
        Y=X+5;
   
   	Z=2*Y;
   } 
   X=2*age;
   while(X>=20)
   {
	
	Y=age+X;	
	Y=X+5;
   
   	Z=2*Y;

        if(age>=16)
        {
          break;
        } 

	Y=age+X;
		   
        Z=age+Y;

	if(age>20)
	{

		if(age>=18)
        	{
          		age=X+Y;
			continue;
        	}
		else{
			X=X+1;
			break;
			
		} 
		X=Y+1;
		age=Y+age;

	}
	
	


	
   }

   age=X;  


}
int main()
{
   int age;
   int X;
   int Y;
   int Z;
   X=0;
   
   Y=X+5;
   
   Z=2*Y;
   X=2*age;
   while(X>=20)
   {
	 
	while(X>=20)
   	{

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
        
				if(age>=18)
        			{
          				goto Vote;
        			}
				X=X+1;
   				age=X;

   			}


   		}

 
		Y=age+X;
	 	   
        	Z=age+Y;
	}
	
   }

  Y=age+X;
	 	   
  Z=age+Y;
  Vote:
  age=X;  


}
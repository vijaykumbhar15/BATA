function validate(frm)
   {
	var unm=frm.txtusername.value;
 	var pass1=frm.txtpassword.value;
	var pass2=frm.txtconpassword.value;
	if(unm==null||unm=="")
	{
	   alert("enter username");
	   frm.userName.focus();  
	   return false;         
     }
       if(pass1==null||pass1=="")
	{
	   alert("enter password");
	   frm.txtpassword.focus();   
	   return false;          
        } 
	if(pass1.length<8)
	{
	   alert("password must be atleast 8 digits");
	   frm.txtpassword.focus();  
	   return false;         
        }  
	if(pass2==null||pass2=="")
	{
	   alert("enter password");
	   frm.txtconpassword.focus();   
	   return false;          
        } 
	if(pass2.length<8)
	{
	   alert("password must be atleast 8 digits");
	   frm.txtconpassword.focus();  
	   return false;	         
        } 
	if(pass1.length>=8&pass2.length>=8)   
	{
 	   if(pass1!=pass2)
	     {
	        alert("password and confirm password must match");
		frm.txtconpassword.focus();
  		return false;
	     }
	}
	return true;
   }
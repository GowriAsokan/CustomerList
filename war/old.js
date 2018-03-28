count = 1;
 
 var fname = document.getElementById("fname");
 var lname = document.getElementById("lname");
 var email = document.getElementById("emailpopup");
 var phone = document.getElementById("phonenopopup");
 

 var fname2 = document.getElementById("firstname");
 var lname2 = document.getElementById("lastname");
 var email2 = document.getElementById("emailaddress");
 var phone2 = document.getElementById("phoneno");
   
 var array= [];
 function custdetails()
 {
	// var button = document.getElementById('addcustomer');
     var div = document.getElementById('popupform');
     if (div.style.display !== 'none') {
         div.style.display = 'none';
     }
     else {
         div.style.display = 'block';
     }
 };

  function custlist()
	{
		var custid= Math.random().toString(36).substr(2, 9);


  custObj = 
 {
 	firstname: fname.value,
 	lastname : lname.value,
 	emailaddress :email.value,
 	phoneno: phone.value,
    id:custid ,
    todolist:userArray
 }	
 
 console.log("this is with list"+custObj);
 createList(custObj);
 
 fname.value="";
 lname.value="";
 email.value="";
 phone.value="";
	}
  
  function createList(custObj){
	 					
 var li =document.createElement("li");
 li.listid = custObj.id;
 
 var listvalue=document.createElement("label");				
 	listvalue.innerHTML=custObj.firstname;
 	li.appendChild(listvalue);
 
	
 var closebutton = document.createElement("button");
	closebutton.className = "close";
	closebutton.id = "closeid";
	closebutton.innerHTML="Delete"
	li.appendChild(closebutton);
	
 document.getElementById("customerList").append(li);
	
 var pop = document.getElementById('popupform');
 pop.style.display = 'none';
	
	var cusJSON= JSON.stringify(custObj);
 console.log(cusJSON);
 localStorage.setItem(custObj.id,cusJSON);	
 
 /*  li.setAttribute('name',custObj.firstname);
 li.appendChild(document.createTextNode(custObj.firstname)); 
 document.getElementById("customerList").append(li); */	
 
 
 
 li.addEventListener("click", function(e){
	 
	
	 var result = localStorage.getItem(custObj.id);
     var res= JSON.parse(result);
	 console.log(res);
	 
	 fname2.value = res.firstname;
	 lname2.value = res.lastname;
	 email2.value= res.emailaddress;
	 phone2.value=res.phoneno;
	 
	
	
 });
 
count++;
}

  function update(){
	  
	
	    
 var custdetailsObj = 
  		{
  			custfname  :  firstname.value,
  			custlname  :  lastname.value,
  			custemail  :  emailaddress.value,
  			custphone  :  phoneno.value
 	 }	
  
  console.log(custdetailsObj);
 }
  
  
  //To do list
  var userArray		= [];

 var previousText = "";
 var deleteText ="";

function guid() {
	  function s4() {
	    return Math.floor((1 + Math.random()) * 0x10000)
	      .toString(16)
	      .substring(1);
	  }
	  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
	    s4() + '-' + s4() + s4() + s4();
}
 
 function todolist()
  {
  	
  		if(event.keyCode == 13)
  		{
  			
  			var userinput= document.getElementById("todoinput");
  			
  			var todoObj = 
  			{
  				name: userinput.value,
  				id: guid(),
  				isCompleted: false,
  				isDeleted: false
  			}
  			
  			
  			/* var liTag = createTodolist(todoObj);
  			
  			document.getElementById("list").append(liTag);
  			 */
  			
  			userArray.push(todoObj);
  			userinput.value = "";

  			createTodolist(todoObj);
  		}
      }
  
  
  function createTodolist(todoObj){
	  
	  var li=document.createElement("li");
	  li.id= todoObj.id;
  
	  document.getElementById("list").append(li);
	 	
	  
	
  
   var displaytext=document.createElement("span");
  displaytext.id="displayText";
  displaytext.className="displayText";
  displaytext.innerHTML=todoObj.name;
  li.appendChild(displaytext);

 var closebutton = document.createElement("SPAN");
	var txt = document.createTextNode("\u00D7");
	closebutton.className = "close";
	closebutton.id = "close";
	closebutton.appendChild(txt);
	li.appendChild(closebutton);  
	
	closebutton.addEventListener("click", function(e){
			var id = closebutton.parentElement.id;
			var name = closebutton.parentNode.querySelector('.displayText').className;
			
			var selectedTodo = searchTodo(id);
			
			selectedTodo.isDeleted = true;
			
			console.log(selectedTodo);
			
			closebutton.parentNode.remove();
			
			var index = searchTodoIndex(id);
			
			userArray.splice(index, 1);
	
	 });
	
  function searchTodo(id)
		  {
		  	for( var i=0; i<userArray.length; i++)
		  	{
		  		if( userArray[i].id == id ){
		  			
		  			return userArray[i];
		  		}
		  	}
		  }
 function searchTodoIndex(id)
		  {
		  	for( var i=0; i<userArray.length; i++)
		  	{
		  		if( userArray[i].id == id ){
		  			
		  			return i;
		  		}
		  	}
		  }

	
  }
	
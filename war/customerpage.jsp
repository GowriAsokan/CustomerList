<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
 <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Customer Details</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
 
 <SCRIPT type="text/javascript">
    function noBack() { window.history.forward(); }   
	</SCRIPT>
  </head>

 
 <style>
 h2
 {
background:#9ddcd9;
font-size:25px;
height:50px;
line-height:45px;
text-align: center;
 } 
 
 #leftdiv
 {
 position:absolute;
 left: 0px;
  height:100%;
    width:33% ;
    background:#a6e6dc;
   } 
    #centerdiv
 {
 position:absolute;
 left: 33%;
  height:100%;
    width:33% ;
        background:#9ddcd9;
    
   } 
    #rightdiv
 {
 position:absolute;
 right:0px;
  height:100%;
    width:34% ;
        background:#a6e6dc;
    
 }
  #addcustomer{
  
  
   background-color: white;
    border: none;
    border-radius: 5px;
    color: black;
    padding-top: 12px;
    padding-bottom: 36px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin-left: 155px;
    margin-top: 45px;
    cursor: pointer;
    width: 154px;
    height: 48px;
  }
  #addbutton{
  background-color: white;
    border: none;
    border-radius: 5px;
    color: black;
    padding-top: 7px;
    padding-bottom: 34px;
    padding-left: -18px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 22px;
    margin-left: 73px;
    cursor: pointer;
    width: 140px;
    height: 31px;
  }
  
  #popupform{
 background-color: white;
    margin-left: 205px;
    margin-top: 15px;
    margin-right: 82px;
    padding-top: 25px;
    padding-bottom: 25px;
    padding-left: 25px;
  }
  #updatebutton{
   background-color: white;
    margin-left: 27px;
    margin-top: 30px;
    padding-top: 25px;
	font-size: 45px;
  }
  .textbox
  {
  padding-bottom: 4px;
  margin-bottom: 10px;
  margin-right: 22px;
  }
 #customerdetailsform{
 margin-top: 45px;
    margin-left: 70px;
 }
 
 .inputbox{
 margin-right:50px;
 }
 #firstname{
 margin-right:50px;
 }
 
 #todoinput{
 width: 257px;
    float: left;
    height: 42px;
    text-align: left;
    margin-top: 40px;
    margin-left: 20px;
    margin-bottom: 20px;
 }
 
 #popupform{
	 display:none;
	 position: absolute;
 }
 
 .inputbox{
   padding-bottom: 7px;
    padding-top: 7px;
    margin-bottom: 10px;
    margin-left: 14px;
    width: 170px;
    text-align: left; }
 #savebutton
 {
     margin-top: 10px;
   
 }
 li
 {
  overflow: auto;
  width: 90%;
  text-align: left;
  padding: 10px 10px 10px 20px;
}
ul li:nth-child(odd) {
  background: #f9f9f9;
}
ul li:nth-child(even)
{
background:#9ddcd9;}

.close {
  float: right;
  background-color: white;
    border: none;
    border-radius: 5px;
    color: black;
    padding-top: 8px;
    padding-bottom: 26px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin-left: 100px;
    cursor: pointer;
    width: 90px;
    height: 15px;
    
   
   }
  #updatebutton
  {
    height: 100px;
    width: 200px;
  }
  
 //To Do List
 
 
span.close {
    width: 20px;
    text-align: center;
    
} </style>
<%
if(session!=null && (session.getAttribute("sessionEmail")!=null)){
%> 
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="">
   <div> <h2>Customer Details </h2>
    <span><input type="button" id="logoutButton" value="logout"
				onclick="location.href='/Logout';"></span> </div>
    
<div id = "container" class="containerclass">
  <div id="leftdiv"   class = "leftclass">
 	<input type= "button" id= "addcustomer" value="Add Customer" onclick="custdetails();" />
	 <div id="popupform"  class="detailsboxclass" > 
  		<input type="text" name="FirstName" placeholder="Firstname" class="textbox" id="fname"> <br>
  		<input type="text" name="LastName" placeholder="Lastname" class="textbox" id="lname"> <br>
  		<input type="text" name="email" placeholder="Email" class="textbox" id="emailpopup"> <br>
 		<input type="text" name="phoneno" placeholder="PhoneNo" class="textbox" id="phonenopopup"> <br>
		<input type="button" value="submit" onclick="custlist();" id="savebutton">
	
	</div>
 	<ul id="customerList"></ul>
 </div>
  <div id="centerdiv" class = "centerclass">
  	<form id="customerdetailsform" action="" method="post">
  	FirstName: <br>
  	<input type="text" name="textbox" id="firstname" class="inputbox"> <br>
  	LastName: <br>
    <input type="text" name="textbox" id="lastname" class="inputbox" > <br>
  	Email:    <br>
  	 <input type="text" name="textbox" id="emailaddress" class="inputbox"> <br>
  	PhoneNo: <br>
  	  <input type="text" name="textbox" id="phoneno" class="inputbox"> <br>
  	<input type="button" id="updatebutton" value="Update" onclick="update();"/>
  	</form>
  </div>
 
 <div id="rightdiv"  class = "rightclass">
  <input type="text" id="todoinput" name="list" placeholder="Enter the new list here" onkeypress="todolist();"> 
  <div><input type="button" id="addbutton" value="Add"  onclick="store();"/></div>
  
  <ul id="list"></ul>
 
 </div>
 </div>
 
 <script src="custpg.js"></script>
</body>
</html>
<% 
}
else{ response.sendRedirect("loginpage.jsp");
}
%>
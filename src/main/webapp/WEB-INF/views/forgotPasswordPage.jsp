<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Forgot Password Page</title>
  </head>
  <body>
  <%
  	String email = (String)request.getAttribute("email");
  	String invalidEmail = (String)request.getAttribute("invalidEmail");
  	String validEmail = (String)request.getAttribute("validEmail");
  	String otpVerified = (String)request.getAttribute("otpVerified");
  
  %>
  <jsp:include page="headpage.jsp"/>
  <form action="./forgotPasswordAction" method="get"> 
  	  <div class = "container " >
    	<div class = "row">
    		<div class = "col-12 mb-4 mt-3"	>
    			<jsp:include page="titlepage.jsp"/>
    		</div>
    	</div>
    	<div class = "row">
    		<div class = "col-12">
    		<%
    			if(invalidEmail != null && invalidEmail.equals("true"))
    			{
    		%>
    		
    		<div class="alert alert-danger" role="alert">
 This Email doesn't exists!! Please try another one.
</div>
    		<%
    			}
    			else if(otpVerified!= null && otpVerified.equals("true"))
    			{
    		%>
    		<div class="alert alert-success" role="alert">
 The Password is sent on your registered Email. Please check your Email and Log in.
</div>
    		
    		<%
    			}
    			else {
    				
    			}
    		%>
    			<div class = "container mt-5 " >
    				<div class = "row justify-content-center align-items-center   mb-4">
    					<div class = "col-3">
    						<label for="exampleInputEmail1">ENTER EMAIL</label>
    					</div>
    					<div class = "col-6">
    						<input type="email" value = "<%=email!=null?email:"" %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name = "email" placeholder="Enter email">
    					</div>
    				</div>
    				
    				<div class = "row justify-content-center align-items-center mb-5 pb-5 ">
    					<div class = "col-3">
    						<label for="exampleInputEmail1">ENTER OTP</label>
    					</div>
    					<div class = "col-6">
    					<%
    						if(validEmail!=null && validEmail.equals("true"))
    						{
    					%>
    					 <input type="number" name = "otp" id="disabledTextInput" class="form-control" placeholder="Enter OTP"> 
    					
    					<%
    						}
    					else
    					{
    					
    					%>
    					<input type = "hidden" name = "otp" value = "0"/>
    					<fieldset disabled>
    					
    						 <input type="number" name = "otp" id="disabledTextInput" class="form-control" placeholder="Enter OTP"> 
    						</fieldset>
    						
    						<%
    					}
    						%>
    					</div>
    				</div>
    				
    				<div class = "row pb-5 mb-5">
    					<div class = "col-12">
    						<div class = "container text-center">
    						<%
    							if(validEmail!=null && validEmail.equals("true"))	
    							{
    						%>
    						<button type="submit" class="btn btn-success">Get Password</button>
    						<%
    							}
    							else if(otpVerified!= null && otpVerified.equals("true"))
    							{
    					
    						%>
    						<a href = "/webapp4_clone/login"><button type="button" class="btn btn-info">Go Back to Login >></button></a>
    						
    						<% 
    							}
    							else
    							{
    						%>
    							<button type="submit" class="btn btn-info">Generate OTP</button>
    						<%
    							}
    						%>
    					</div>
    				</div>
    			
    			</div>
    			
    			<div class = "row mt-5 pt-5">
    				<div class = "col-12">
    					<jsp:include page="footerpage.jsp"/>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    </div>
  </form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
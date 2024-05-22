<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- ----------------------------------------------------- -->
    <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Bootstrap JS (jQuery is required) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- ----------------------------------------------------------------- -->
    
<script>
function validateForm() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;

    if (password != confirmPassword) {
        alert("Passwords do not match. Please enter the same password in both fields.");
        return false;
    }
    return true;
}
</script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Sign Up Page</title>
  </head>
  
  <body>
  <%
  
  	String userExists = (String)request.getParameter("userExists");
  	String email = (String)request.getParameter("email");
  	String username = (String)request.getParameter("username");
  	String password = (String)request.getParameter("password");
  	String confirmPassword = (String)request.getParameter("confirmPassword");
  	
  	String invalidInfo = (String)request.getAttribute("invalidInfo");
  	String invalidotp = (String)request.getAttribute("invalidOtp");
  	String signUpSuccess = (String)request.getAttribute("signUpSuccess");
  	if(signUpSuccess!=null && signUpSuccess.equals("true"))
  	{
  		email = null;
  		username = null;
  		password = null;
  		confirmPassword = null ;
  	} 
 
  	
  %>
  <jsp:include page="headpage.jsp"/>
    <div class = "container  ">
    	<div class = "container mb-5 pb-3">
    	<div class = "row">
    		<jsp:include page="titlepage.jsp"/>
    	</div>
    	</div>
    	<form action="./signupAction" method = "get " onsubmit="return validateForm()"> 
    	<div class = "row">
    		<div class = "col-12">
    			<div class = " row mb-4">
    			<%
    				
    			if(signUpSuccess!=null && signUpSuccess.equals("true"))
    			{
    			%>
    			 <div class="alert alert-success" role="alert">
  Your Sign Up process is Succesfull.. You can Log in now.
</div> 
<%
    			}
    			
    			else if(invalidInfo!=null && invalidInfo.equals("true"))
    			{
    			
%>

<div class="alert alert-danger" role="alert">
  Please Enter Valid Data
</div> 
<%
    			}
    			else if(invalidotp!=null && invalidotp.equals("true")){

%>
<div class="alert alert-danger" role="alert">
  Invalid OTP
</div>
<%
    			}
    			else if(userExists!=null && userExists.equals("true"))
    			{
    				
    			

%>
<div class="alert alert-warning" role="alert">
  User with this email already Exists!! Try signing up with another Email.
</div>

<%
    			}
    			else
    			{
    				
    			}
%>
    				<div class = "col-3">
    					<label for="emailText">ENTER EMAIL</label>
    				</div>
    				<div class = "col-6">
    				 <input type="email" name = "email" class="form-control" id="exampleInputEmail1" value = "<%=email!=null?email:"" %>" aria-describedby="emailHelp" placeholder="abc@gmail.com">
    				</div>
    			</div>
    			<div class = " row mb-4">
    				<div class = "col-3">
    					<label for="emailText">ENTER USERNAME</label>
    				</div>
    				<div class = "col-6">
    				 <input type="text" name = "username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"value = "<%=username!=null?username:"" %>" placeholder="Your Username">
    				</div>
    			</div>
    			<div class = "row mb-4">
    				<div class = "col-3">
    					<label for="passwordText">ENTER PASSWORD</label>
    				</div>
    				<div class = "col-6">
    				 <input value = "<%=password!=null?password:"" %>" type="password" id = "password" class="form-control" name = "password" placeholder="Password">
    				</div>
    			</div>
    			<div class = "row mb-4">
    				<div class = "col-3">
    					<label for="passwordText">CONFIRM PASSWORD</label>
    				</div>
    				<div class = "col-6">
    				 <input value = "<%=confirmPassword!=null?confirmPassword:"" %>" type="password" name = "confirmPassword" class="form-control" id="confirmPassword" placeholder=" Confirm Password">
    				</div>
    			</div>
    			<div class = "row mb-5">
    				<div class = "col-3">
    					<label for="passwordText">ENTER OTP</label>
    				</div>
    				<div class = "col-6">
    				<%
    				
    				String isOtpSent = (String)request.getAttribute("otpSent");
    					if(isOtpSent!=null && isOtpSent.equals("true"))
    					{
    				%>
    				 <input type="number" name = "otp" id="disabledTextInput" class="form-control" placeholder="Enter OTP"> 
    				
    				<%
    					}
    					else{
    					
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
    			<div class = "row mb-4">
    				<div class = "container text-center">
    				<%
    				if(signUpSuccess!=null && signUpSuccess.equals("true"))
    				{
    					
    				
    				%>
    				<a href = "/webapp4_clone/login">
    					<button type="button" class="btn btn-info">Go Back to Login</button>
    				</a>
    				
    				<%
    				}
    				else{
    					String signupSetEnable = (String)request.getAttribute("signupSetEnable");
    				if(signupSetEnable!=null && signupSetEnable.equals("true"))
    				{
    				%>
    				
    				<button type="submit" class="btn btn-success">Sign Up</button>
    				<%
    				}
    				
    				else{
    				%>
    				 <!-- Button to trigger modal -->
<button type="submit" class="btn btn-info">Generate OTP</button>

    					
    					<%
    				}
    				}
    					%>
    				</div>
    			</div>
    			<div class = "row">
    				<div class = "col-5">
    					<h6>Already Have an Account? <a href="/webapp4_clone/login">Login Here</a></h6>
    				</div>
    			</div>
    			<div class = "row mt-5">
    				<div class = "col">
    					<jsp:include page="footerpage.jsp"/>
    				</div>
    			</div>
    		</div>
    	</div>
    	</form>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
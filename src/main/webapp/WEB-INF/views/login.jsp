<%@page import="com.org.Model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
/* window.history.forward();
        function noBack()
         {
             window.history.forward();
         } */
        
    </script>
    
   <script>
  document.addEventListener('DOMContentLoaded', function () {
    // Get the button and the toast element
    var toastButton = document.getElementById('liveToastBtn');
    var toastElement = document.getElementById('liveToast');

    // Create a Bootstrap Toast instance
    var toast = new bootstrap.Toast(toastElement);

    // Add an event listener to the button to show the toast when clicked
    toastButton.addEventListener('click', function () {
      toast.show();
    });
  });
</script>
   
<jsp:include page="headpage.jsp"/>


<body onload="noBack();">
<form action="./verifyLogin" method="post">
	<div class="container">

			<!-- title start -->
			<jsp:include page="titlepage.jsp"/>
			<!-- title end -->
			
		<div class="row" style="height:400px;">
			<div class="col-md-6">
			<%
			try{
				
			
			if((Users)request.getAttribute("user") !=  null)
			{
			%>
			<div class="alert alert-danger" role="alert">
  Invalid Username or Password
</div>
<%
			}
else if(request.getParameter("logoutStatus").equals("true"))
{
	
%>
<div class="alert alert-success" role="alert">
  You have been Log out Succesfully.
</div>
<%
		}
			
			}
			catch(Exception exception)
			{
				
			}
%>
			<%-- <%=(Users)request.getAttribute("user")!=null?"Invalid Username or Password":""  %> --%>
				<div class="row p-2">
					
					<div class="col-md-6">ENTER EMAIL</div>
					<div class="col-md-6">
						<input type="hidden" name="page" value="LoginPage"/>
						<input type="text" name="email" class="form-control"/>
					</div>
				</div>
				
				<div class="row p-2">
					<div class="col-md-6">ENTER PASSWORD</div>
					<div class="col-md-6"><input type="password" name="password" class="form-control"/></div>
				</div>
				<div class="row">
					<div class="col-md-2"><input type="submit" value="LOGIN" class="btn btn-info"/></div>
					<div class="col-md-2">
					<a href="/webapp4_clone/signup">
					<input type="button" value="Sign Up" class="btn btn-info"/>
					</a>
					</div>
					
				</div>
				<div class = "row mt-4">
					<div class = "col-7">
						<h5>Forgot Password? <a href="/webapp4_clone/forgotpassword">Click Here.</a></h5>
					</div>
				</div>
			</div>
			
			<div class="col-md-6">
		<!-- Button to trigger the toast -->
<!-- <button type="button" class="btn btn-primary" id="liveToastBtn">Show live toast</button>

Toast container
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
  <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <img src="..." class="rounded me-2" alt="...">
      <strong class="me-auto">Bootstrap</strong>
      <small>11 mins ago</small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      Hello, world! This is a toast message.
    </div>
  </div>
</div> -->

<!-- Include Bootstrap JS -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> -->


			</div>
		</div><!-- row content bar -->
		

		<jsp:include page="footerpage.jsp"/>
	</div>
</form>

</body>
</html>
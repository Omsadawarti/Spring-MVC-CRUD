<%@page import="com.org.Model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<div class = "container-fluid">
		<div class="row">
			<div class="col-2 mt-3">
			
				<img src="https://i.ibb.co/xmqvxHF/nlt.png" alt="nlt" border="0">
			</div>
			<div class="col-6 text-center justify-content-center align-items-center mt-4">
				<div class="display-5">NLT INFOTECH PVT LTD</div>
			</div>
			
			<div class="col-4 ">
			<%
				Users users = (Users)session.getAttribute("loginUser");
				if(users != null)
				{
			%>
			
			 <div class="card mb-3" style="max-width: 700px; max-height: 160px">
  <div class="row g-0">
    <div class="col-4  text-center mt-5">
      <img src="https://i.ibb.co/Vqx35zh/profile-6512774-2.png" alt="profile-6512774">
    </div>
    <div class="col-8">
      <div class="card-body">
        <h5 class="card-title">Welcome <%=users.getUsername() %>.</h5>
        <p class="card-text">You have been Logged in Succesfully!!</p>
        <a href = "/webapp4_clone/logout"><button type="button" class="btn btn-outline-warning">Log Out</button></a>
        
      </div>
    </div>
  </div>
  
</div> 
			<%
				}
			%>
			</div>
	
		</div><!-- row header bar -->
		
		
	</div>
	<hr>
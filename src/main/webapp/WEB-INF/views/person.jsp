<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
       /*  function noBack()
         {
             window.history.forward()
         }
         */            
    </script>
    <script>
function convertToUppercase(input) {
  input.value = input.value.toUpperCase();
}
</script>
<jsp:include page="headpage.jsp"/>
<body onload="noback();">
<br>
<form action="./personsubmit" method="post">
	<div class="container">	
		 <%-- <jsp:include page="userlogin.jsp"/>  --%>
		<jsp:include page="titlepage.jsp"/>
		
		<div class="row" style="height:400px;">
				
				<div class="col-md-6">
				<%
				try
				{
					int a = Integer.parseInt(request.getParameter("recordAdded"));
				
				
					if(a == 1)
					{
						
					
				%>
				<div class="alert alert-success" role="alert">
  Record Added Succesfully
</div>
				<%
					}
				}
				catch(NumberFormatException exception)
				{
					
				}
					 if(  (Integer)request.getAttribute("invalidData")!=null)
					{
						%>
						<div class="alert alert-warning" role="alert">
  Enter Valid Information
</div>
						
				<%
					}
					else
					{
						
					}
				%>	
				
					<div class="row p-2">
						<div class="col-md-6">Enter Name</div>
						<div class="col-md-6">
							<input type="hidden" name="page" value="PersonSubmit"/>
							<input type="text" name="name" class="form-control" oninput="convertToUppercase(this)"/></div>
					</div>
					<div class="row p-2">
						<div class="col-md-6">Enter Age</div>
						<div class="col-md-6"><input type="number" name="age" class="form-control" oninput="convertToUppercase(this)"/></div>
					</div>
					<div class="row p-2">
						<div class="col-md-6">Enter Phone</div>
						<div class="col-md-6"><input type="phone" name="phone" class="form-control" oninput="convertToUppercase(this)"/></div>
					</div>
					<div class="row p-2">
						<div class="col-md-6"><input type="submit" value="SUBMIT" class="btn btn-info"/></div>
					</div>
				
				
				</div>
				
				<div class="col-md-6">
				<jsp:include page="tablecontent.jsp"></jsp:include>
				
				</div>
		</div><!-- row content bar -->
		
		
		<jsp:include page="footerpage.jsp"/>
	</div>
</form>
</body>
</html>
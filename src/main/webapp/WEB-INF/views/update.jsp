<%@page import="com.org.Model.Persons"%>
<%@page import="com.org.Service.PersonService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<jsp:include page="headpage.jsp"/>
  <script>
function convertToUppercase(input) {
  input.value = input.value.toUpperCase();
}
</script>
<body>
<form action="/webapp4_clone/personupdate" method="post">
	<div class="container">	
		<%-- <jsp:include page="userlogin.jsp"/> --%>
		<jsp:include page="titlepage.jsp"/>
		
		<%
			PersonService personService  = (PersonService)request.getAttribute("personService");
		System.out.println("service layer got");
		int id = Integer.parseInt(request.getAttribute("id").toString());
		System.out.println("id got");
		Persons persons  = null ;
		if(id !=0)
		{
			System.out.println("Inside if block");
			 persons = personService.getPerson(id);
			 System.out.println("person object set");
		}
		
		%>
				<div class="row" style="height:400px;">
				
				<div class="col-md-6">
				<%
					if((Integer)request.getAttribute("updateMsg")!=null)
					{
				%>
				<div class="alert alert-success" role="alert">
  Record Have been Updated Succesfully
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
							
							<%-- <input type="hidden" name="id" value="<%=session.getAttribute("idValue")!=null?session.getAttribute("idValue"):"" %>"/> --%>
							<input type="text" name="name" class="form-control" value="<%=persons == null?"":  persons.getName()%>" oninput="convertToUppercase(this)"/></div>
					</div>
					<div class="row p-2">
						<div class="col-md-6">Enter Age</div>
						<div class="col-md-6"><input type="number" name="age" value="<%=persons == null?"":  persons.getAge() %>" oninput="convertToUppercase(this)"class="form-control"/></div>
					</div>
					<div class="row p-2">
						<div class="col-md-6">Enter Phone</div>
						<div class="col-md-6"><input type="phone" name="phone" value="<%=persons == null?"":  persons.getPhone()	 %>"oninput="convertToUppercase(this)" class="form-control"/></div>
					</div>
					<div class="row p-2">
					<div class = "col-2">
						<div class = "container mr-1">
							<input type="submit" value="UPDATE" class="btn btn-info"/>
						</div>
					
					</div>
					
					<div class = "col-2">
					<div class = "container">
						<a href="/webapp4_clone/persons"><input type="button" value="HOME" class="btn btn-info"/></a>
					</div>
					
					</div>
						
					</div>
				<%
				
				
				%>
				
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
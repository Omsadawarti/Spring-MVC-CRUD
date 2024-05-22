<%@page import="com.org.Model.Persons"%>
<%@page import="com.org.Service.PersonService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="headpage.jsp"/>
<body>
	<div class="container">	
<form action="/webapp4_clone/deleteperson" method="post">
		<%-- <jsp:include page="userlogin.jsp"/> --%>
		<jsp:include page="titlepage.jsp"/>
		
		<%
			PersonService personService  = (PersonService)request.getAttribute("personService");
		int id = Integer.parseInt(request.getAttribute("id").toString());
		Persons persons  = null ;
		if(id !=0)
		{
			 persons = personService.getPerson(id);
		}
		
		%>
	
		<div class="row" style="height:400px;">
				<div class="col-md-6">
				<%
					if((Integer)request.getAttribute("deleteStatus")!=null)
					{
				%>
				<div class="alert alert-success" role="alert">
  Record Have been Deleted Succesfully
</div>
<%
}
	else if((Integer)request.getAttribute("invalidData")!=null)
		
	{
		
	
%>
<div class="alert alert-danger" role="alert">
  Invalid Data
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
							<input type="hidden" name="page" value="PersonDelete"/>
							
							<input type="text" name="name" class="form-control" value="<%=persons == null?"":  persons.getName()%>"/></div>
					</div>
					<div class="row p-2">
						<div class="col-md-6">Enter Age</div>
						<div class="col-md-6"><input type="number" name="age" class="form-control" value="<%=persons == null?"":  persons.getAge()%>"/></div>
					</div>
					<div class="row p-2">
						<div class="col-md-6">Enter Phone</div>
						<div class="col-md-6"><input type="phone" name="phone" class="form-control" value="<%=persons == null?"":  persons.getPhone()%>"/></div>
					</div>
					<div class="row p-2">
						<div class = "col-2">
						<div class = "container mr-1">
							<input type="submit" value="DELETE" class="btn btn-info"/>
						</div>
					
					</div>
					
					<div class = "col-2">
					<div class = "container">
						<a href="/webapp4_clone/persons"><input type="button" value="HOME" class="btn btn-info"/></a>
					</div>
					
					</div>
					</div>
				</div>
				
				<div class="col-md-6">
					<jsp:include page="tablecontent.jsp"/>
				</div>
				
				
		</div><!-- row content bar -->
		
		
		
		<jsp:include page="footerpage.jsp"/>
	</div>
</form>
</body>
</html>
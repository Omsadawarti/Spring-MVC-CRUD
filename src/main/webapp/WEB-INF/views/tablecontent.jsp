<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.org.Model.Persons"%>
<%@page import="java.util.List"%>
<%@page import="com.org.Service.PersonService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
   // "WRITE YOUR CODE HERE"
    %>
    
    
<table class="table">
  						<thead>
    					<tr>
      						<th scope="col">#</th>
      						<th scope="col">NAME</th>
      						<th scope="col">AGE</th>
      						<th scope="col">PHONE</th>
    					</tr>
    					</thead>
    					
    					<tbody>
    					<%
    					System.out.println("Villa");
    					PersonService personService = (PersonService)request.getAttribute("personService");
    					List<Persons> personList = personService.getAllPersons();
    					System.out.println("I got the list you needed ");
    					for(Persons p:personList){
    					%>
    					
						    <tr>
						      <th class="text-successs" scope="row"><a href="/webapp4_clone/update/<%=p.getId() %> ">Edit</a>||<a href="/webapp4_clone/delete/<%=p.getId() %> ">Delete</a></th>
						      <td><%=p.getName()%></td>
							      <td><%=p.getAge() %></td>
						      <td><%=p.getPhone()%></td>
						    </tr>
						    
						<%
    					}
						//"WRITE YOUR CODE HERE"
    					%>
						  
    					</tbody>
    				</table>
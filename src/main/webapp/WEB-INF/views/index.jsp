<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
</head>
<body>
<a href="login.jsp">Login</a><br><br>
<a href="person.jsp">Person Submit</a><br><br>
<a href="update.jsp">Person Update</a><br><br>
<a href="delete.jsp">Person Delete</a><br><br>

<h1>Id: ${id }</h1>
<h1>Username: ${username }</h1>
<h1>Password: ${password }</h1>
<h1>Status:${status } </h1>
<div class="container mt-5">
 <button type="button" class="btn btn-primary" id="liveToastBtn">Show live toast</button>
</div>
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
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
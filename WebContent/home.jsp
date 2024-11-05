<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
		UserDetails user2=(UserDetails)session.getAttribute("userD");
		if(user2==null){
			response.sendRedirect("login.jsp");
			session.setAttribute("Login-error", "Please Login..");
		}
	
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body>


<div class="container-fluid p-0">
<%@include file="all_component/navbar.jsp" %>
<div class="card py-4">
<div class="card-body text-center" >
<img alt="" src="img/pen-6238177_1280.png" class="img-fluid mx-auto" style="max-width: 450px; border-radius:20px" >
<h1>Start Taking Notes</h1>
<a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
</div>

</div>

</div>



<%@include file="all_component/footer.jsp" %>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.PostDAO"%>
<%@ page import="com.User.Post"%>
<%@ page import="com.User.UserDetails"%>
<%@ page import="com.db.DBConnect"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");
if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login..");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<h2 class="text-center">All Notes</h2>
		<div class="row">
			<div class="col-md-12">
			
			<%
				if (user3 != null) {
					PostDAO ob = new PostDAO(DBConnect.getConn());
					List<Post> post = ob.getAllNotes();
					for (Post po : post) {
				%>
				<div class="card mt-3">
					<img alt="" src="img/pen-6238177_1280.png"
						class="card-img-top mt-2 mx-auto" style="max-width: 100px">

					<div class="card-body p-4">
						<h5 class="card-title"><%=po.getTitle()%></h5>
						<p><%=po.getContent()%></p>

						<p>
							<b class="text-success">Published By:<%=po.getUser().getName()%>
							</b></br> <b class="text-primary"></b>
						</p>
						<p>
							<b class="text-success">Published Date:<%=po.getPdate()%>
							</b></br> <b class="text-primary"></b>
						</p>
					</div>
				</div>
				<%
					}
				}
				%>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
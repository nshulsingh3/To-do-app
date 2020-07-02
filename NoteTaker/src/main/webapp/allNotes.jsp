<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<%@include file="myjscss.jsp"%>
<title>Note Taker</title>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 align="center">My Notes</h1>

		<br>
		<div class="row">
			<div class="col-12">

				<%
					Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> ls = q.list();
				for (Note note : ls) {
				%>


				<div class="card mt-3">
					<img src="img/2921222.png" style="max-width: 100px;"
						class="card-img-top mx-auto mt-4">
					<div class="container text-center">
						<div class="card-body">
							<h5 class="card-title"><%=note.getTitle()%></h5>
							<p class="card-text">
								<%=note.getContent()%></p>
						</div>
						<div class="container text-center">
							<a href="DeleteServlet?note_id=<%=note.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary">Update</a>
						</div>
						<br>
					</div>
				</div>



				<%
					}
				%>
			</div>
		</div>
	</div>
	<%
		s.close();
	%>
</body>
</html>
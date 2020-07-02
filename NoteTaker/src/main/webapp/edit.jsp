<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Note"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<%@include file="myjscss.jsp"%>
<title>Edit Note</title>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = s.get(Note.class, noteId);
		%>
		<br>

		<h1 class="text-center">Edit your note.</h1>

		<br>
		<form action="UpdateServlet" method="post">

			<input value="<%=note.getId()%>" name="noteId" type="hidden" />
			<div class="form-group">
				<label for="title">Enter the Title.</label> <input required
					name="title" type="text" class="form-control" id="title"
					aria-describedby="emailHelp" value="<%=note.getTitle()%>">
				<small id="emailHelp" class="form-text text-muted">Keep it
					short.</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label>
				<textarea required id="content" name="content"
					placeholder="Enter your content here." class="form-control"
					style="height: 300px;"><%=note.getContent()%></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save your
					Note</button>
			</div>
			<br>
		</form>

	</div>
</body>
</html>
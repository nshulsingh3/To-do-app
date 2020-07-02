<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="myjscss.jsp"%>
<title>Add Notes</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>

		<h1>Please fill your note details !!</h1>

		<!-- form template -->

		<form action="saveNote" method="post">
			<div class="form-group">
				<label for="title">Enter the Title.</label> <input required
					name="title" type="text" class="form-control" id="title"
					aria-describedby="emailHelp"> <small id="emailHelp"
					class="form-text text-muted">Keep it short.</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label>
				<textarea required id="content" name="content"
					placeholder="Enter your content here." class="form-control"
					style="height: 300px;"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>

		</form>
		<br>
	</div>
</body>
</html>
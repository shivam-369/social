<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link href="./css/register.css" rel = "stylesheet" type="text/css">
</head>
<body>
	<div
		class="container border border-2 border-primary rounded-3 bg-dark bg-gradient text-white" id="box">
		<form action="login" method="post">
			<h2>Login</h2><br/>
			<div class="container">
				
				<div class="mb-3">
					<label for="uname" class="form-label">Username</label>
					<input type="text" class="form-control" id="uname" name="username" autofocus required>
				</div>
				
				
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">Password</label>
					<input type="password" class="form-control"
						id="exampleInputPassword1" name="password" required>
				</div>
				
				
				<button type="submit" class="btn btn-primary">Login</button>
				<a href="./Register.jsp">don't have an account?</a>

			</div>
		</form>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>

</body>
</html>
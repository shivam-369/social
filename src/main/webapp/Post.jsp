<%@page
	import="jdk.internal.org.objectweb.asm.commons.ModuleTargetAttribute"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Posts</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
	<link href="./css/Post.css" rel="stylesheet" type="text/css">
</head>

<body class="d-flex justify-content-center">
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
	<c:if test="${username == null}">
		<c:redirect url="./Login.jsp">
		</c:redirect>
	</c:if>
	<h2>Welcome ${username}</h2>
	<div class="container fixed-top ">
		<nav class="navbar navbar-expand-lg navbar-light bg-secondary">
			<div class="container-fluid">
				<!-- <a class="navbar-brand" href="#">Navbar</a> -->
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<!-- <li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li> -->
						<!-- <li class="nav-item"><a class="nav-link" href="#">Link</a></li> -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Account </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">

								<li>
									<a href="./MyPosts.jsp" class="dropdown-item">My posts</a>
								</li>
								<c:choose>
									<c:when test="${username != 'Admin' }">
										<li><button class="dropdown-item" onclick="deleteAccount()">Delete Account</button></li>
									</c:when>
									
									<c:otherwise>
										<li><button class="dropdown-item" onclick="deleteUser()">Delete User</button></li>
									</c:otherwise>
								</c:choose>
								<form  action="deleteAccount" method="POST" name="accountDelete"  >
										<input type="hidden" value="${username }" name="userToDelete">
								</form>
								<form action="deleteUser" method="POST" name="DeleteUser">
									<input type="hidden" name="userOfDeletion">
								</form>
								<!-- <li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li> -->
							</ul></li>
						<!-- <li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">Disabled</a></li> -->
					</ul>
					<form method="post" action="create_post.jsp">
						<input type="submit" value="Create post"
							class="btn btn-primary mx-1" />
					</form>
					<form method="post" action="logout">
						<input type="submit" value="Logout" class="btn btn-danger mx-1" />
					</form>
				</div>
			</div>
		</nav>
		
	</div>
	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/social" user="root" password="" />
	<sql:query var="rs" dataSource="${db}">Select * from posts order by date desc</sql:query>
	<div class="posts">
		<c:forEach var="post" items="${rs.rows}">
			<div class="d-grid gap-2 ">
				<div class="post p-2">

					<div class="card bg-gradient" style="width: 50rem;">

						<div class="card-body">
							<form action="updateLike" method="POST" name="${post.post_id }" class="like-form">
											<input type="hidden" value="${post.post_id }" name="post_id">
											<input type="hidden" value="${username}"
												name="liker">
											
							</form>
							
							<form action="updateDislikes" method="POST" name="${post.post_id }" class="dislike-form">
											<input type="hidden" value="${post.post_id }" name="post_id">
											<input type="hidden" value="${username }"
												name="disliker">
					
							</form>
							
							<c:choose>
								<c:when test="${username == post.author || username == 'Admin'}">
										<button class="btn delete-btn" onclick="verify()">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-trash"
												viewBox="0 0 16 16">
						  <path
													d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
						  <path fill-rule="evenodd"
													d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
						</svg>
						</button>
									<form action="deletePost" method="POST" name="deletepost">
											<input type="hidden" value="${post.post_id }" name="post_id">
											<input type="hidden" value="${post.author }"
												name="postAuthor">
											<!-- <input type="hidden" value="ok" name="confirm"> -->
									</form>
								</c:when>
								<c:when test="${username != post.author }">
									<button class="btn delete-btn" disabled>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"
											disabled>
						  <path
												d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
						  <path fill-rule="evenodd"
												d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
						</svg>
									</button>
								</c:when>

							</c:choose>
							<p class="card-text">${post.content }</p>


							<button class="btn like-btn">
								<div onclick="changeLike('${post.post_id}')">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-hand-thumbs-up"
										viewBox="0 0 16 16">
						  				<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
									</svg>
									<span class="like">${post.likes }</span>
								</div>
							</button>

							<button class="btn dislike-btn">
								<div onclick="changeDislike('${post.post_id}')">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-hand-thumbs-down"
										viewBox="0 0 16 16">
						  				<path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856 0 .289-.036.586-.113.856-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a9.877 9.877 0 0 1-.443-.05 9.364 9.364 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964l-.261.065zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a8.912 8.912 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.224 2.224 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.866.866 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1z" />
									</svg>
									<span class="dislike">${post.dislikes }</span>
								</div>
							</button>

							<div class="d-inline">
								<span class="align-middle">${post.date }</span> <span
									class="align-middle author">${post.author }</span>

							</div>

						</div>

					</div>

				</div>
		</c:forEach>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<script src="./js/post.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="Allcontent/allcss.jsp"%>
</head>
<body>
	<%@include file="Allcontent/Navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custome">
						<i class="fa fa-user fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>

					<%
					String failMessage = (String) session.getAttribute("fail-message");
					if (failMessage != null) {
					%>
					<div class="alert alert-danger" role="alert">
						<%=failMessage%>
					</div>
					<%
					session.removeAttribute("fail-message");

					}
					%>

					<%
					String withoutLogin = (String) session.getAttribute("Login-error");
					if (withoutLogin != null) {
					%>
					<div class="alert alert-danger" role="alert">
						<%=withoutLogin%>
					</div>
					<%
					session.removeAttribute("Login-error");
					}
					%>
					
					<%
					String logoutmsg =(String)session.getAttribute("logoutmessage");
					if(logoutmsg!=null){%>
						<div class="alert alert-success" role="alert">
						<%=logoutmsg%>
					</div>
					<%
					session.removeAttribute("logoutmessage");
					}
					%>

					<div class="card-body">
						<form action="loginServlet" method="POST">
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" name="uname" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password"
									class="form-control" name="upassword" placeholder="Password">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@include file="Allcontent/footer.jsp"%>
</body>
</html>

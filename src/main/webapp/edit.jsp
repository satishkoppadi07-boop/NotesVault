<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, com.DAO.postDAO, com.Db.DBconnect, com.User.post, com.User.UserDetails"%>
<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login ....");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
<%@include file="Allcontent/allcss.jsp"%>
</head>
<body>
	<%@include file="Allcontent/Navbar.jsp"%>
	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	postDAO post = new postDAO(DBconnect.getConn());
	post p = post.getDataById(noteid);
	%>


	<div class="content-wrapper container mb-5">
		<div class="row justify-content-center mt-5">
			<div class="col-md-8">
				<div class="card shadow-lg rounded">
					<div class="card-header bg-custome text-white text-center">
						<h3>
							<i class="fa fa-plus-circle mr-2"></i> Edit Your Note
						</h3>

					</div>
					<div class="card-body">
						<form action="EditServlet" method="post">
							<input type="hidden" value="<%=noteid%>" name="noteid" />
							<div class="form-group">

								<label for="noteTitle">Note Title</label> <input type="text"
									class="form-control" id="noteTitle" name="title"
									value="<%=p.getTitle()%>" placeholder="Enter title" required>
							</div>
							<div class="form-group">
								<label for="noteContent">Note Description</label>
								<textarea class="form-control" id="noteContent" name="content"
									rows="6" placeholder="Write your note here..." required><%=p.getContent()%></textarea>
							</div>
							<button type="submit" class="btn btn-primary btn-block mt-3">
								<i class="fa fa-paper-plane"></i> Submit Note
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="Allcontent/footer.jsp"%>
</body>
</html>
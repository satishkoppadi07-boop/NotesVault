<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.User.UserDetails"%>


<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error","Please Login ....");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="Allcontent/allcss.jsp"%>

<style>
html, body {
	height: 100%;
	margin: 0;
	display: flex;
	flex-direction: column;
}

.content-wrapper {
	flex: 1;
}
</style>
</head>
<body>
	<%@include file="Allcontent/Navbar.jsp"%>

	<div class="content-wrapper container mb-5">
		<div class="row justify-content-center mt-5">
			<div class="col-md-8">
				<div class="card shadow-lg rounded">
					<div class="card-header bg-custome text-white text-center">
						<h3>
							<i class="fa fa-plus-circle mr-2"></i> Add Your Notes
						</h3>
					</div>
					<div class="card-body">
						<form action="AddNoteServlet" method="post" enctype="multipart/form-data">
							<div class="form-group">

								<%
								UserDetails us = (UserDetails) session.getAttribute("userD");
								if (us != null) {
								%>
								<input type="hidden" name="uid"
									value="<%=us.getId()%>">
								<%
								}
								%>
								

                                <label class= "font-weight-bold">Subject</label>

                                <input type="text"
                                name="category"
                                class="form-control"
                                placeholder="Enter subject or category"
                                required>


								<h5 class="mt-3 mb-3">Notes Details</h5>

<div class="form-group">
    <label class= "font-weight-bold">College Name</label>
    <input type="text"
           class="form-control"
           name="college"
           placeholder="Enter College Name"
           required>
</div>

<div class="form-group">
    <label class= "font-weight-bold">Branch</label>
    <input type="text"
           class="form-control"
           name="branch"
           placeholder="Enter Branch"
           required>
</div>

<div class="form-group">
    <label class= "font-weight-bold">Semester</label>
    <input type="text"
           class="form-control"
           name="semester"
           placeholder="Enter Semester"
           required>
</div>
							</div>
							<div class="form-group">
								<label class= "font-weight-bold" for="noteContent">Notes Description</label>
								<textarea class="form-control" id="noteContent" name="content"
									rows="6" placeholder="Write your note here..." required></textarea>
							</div>
							<div class="form-group">
    <label class= "font-weight-bold">Upload PDF</label>
    <input type="file"
           name="pdfFile"
           class="form-control"
           accept=".pdf">
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

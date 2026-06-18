<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, com.DAO.postDAO, com.Db.DBconnect, com.User.post, com.User.UserDetails"%>
<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
    session.setAttribute("Login-error", "Please Login ....");
    response.sendRedirect("login.jsp");
    return;
}

postDAO dao = new postDAO(DBconnect.getConn());

String category = request.getParameter("category");


List<post> list;

if(category != null && category.trim().length() > 0) {

    list = dao.searchByCategory(category);

} else {

    list = dao.getData();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="Allcontent/allcss.jsp"%>
</head>
<body>
	<%@include file="Allcontent/Navbar.jsp"%>
	<%
	String msg = (String) session.getAttribute("updatemsg");
	if (msg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=msg%></div>
	<%
	session.removeAttribute("updatemsg");	
	}
	%>

	<%
	String deletemsg = (String) session.getAttribute("deletemsg");
	if (deletemsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=deletemsg%></div>
	<%
	session.removeAttribute("deletemsg");
	}
	%>
	<%
	String wrongmsg = (String) session.getAttribute("wrongmsg");
	if (wrongmsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=wrongmsg%></div>
	<%
	session.removeAttribute("wrongmsg");
	}
	%>

	<div class="container">
		<h2 class="text-center">All Notes:</h2>
		 <form action="ShowNotes.jsp" method="get" class="mb-4">

        <div style="display:flex; gap:10px;">

            <input type="text"
                   name="category"
                   class="form-control"
                   placeholder="Search by category">

            <button type="submit"
                    class="btn btn-primary">
                Search
            </button>

        </div>

    </form>
		<div class="row">
			<%
			if (list != null && !list.isEmpty()) {
				for (post p : list) {
			%>
			<div class="col-md-12">
				<div class="card mt-3">
					<img alt="" src="img/paper.png" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px;">
					<div class="card-body p-4">
						<h5 class="card-title"><%= p.getCategory() %></h5>

<p><b>College:</b> <%= p.getCollege() %></p>
<p><b>Branch:</b> <%= p.getBranch() %></p>
<p><b>Semester:</b> <%= p.getSemester() %></p>
<P><%= p.getContent() %></P>

<%
if(p.getPdfFile() != null && !p.getPdfFile().trim().isEmpty()
   && !"null".equalsIgnoreCase(p.getPdfFile())) {
%>

<a href="pdfs/<%= p.getPdfFile() %>"
   target="_blank"
   class="btn btn-success btn-sm">
   View PDF
</a>
<a href="pdfs/<%= p.getPdfFile() %>"
   download
   class="btn btn-primary btn-sm">
   Download PDF
</a>

<%
}
%>
						<p>
							<b class="text-success">Published On: <%=p.getPdate()%></b>
						</p>
						<%
if(p.getUser() != null && p.getUser().getId() == user3.getId()){
%>

<div class="container text-center mt-2">
    <a href="DeleteServlet?note_id=<%=p.getId()%>"
        class="btn btn-danger">Delete</a>

    <a href="edit.jsp?note_id=<%=p.getId()%>"
        class="btn btn-primary">Edit</a>
</div>

<%
}
%>
					</div>
				</div>
			</div>
			<%
			    }
			} else {
			%>
			<div class="col-md-12">
				<h5 class="text-center text-danger">No notes found!</h5>
			</div>
			<%
			}
			%>
		</div>
	</div>

	<%@include file="Allcontent/footer.jsp"%>
</body>
</html>

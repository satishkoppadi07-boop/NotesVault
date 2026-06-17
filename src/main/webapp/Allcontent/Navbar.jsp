<%@ page import="com.User.UserDetails" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-custome navbar-custome">
	<a class="navbar-brand" href="#">
		<i class="fa fa-book" aria-hidden="true"></i> NotesVault
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<a class="nav-link" href="index.jsp">
					<i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="addNote.jsp">
					<i class="fa fa-plus" aria-hidden="true"></i> Add Notes
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="ShowNotes.jsp">
					<i class="fa fa-address-book-o" aria-hidden="true"></i> Show Notes
				</a>
			</li>
		</ul>

		<form class="form-inline my-2 my-lg-0">
			<%
			    UserDetails user = (UserDetails) session.getAttribute("userD");
				if (user != null) {
			%>
			<span class="text-white mr-3">Welcome, <%= user.getName() %></span>
			<!-- Updated Profile Button to trigger modal -->
			
			<a href="LogoutServlet" class="btn btn-light my-2 my-sm-0">
				<i class="fa fa-sign-out" aria-hidden="true"></i> Logout
			</a>
			<button type="button" class="btn btn-dark ml-2" onclick="toggleDarkMode()">
             Dark Mode
            </button>
			<%
				} else {
			%>
			<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2">
				<i class="fa fa-sign-in" aria-hidden="true"></i> Login
			</a>
			<a href="register.jsp" class="btn btn-light my-2 my-sm-0">
				<i class="fa fa-user-plus" aria-hidden="true"></i> Register
			</a>
			<%
				}
			%>
		</form>
	</div>
</nav>
<script>
function toggleDarkMode() {
    document.body.classList.toggle("dark-mode");

    if(document.body.classList.contains("dark-mode")){
        localStorage.setItem("theme", "dark");
    } else {
        localStorage.setItem("theme", "light");
    }
}

window.onload = function() {
    if(localStorage.getItem("theme") === "dark"){
        document.body.classList.add("dark-mode");
    }
}
</script>



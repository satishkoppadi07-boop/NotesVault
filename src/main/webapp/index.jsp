<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, com.Db.DBconnect" %>
<!DOCTYPE html>
<html>
<head>
<style>
.back-img {
  background: url("image/img2.png") no-repeat center center;
  background-size: cover;
  width: 100%;
  height: 80vh;
}
</style>
<meta charset="ISO-8859-1">
<title>Smart Notes Management</title>
<%@include file="Allcontent/allcss.jsp" %>
</head>
<body>
<%@include file="Allcontent/Navbar.jsp" %>


<div class="container-fluid back-img">
  <div class="text-center">
    <h1 class="text-white">NotesVault</h1>
    <a href="login.jsp" class="btn btn-light">Login</a>
    <a href="adminLogin.jsp" class="btn btn-danger">Admin Login</a>s
    <a href="register.jsp" class="btn btn-light">Register</a>
  </div>
</div>

<%@include file="Allcontent/footer.jsp" %>
</body>
</html>

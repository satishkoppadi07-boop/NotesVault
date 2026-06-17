<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DAO.userDAO"%>
<%@page import="com.DAO.postDAO"%>
<%@page import="com.Db.DBconnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="Allcontent/allcss.jsp"%>
</head>
<body>
<%
userDAO udao = new userDAO(DBconnect.getConn());
postDAO pdao = new postDAO(DBconnect.getConn());

int totalUsers = udao.getUserCount();
int totalNotes = pdao.getNotesCount();
%>

<div class="container mt-5">
    <div class="card">
        <div class="card-body text-center">

            <h2>Welcome Admin</h2>

            <%
            String admin = (String)session.getAttribute("admin");

            if(admin == null){
                response.sendRedirect("adminLogin.jsp");
            }
            %>

            <h4>Admin Dashboard</h4>
            <div class="row mt-4">

    <div class="col-md-6">
        <div class="card text-center bg-primary text-white">
            <div class="card-body">
                <h3><%= totalUsers %></h3>
                <h5>Total Users</h5>
                <a href="viewUsers.jsp" class="btn btn-light mt-2">
    View Users
</a>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card text-center bg-success text-white">
            <div class="card-body">
                <h3><%= totalNotes %></h3>
                <h5>Total Notes</h5>
                <a href="viewNotes.jsp" class="btn btn-light mt-2">
    View Notes
</a>
            </div>
        </div>
    </div>

</div>
            <a href="LogoutServlet" class="btn btn-danger mt-3">Logout</a>

        </div>
    </div>
</div>

</body>
</html>
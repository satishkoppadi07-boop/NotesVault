<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.DAO.postDAO" %>
<%@ page import="com.Db.DBconnect" %>
<%@ page import="com.User.post" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notes</title>

<%@include file="Allcontent/allcss.jsp"%>

</head>
<body>

<div class="container mt-5">

    <div class="card">

        <div class="card-body">

            <h2 class="text-center">All Notes</h2>

            <table class="table table-bordered mt-4">

                <thead class="table-dark">

                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Content</th>
                        <th>PDF</th>
                    </tr>

                </thead>

                <tbody>

                <%
                    postDAO pdao = new postDAO(DBconnect.getConn());

                    List<post> list = pdao.getAllNotes();

                    for(post p : list){
                %>

                    <tr>

                        <td><%= p.getId() %></td>

                        <td><%= p.getTitle() %></td>

                        <td><%= p.getCategory() %></td>

                        <td><%= p.getContent() %></td>
                        <td>
   						 <a href="pdfs/<%= p.getPdfFile() %>" 
       				     class="btn btn-success btn-sm">
       					 Download PDF
    					 </a>
						 </td>
                        

                    </tr>

                <%
                    }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>

</body>
</html>
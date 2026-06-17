<%@page import="java.util.*"%>
<%@page import="com.User.UserDetails"%>
<%@page import="com.DAO.userDAO"%>
<%@page import="com.Db.DBconnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Users</title>

<%@include file="Allcontent/allcss.jsp"%>

</head>
<body>

<div class="container mt-5">

    <div class="card">

        <div class="card-body">

            <h2 class="text-center">All Users</h2>

            <table class="table table-bordered mt-4">

                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                </tr>

                <%
                    userDAO dao = new userDAO(DBconnect.getConn());

                    List<UserDetails> list = dao.getAllUsers();

                    for(UserDetails u : list){
                %>

                <tr>
                    <td><%=u.getId()%></td>
                    <td><%=u.getName()%></td>
                    <td><%=u.getEmail()%></td>
                </tr>

                <%
                    }
                %>

            </table>

        </div>

    </div>

</div>

</body>
</html>
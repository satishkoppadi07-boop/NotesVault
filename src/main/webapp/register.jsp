<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="Allcontent/allcss.jsp"%>
</head>
<body>
<%@include file="Allcontent/Navbar.jsp"%>

<div class="container-fluid div-color">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card mt-5">
                <div class="card-header text-center text-white bg-custome">
                    <i class="fa fa-registered fa-3x" aria-hidden="true"></i>
                    <h4>Registration</h4>
                </div>

               
                <%
                    String regMessage = (String) session.getAttribute("reg-success");
                    if (regMessage != null) {
                %>
                    <div class="alert alert-success" role="alert">
                        <%= regMessage %> <a href="login.jsp">Login Here</a>
                    </div>
                <%
                        session.removeAttribute("reg-success");
                    }
                %>

            
                <%
                    String failMessage = (String) session.getAttribute("fail-message");
                    if (failMessage != null) {
                %>
                    <div class="alert alert-danger" role="alert">
                        <%= failMessage %>
                    </div>
                <%
                        session.removeAttribute("fail-message");
                    }
                %>

                <div class="card-body">
                    <form action="Userservlet" method="post">
                        <div class="form-group">
                            <label>Enter your full Name</label>
                            <input type="text" class="form-control" name="fname" placeholder="Enter Name">
                        </div>
                        <div class="form-group">
                            <label>Enter Email</label>
                            <input type="email" class="form-control" name="uemail" placeholder="Enter Email">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="upassword" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>

<%@include file="Allcontent/footer.jsp"%>
</body>
</html>

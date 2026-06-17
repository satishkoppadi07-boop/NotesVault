<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<%@include file="Allcontent/allcss.jsp"%>

</head>
<body>

<div class="container mt-5">

    <div class="row">
        <div class="col-md-4 offset-md-4">

            <div class="card">
                <div class="card-body">

                    <h3 class="text-center">Admin Login</h3>

                    <form action="adminLogin" method="post">

                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" name="username"
                                class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password"
                                class="form-control">
                        </div>

                        <button class="btn btn-primary btn-block">
                            Login
                        </button>

                    </form>

                </div>
            </div>

        </div>
    </div>

</div>

</body>
</html>
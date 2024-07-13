<%@ page import="uz.developers.model.User" %><%
    User auth = (User) request.getSession().getAttribute("auth");
    request.getSession().removeAttribute("auth");
    if (auth != null) {
        response.sendRedirect("home.jsp");
    }
%>



<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div class="container">


    <div class="row">
        <div class="col-md-3">
        </div>

        <div class="col-md-9">
            <h2>Login</h2>
            </hr>
            <form action="login" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail">Email address</label>
                    <input type="email" class="form-control" name="email" id="exampleInputEmail" placeholder="Enter email" required>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword">Password</label>
                    <input type="password" class="form-control" name="password" id="exampleInputPassword" placeholder="***********"
                           required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>

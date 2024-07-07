<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<h2>Hello World!</h2>

<div class="container">


    <%@include file="WEB-INF/jspf/header.jsp"%>

    <div class="row">
        <div class="col-md-3">
            <%@include file="WEB-INF/jspf/slidebar.jsp"%>
        </div>

        <div class="col-md-9">
            <h2>Login</h2>
            </hr>
            <form action="login.jsp" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1"  placeholder="Enter email">
                </div>

                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>

                <button type="submit" class="btn btn-primary">Login</button>
            </form>


            </div>


        </div>
    </div>




</body>
</html>

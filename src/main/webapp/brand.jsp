<%@ page import="uz.developers.model.User" %>
<%
    //    User auth = (User) request.getSession().getAttribute("auth");
//    if (auth != null) {
//        request.setAttribute("auth", auth);
//    } else {
//        response.sendRedirect("login.jsp");
//    }

%>


<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<form action="brandList.jsp">
    <input type="submit" value="Previous">
</form>

<div class="container">

    <form action="/brand" method="post">

<%--        <div class="row">--%>
<%--            <div class="col-md-3">--%>
<%--            </div>--%>

            <div class="col-md-9">
                <h2>New Brand</h2>
                </hr>

                    <div class="form-group">
                        <label for="exampleInputBrandName">Brand Name</label>
                        <input type="text" class="form-control" name="brandName" id="exampleInputBrandName" placeholder="Enter Brand Name">
                    </div>

                <div class="form-group">
                    <label for="exampleInputPhoto">Brand Photo</label>
                    <input type="text" class="form-control" name="brandName" id="exampleInputPhoto" placeholder="Enter Brand Photo">
                </div>


                    <button type="submit" class="btn btn-primary">Save</button>


            </div>


        </div>
    </form>
</div>


</body>
</html>

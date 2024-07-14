<%@ page import="java.sql.Connection" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.model.Brand" %>
<%@ page import="java.util.List" %>
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

<form action="modelList.jsp">
    <input  type="submit" value="Previous">
</form>


<div class="container">


    <div class="row">
        <div class="col-md-3">
        </div>

        <div class="col-md-9">
            <h2>New Model</h2>
            </hr>
            <form action="/modelAdd" method="post">

                <div class="form-group">
                    <label for="exampleInputName">Brand</label>
                    <select name="brand_id" class="form-control">

                        <%
                            BrandService brandService = new BrandService(DbConnection.getConnection());
                            List<Brand> allBrands = brandService.getAllBrands();
                            for (Brand allBrand : allBrands) {
                        %>
                        <option value="<%=allBrand.getId()%>"><%=allBrand.getName()%></option>
                        <%}%>
                    </select>
                </div>

                <div class="form-group">
                    <label for="exampleInputName">Model Name</label>
                    <input type="text" class="form-control" name="name" id="exampleInputName"  placeholder="Enter Model Name">
                </div>

                <button type="submit" class="btn btn-primary">Save</button>
            </form>

<%--            <img src="E:/persistent/asd.jpg" alt="">--%>


            </div>


        </div>
    </div>






</body>
</html>

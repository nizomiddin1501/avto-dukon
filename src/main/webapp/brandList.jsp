<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="uz.developers.model.Brand" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
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

<%@include file="WEB-INF/jspf/navbar.jsp" %>

<form action="home.jsp">
    <input  type="submit" value="Previous">
</form>


<div class="container">
    <form action="/brand" method="get">

    <div class="row">
        <div class="col-md-3">
        </div>

        <div class="col-md-9">
            <h2>Brand List</h2>
            </hr>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Photo</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    BrandService brandService = new BrandService(DbConnection.getConnection());
                    List<Brand> allBrands = brandService.getAllBrands();
                    for (Brand allBrand : allBrands) {
                %>
                <tr>
                    <th><%=allBrand.getId()%></th>
                    <th><%=allBrand.getName()%></th>
                    <th><img src="<%= allBrand.getPhoto() %>" alt="Client Photo" width="50" height="50"></th>
                    <td>
                        <a href="brandShow.jsp?id=<%=allBrand.getId()%>" class="btn btn-primary">Show</a>
                        <a href="/brandEdit?id=<%=allBrand.getId()%>" class="btn btn-light">Edit</a>
                        <a href="brandDelete.jsp?id=<%=allBrand.getId()%>" class="btn btn-dark"
                           onclick="return confirm('Are you sure you want to delete this brand?');">Delete</a>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>


        </div>


    </div>
    <a href="brand.jsp?id=" class="btn btn-success">Add Brand</a>
    </form>
</div>



</body>
</html>

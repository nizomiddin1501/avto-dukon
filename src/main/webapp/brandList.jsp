<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="uz.developers.model.Brand" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<h2>Hello World!</h2>

<div class="container">


    <%@include file="WEB-INF/jspf/header.jsp" %>

    <div class="row">
        <div class="col-md-3">
            <%@include file="WEB-INF/jspf/slidebar.jsp" %>
        </div>

        <div class="col-md-9">
            <h2>Brand List</h2>
            </hr>


            <%--                                <%--%>
            <%--                                    BrandService brandService = new BrandService(DbConnection.getConnection());--%>
            <%--                                    List<Brand> allBrands = brandService.getAllBrands();--%>
            <%--                                    for (int i = 0; i < allBrands.size(); i++) {--%>
            <%--                                        out.print(--%>
            <%--                                                "<tr>" +--%>
            <%--                                                        "<td>" + allBrands.get(i).getId() + "</td>" +--%>
            <%--                                                        "<td id='name_" + allBrands.get(i).getId() + "'>" + (allBrands.get(i).getName()) + "</td>" +--%>
            <%--                                                        "<tr>"--%>
            <%--                                        );--%>
            <%--                                    }--%>
            <%--                                %>--%>

            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    Connection connection = DbConnection.getConnection();
                    String query = "select * from brand";
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    while (resultSet.next()) {
                %>

                <tr>
                    <th><%=resultSet.getInt("id")%></th>
                    <th><%=resultSet.getString("name")%></th>

                    <td>
                        <a href="show.jsp?id=<%=resultSet.getInt("id")%>" class="btn btn-success">Show</a>
                        <a href="edit.jsp?id=<%=resultSet.getInt("id")%>" class="btn btn-warning">Edit</a>
                        <a href="delete.jsp?id=<%=resultSet.getInt("id")%>" class="btn btn-danger">Delete</a>
                    </td>
                </tr>

                <%}%>


                </tbody>
            </table>


        </div>


    </div>
</div>


</body>
</html>

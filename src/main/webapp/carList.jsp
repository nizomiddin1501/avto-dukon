<%@ page import="java.sql.Connection" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="uz.developers.service.BrandService" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/9/2024
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = DbConnection.getConnection();
    PreparedStatement preparedStatement;
    ResultSet resultSet;
    String query;

%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Car List</title>
</head>
<body>


<div class="container">


    <%@include file="WEB-INF/jspf/header.jsp" %>

    <div class="row">
        <div class="col-md-3">
            <%@include file="WEB-INF/jspf/slidebar.jsp" %>
        </div>

        <div class="col-md-9">
            <h2>Car List</h2>
            </hr>

            <table class="table">

                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Title</th>
                    <th scope="col">Brand Name</th>
                    <th scope="col">Year</th>
                    <th scope="col">Price</th>
                    <th scope="col">Model</th>
                </tr>
                </thead>
                <tbody>
                <%

                    query = "select * from car inner join model on model.id = car.model_id inner join brand on brand.id = model.brand_id";
                    preparedStatement = connection.prepareStatement(query);
                    try {
                        resultSet = preparedStatement.executeQuery();
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    while (resultSet.next()){
                %>

                <tr>
                    <th><%=resultSet.getInt(1)%></th>
                    <th><%=resultSet.getString("title")%></th>
                    <th><%=resultSet.getString(3)%></th>
                    <th><%=resultSet.getString(4)%></th>
                    <th><%=resultSet.getString(5)%></th>
                    <th><%=resultSet.getString("name")%></th>

                    <td>
                        <a href="modelShow.jsp?id=<%=resultSet.getInt(1)%>" class="btn btn-success">Show</a>
                        <a href="modelEdit.jsp?id=<%=resultSet.getInt(1)%>" class="btn btn-warning">Edit</a>
                        <a href="modelDelete.jsp?id=<%=resultSet.getInt(1)%>" class="btn btn-danger">Delete</a>
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

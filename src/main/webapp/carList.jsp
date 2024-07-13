<%@ page import="java.sql.Connection" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.service.CarService" %>
<%@ page import="uz.developers.model.Car" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/9/2024
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <th scope="col">Model Name</th>
                </tr>
                </thead>
                <tbody>
                <%
                    CarService carService = new CarService(DbConnection.getConnection());
                    List<Car> allCarList = carService.getAllCarList();
                    for (Car car : allCarList) {
                %>
                <tr>
                    <th><%=car.getId()%></th>
                    <th><%=car.getTitle()%></th>
                    <th><%=car.getBrandName()%></th>
                    <th><%=car.getYear()%></th>
                    <th><%=car.getPrice()%></th>
                    <th><%=car.getModelName()%></th>
                    <td>
                        <a href="car.jsp?id=<%=car.getId()%>" class="btn btn-success">Add</a>
                        <a href="carEdit.jsp?id=<%=car.getId()%>" class="btn btn-light">Edit</a>
                        <a href="buy.jsp?id=<%=car.getId()%>" class="btn btn-primary">Buy</a>
                        <a href="carDelete.jsp?id=<%=car.getId()%>" class="btn btn-danger">Delete</a>
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

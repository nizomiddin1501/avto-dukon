<%@ page import="java.sql.Connection" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.service.CarService" %>
<%@ page import="uz.developers.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.developers.model.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/9/2024
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    User auth = (User) request.getSession().getAttribute("auth");
//    if (auth != null) {
//        request.setAttribute("auth", auth);
//    } else {
//        response.sendRedirect("login.jsp");
//    }


//    int id = Integer.parseInt(request.getParameter("id"));
//    CarService carService = new CarService(DbConnection.getConnection());
//    Car car = carService.getCarById(id);
//
//    if (request.getMethod().equalsIgnoreCase("POST")) {
//        int price = Integer.parseInt(request.getParameter("price"));
//        car.setPrice(price);
//        carService.updateCar(car);
//        response.sendRedirect("carList.jsp");
//    }


    Car car = (Car) request.getAttribute("car");
    if (car == null) {
        out.println("No model found for editing.");
        return;
    }


%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Car List</title>
</head>
<body>

<form action="carList.jsp">
    <input  type="submit" value="Previous">
</form>



<div class="container">
    <h2>Edit Car</h2>
    <form action="/carEdit" method="post">
        <input type="hidden" name="id" value="<%= car.getId() %>">
        <div class="form-group">
            <label for="name">Car Price</label>
            <input type="text" class="form-control" id="name" name="price" value="<%=car.getPrice()%>" required>
        </div>


        <button type="submit" class="btn btn-primary">Save</button>
        <a href="carList.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>













</body>
</html>

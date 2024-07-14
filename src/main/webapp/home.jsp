<%@ page import="uz.developers.model.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/10/2024
  Time: 3:48 PM
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

%>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">




<%--    <style>--%>
<%--        body {--%>
<%--            background-image: url('images/cars/Tahoe.png'); /* Ensure the image path is correct */--%>
<%--            background-size: cover;--%>
<%--            background-repeat: no-repeat;--%>
<%--            background-attachment: fixed;--%>
<%--            background-position: center;--%>
<%--            height: 100vh;--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--        }--%>
<%--    </style>--%>



    <title>Avto Dukon</title>

</head>
<body>

<%@include file="WEB-INF/jspf/navbar.jsp" %>
<div class="container">
    <div class="card-header my-3">Main page</div>

    <%@include file="WEB-INF/jspf/slidebar.jsp"%>
</div>

<%--<img src="images/cars/Tahoe.png" alt="OK">--%>




</body>
</html>

<%@ page import="uz.developers.model.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/10/2024
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

//    HttpSession sessions = request.getSession(false);
//    String authUser = null;
//    if (sessions != null) {
//        authUser = (String) sessions.getAttribute("auth");
//    }
//    if (authUser == null) {
//        response.sendRedirect("login.jsp");
//    }

%>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">




    <title>Avto Dukon</title>
    <style>
        body {
            background-image: url('images/avto-dukon/1567272-full.jpg'); /* Rasmingiz manzilini yozing */
            background-size: cover; /* Rasmni ekranga to'liq moslashtirish */
            background-position: center; /* Rasmni markazga joylashtirish */
            background-repeat: no-repeat; /* Rasmni takrorlamaslik */
            margin: 0;
            font-family: Arial, sans-serif;
        }
        h1 {
            color: white;
            text-align: center;
            padding-top: 20%;
        }
    </style>

</head>
<body>

<%@include file="WEB-INF/jspf/navbar.jsp" %>
<div class="container">
    <div class="card-header my-3">Main page</div>

    <%@include file="WEB-INF/jspf/slidebar.jsp"%>
</div>


<%--<img src="images/avto-dukon/mere.jpg" alt="ook" height="500" width="800">--%>






</body>
</html>

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
<%--<style>--%>
<%--    body {--%>
<%--        background-image: url('images/avto-dukon/1567272-full.jpg'); /* Rasmingiz manzilini yozing */--%>
<%--        background-size: cover; /* Rasmni ekranga to'liq moslashtirish */--%>
<%--        background-position: center; /* Rasmni markazga joylashtirish */--%>
<%--        background-repeat: no-repeat; /* Rasmni takrorlamaslik */--%>
<%--        margin: 0;--%>
<%--        font-family: Arial, sans-serif;--%>
<%--    }--%>
<%--    h1 {--%>
<%--        color: white;--%>
<%--        text-align: center;--%>
<%--        padding-top: 20%;--%>
<%--    }--%>
<%--</style>--%>
<body>

<div style="text-align: center" class="container">


    <%@include file="WEB-INF/jspf/header.jsp"%>

    <div class="row">



        <%@include file="WEB-INF/jspf/slidebar.jsp"%>

    </div>

</div>


</body>
</html>

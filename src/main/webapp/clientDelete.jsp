
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="uz.developers.service.UserService" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    UserService userService = new UserService(DbConnection.getConnection());
    userService.deleteClient(id);
    response.sendRedirect("clientList.jsp");
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>



</body>
</html>

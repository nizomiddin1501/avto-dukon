<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.developers.service.ModelService" %>
<%@ page import="uz.developers.model.Model" %>
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
    <form action="/model" method="get">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-9">
            <h2>Car Model List</h2>
            </hr>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Model Name</th>
                    <th scope="col">Model Photo</th>
                    <th scope="col">Brand Name</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ModelService modelService = new ModelService(DbConnection.getConnection());
                    List<Model> allModelList = modelService.getAllModelList();
                    for (Model model : allModelList) {
                %>
                <tr>
                    <th><%=model.getId()%></th>
                    <th><%=model.getName()%></th>
                    <th><img src="<%= model.getPhoto() %>" alt="Client Photo" width="50" height="50"></th>
                    <th><%=model.getBrandName()%></th>
                    <td>
                        <a href="modelShow.jsp?id=<%=model.getId()%>" class="btn btn-primary">Show</a>
                        <a href="/modelEdit?id=<%=model.getId()%>" class="btn btn-light">Edit</a>
                        <a href="modelDelete.jsp?id=<%=model.getId()%>" class="btn btn-dark"
                           onclick="return confirm('Are you sure you want to delete this model?');">Delete</a>

                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>
        <a href="model.jsp?id=" class="btn btn-success">Add Model</a>
    </form>
</div>



</body>
</html>

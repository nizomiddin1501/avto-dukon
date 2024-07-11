<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="uz.developers.model.Brand" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="uz.developers.service.ModelService" %>
<%@ page import="uz.developers.model.Model" %>
<%@ page import="java.util.ArrayList" %>
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
            <h2>Car Model List</h2>
            </hr>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Model Name</th>
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
                    <th><%=model.getBrandName()%></th>
                    <td>
                        <a href="model.jsp?id=<%=model.getId()%>" class="btn btn-success">Add</a>
                        <a href="modelEdit.jsp?id=<%=model.getId()%>" class="btn btn-warning">Edit</a>
                        <a href="modelDelete.jsp?id=<%=model.getId()%>" class="btn btn-danger"
                           onclick="return confirm('Are you sure you want to delete this model?');">Delete</a>
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

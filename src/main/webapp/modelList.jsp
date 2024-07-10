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
                    <th scope="col">Id</th>
                    <th scope="col">Model Name</th>
                    <th scope="col">Brand Id</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>





//
                <%
                    Connection connection = DbConnection.getConnection();
                    String query = "select * from model inner join brand on brand.id = model.brand_id";
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    while (resultSet.next()) {
                %>
                <tr>
                    <th><%=resultSet.getInt("model.id")%></th>
                    <th><%=resultSet.getString("model.name")%></th>
                    <th><%=resultSet.getString("brand.name")%></th>
<td>
    <a href="modelShow.jsp?id=<%=resultSet.getInt("model.id")%>" class="btn btn-success">Show</a>
    <a href="modelEdit.jsp?id=<%=resultSet.getInt("model.id")%>" class="btn btn-warning">Edit</a>
    <a href="modelDelete.jsp?id=<%=resultSet.getInt("model.id")%>" class="btn btn-danger">Delete</a>
</td>
</tr>

<%}%>

//




                <%
                    ModelService modelService = new ModelService(DbConnection.getConnection());
                    List<Brand> brandList = new ArrayList<>();
                    List<Model> allModelList = modelService.getAllModelList();
                    for (Model model : allModelList) {
                %>
                <tr>
                    <th><%=model.getId()%></th>
                    <th><%=model.getName()%></th>
                    <th><%=model.getBrand_id()%></th>
                    <td>
                        <a href="modelShow.jsp?id=<%=model.getId()%>" class="btn btn-success">Show</a>
                        <a href="modelEdit.jsp?id=<%=model.getId()%>" class="btn btn-warning">Edit</a>
                        <a href="modelDelete.jsp?id=<%=model.getId()%>" class="btn btn-danger">Delete</a>
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

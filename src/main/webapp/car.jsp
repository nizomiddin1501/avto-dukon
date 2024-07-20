<%@ page import="java.sql.Connection" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="uz.developers.service.ModelService" %>
<%@ page import="uz.developers.model.Model" %>
<%@ page import="java.util.List" %>

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

<form action="carList.jsp">
    <input type="submit" value="Previous">
</form>


<div class="container">


    <div class="row">
        <div class="col-md-9">
            <h2>New Car</h2>
            </hr>
            <form action="/car" method="post">

                <div class="form-group">
                    <label>Title</label>
                    <input type="text" class="form-control" name="title" placeholder="Enter Title">
                </div>

                <div class="form-group">
                    <label>Description</label>
                    <input type="text" class="form-control" name="description" placeholder="Enter Description">
                </div>

                <div class="form-group">
                    <label>Year</label>
                    <input type="text" class="form-control" name="year" placeholder="Enter Year">
                </div>

                <div class="form-group">
                    <label>Price</label>
                    <input type="text" class="form-control" name="price" placeholder="Enter Price">
                </div>


                <div class="form-group">
                    <label>Model</label>
                    <select name="model_id" class="form-control">
                        <%
                            ModelService modelService = new ModelService(DbConnection.getConnection());
                            List<Model> models = modelService.getModels();
                            for (Model model : models) {
                        %>
                        <option value="<%=model.getId()%>"><%=model.getName()%>
                        </option>
                        <%}%>
                    </select>
                </div>
                <div class="form-group">
                    <label>Photo</label>
                    <input type="file" class="form-control" name="photo" placeholder="Photo">
                </div>


                <button type="submit" class="btn btn-primary">Save</button>
            </form>


        </div>


    </div>
</div>


</body>
</html>

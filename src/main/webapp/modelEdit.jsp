<%@ page import="java.sql.Connection" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.model.Brand" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.developers.service.ModelService" %>
<%@ page import="uz.developers.model.Model" %>
<%@ page import="uz.developers.model.User" %>
<%--<%--%>

<%--//    User auth = (User) request.getSession().getAttribute("auth");--%>
<%--//    if (auth != null) {--%>
<%--//        request.setAttribute("auth", auth);--%>
<%--//    } else {--%>
<%--//        response.sendRedirect("login.jsp");--%>
<%--//    }--%>



<%--%>--%>

<%--<%--%>
<%--    int id = Integer.parseInt(request.getParameter("id"));--%>
<%--    ModelService modelService = new ModelService(DbConnection.getConnection());--%>
<%--    Model model = modelService.getModelById(id);--%>

<%--    if (request.getMethod().equalsIgnoreCase("POST")) {--%>
<%--        String name = request.getParameter("name");--%>
<%--        model.setName(name);--%>
<%--        modelService.updateModel(model);--%>
<%--        response.sendRedirect("modelList.jsp");--%>
<%--    }--%>
<%--%>--%>


<%
    Model model = (Model) request.getAttribute("model");
    if (model == null) {
        out.println("No model found for editing.");
        return;
    }
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>


<%@include file="WEB-INF/jspf/navbar.jsp" %>

<form action="modelList.jsp">
    <input  type="submit" value="Previous">
</form>



<div class="container">
    <h2>Edit Model</h2>
    <form action="/modelEdit" method="post">
        <input type="hidden" name="id" value="<%= model.getId() %>">

        <div class="form-group">
            <label for="name">Model Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%=model.getName()%>" required>
        </div>

        <div class="form-group">
            <label for="name">Model Photo</label>
            <input type="file" class="form-control" id="photo" name="photo" value="<%=model.getPhoto()%>" required>
        </div>


        <button type="submit" class="btn btn-primary">Save</button>
        <a href="modelList.jsp" class="btn btn-secondary">Cancel</a>
        </form>
</div>


</body>
</html>

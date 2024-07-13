<%@ page import="java.sql.Connection" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.model.Brand" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.developers.service.ModelService" %>
<%@ page import="uz.developers.model.Model" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ModelService modelService = new ModelService(DbConnection.getConnection());
    Model model = modelService.getModelById(id);

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String name = request.getParameter("name");
        model.setName(name);
        modelService.updateModel(model);
        response.sendRedirect("modelList.jsp");
    }
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div class="container">
    <h2>Edit Model</h2>
    <form method="post">
        <div class="form-group">
            <label for="name">Model Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%=model.getName()%>" required>
        </div>


        <button type="submit" class="btn btn-primary">Save</button>
        <a href="modelList.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>





<%--<div class="container">--%>


<%--    <%@include file="WEB-INF/jspf/header.jsp"%>--%>

<%--    <div class="row">--%>
<%--        <div class="col-md-3">--%>
<%--            <%@include file="WEB-INF/jspf/slidebar.jsp"%>--%>
<%--        </div>--%>

<%--        <div class="col-md-9">--%>
<%--            <h2>Registration</h2>--%>
<%--            </hr>--%>
<%--            <form action="/modelAdd" method="post">--%>

<%--                <div class="form-group">--%>
<%--                    <label for="exampleInputName">Brand</label>--%>
<%--                    <select name="brand_id" class="form-control">--%>


<%--                        <%--%>
<%--                            Model model = new Model();--%>
<%--                            ModelService modelService = new ModelService(DbConnection.getConnection());--%>
<%--                            List<Model> model1 = modelService.getModel(model.getId());--%>
<%--                            for (Model model2 : model1) {--%>
<%--                        %>--%>

<%--                        <%--%>
<%--                            BrandService brandService = new BrandService(DbConnection.getConnection());--%>
<%--                            List<Brand> allBrands = brandService.getAllBrands();--%>
<%--                            for (Brand allBrand : allBrands) {--%>
<%--                                String selection = "";--%>
<%--                                if (allBrand.getId() == model2.getBrand_id()){--%>
<%--                                    selection ="selected";--%>
<%--                                }--%>
<%--                        %>--%>
<%--                        <option <%=selection%> value="<%=allBrand.getId()%>"><%=allBrand.getName()%></option>--%>
<%--                        <%}%>--%>
<%--                    </select>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label for="exampleInputName">Model Name</label>--%>
<%--                    <input type="text" class="form-control" name="name" id="exampleInputName" value="<%=model2.getName()%>"  placeholder="Enter Model Name">--%>
<%--                </div>--%>

<%--                <%}%>--%>

<%--                <button type="submit" class="btn btn-primary">Save</button>--%>
<%--            </form>--%>

<%--&lt;%&ndash;            <img src="E:/persistent/asd.jpg" alt="">&ndash;%&gt;--%>


<%--            </div>--%>


<%--        </div>--%>
<%--    </div>--%>


<form action="modelList.jsp">
    <input  type="submit" value="Previous">
</form>



</body>
</html>

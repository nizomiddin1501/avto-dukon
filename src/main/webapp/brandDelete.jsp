<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="uz.developers.model.Brand" %>
<%@ page import="java.util.List" %>

<%@ page import="uz.developers.service.ModelService" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    BrandService brandService = new BrandService(DbConnection.getConnection());
    brandService.deleteBrand(id);
    response.sendRedirect("modelList.jsp");
%>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<h2>Hello World!</h2>

<%--<div class="container">--%>
<%--    <h2>Edit Model</h2>--%>
<%--    <form method="post">--%>
<%--        <div class="form-group">--%>
<%--            <label for="name">Brand Name</label>--%>
<%--            <input type="text" class="form-control" id="name" name="name" value="<%=brand.getName()%>" required>--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Save</button>--%>
<%--        <a href="brandList.jsp" class="btn btn-secondary">Cancel</a>--%>
<%--    </form>--%>
<%--</div>--%>























<%--<div class="container">--%>


<%--    <%@include file="WEB-INF/jspf/header.jsp"%>--%>

<%--    <div class="row">--%>
<%--        <div class="col-md-3">--%>
<%--            <%@include file="WEB-INF/jspf/slidebar.jsp"%>--%>
<%--        </div>--%>

<%--        <div class="col-md-9">--%>
<%--            <h2>Registration</h2>--%>
<%--            </hr>--%>
<%--            <form action="brandUpdate" method="post">--%>

<%--                <%--%>
<%--                    Brand brand = new Brand();--%>
<%--                    BrandService brandService = new BrandService(DbConnection.getConnection());--%>
<%--                    List<Brand> brands = brandService.getBrand(brand.getId());--%>

<%--                    for (Brand brand1 : brands) {--%>
<%--                %>--%>

<%--                <div class="form-group">--%>
<%--                    <label>Brand ID</label>--%>
<%--                    <input type="text" class="form-control" name="id" value="<%=brand1.getId()%>" placeholder="Enter Brand ID">--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label>Brand Name</label>--%>
<%--                    <input type="text" class="form-control" name="brandName" value="<%=brand1.getName()%>"  placeholder="Enter Brand Name">--%>
<%--                </div>--%>

<%--                <button type="submit" class="btn btn-primary">Edit</button>--%>
<%--                <%}%>--%>
<%--            </form>--%>


<%--            </div>--%>


<%--        </div>--%>
<%--    </div>--%>





</body>
</html>

<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="uz.developers.model.Brand" %>
<%@ page import="java.util.List" %>

<%@ page import="uz.developers.service.ModelService" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="uz.developers.model.User" %>
<%

//    User auth = (User) request.getSession().getAttribute("auth");
//    if (auth != null) {
//        request.setAttribute("auth", auth);
//    } else {
//        response.sendRedirect("login.jsp");
//    }


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

<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="uz.developers.model.Brand" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.developers.model.User" %>

<%
//    User auth = (User) request.getSession().getAttribute("auth");
//    if (auth != null) {
//        request.setAttribute("auth", auth);
//    } else {
//        response.sendRedirect("login.jsp");
//    }




//    int id = Integer.parseInt(request.getParameter("id"));
//    BrandService brandService = new BrandService(DbConnection.getConnection());
//    Brand brand = brandService.getBrandById(id);
//
//    if (request.getMethod().equalsIgnoreCase("POST")) {
//        String name = request.getParameter("name");
//        brand.setName(name);
//        brandService.updateBrand(brand);
//        response.sendRedirect("brandList.jsp");
//    }

    Brand brand = (Brand) request.getAttribute("brand");
    if (brand == null) {
        out.println("No brand found for editing.");
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

<form action="brandList.jsp">
    <input  type="submit" value="Previous">
</form>


<div class="container">
    <h2>Edit Model</h2>
        <form action="/brandEdit" method="post">
            <input type="hidden" name="id" value="<%= brand.getId() %>">
        <div class="form-group">
            <label for="name">Brand Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%=brand.getName()%>" required>
        </div>

            <div class="form-group">
                <label for="name">Brand Photo</label>
                <input type="file" class="form-control" id="photo" name="photo" value="<%=brand.getPhoto()%>" required>
            </div>

        <button type="submit" class="btn btn-primary">Save</button>
        <a href="brandList.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>

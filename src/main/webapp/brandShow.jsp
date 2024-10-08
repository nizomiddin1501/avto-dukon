<%@ page import="uz.developers.service.DbConnection" %>
<%@ page import="uz.developers.service.CarService" %>
<%@ page import="uz.developers.model.Car" %>
<%@ page import="uz.developers.model.User" %>
<%@ page import="uz.developers.service.ModelService" %>
<%@ page import="uz.developers.model.Model" %>
<%@ page import="uz.developers.service.BrandService" %>
<%@ page import="uz.developers.model.Brand" %>
<%
//    User auth = (User) request.getSession().getAttribute("auth");
//    if (auth != null) {
//        request.setAttribute("auth", auth);
//    } else {
//        response.sendRedirect("login.jsp");
//    }




    int brandId = Integer.parseInt(request.getParameter("id"));
    BrandService brandService = new BrandService(DbConnection.getConnection());
    Brand brandById = brandService.showBrandById(brandId);
%>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title style="text-align: center">Brand Details</title>

</head>
<body>

<%@include file="WEB-INF/jspf/navbar.jsp" %>


            <section class="w-100 px-4 py-5" style="background-color: #9de2ff; border-radius: .5rem .5rem 0 0;">
                <div class="row d-flex justify-content-center">
                    <div class="col col-md-9 col-lg-7 col-xl-6">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-4">
                                <div class="d-flex">
                                    <div class="flex-shrink-0">
                                        <img src="<%= request.getContextPath() %>/<%= brandById.getPhoto() %>" alt="Client Photo"
                                             class="img-fluid" style="width: 150px; border-radius: 50px;">
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <div class="container">
                                            <ul>
                                                <li><h5 class="mb-1"><%= brandById.getName()%></h5></li>
<%--                                                <li><h5 class="mb-1"><%= %></h5></li>--%>
                                                </ul>
                                        </div>

                                        <div class="d-flex justify-content-center pt-1">
                                            <a href="brandList.jsp?id=<%=brandById.getId()%>" class="btn btn-primary">Previous</a>
                                            <a href="brandShow.jsp?id=<%=brandById.getId()%>" class="btn btn-dark">Next</a>

<%--                                            <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-primary me-1 flex-grow-1">Chat</button>--%>
<%--                                            <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary flex-grow-1">Follow</button>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


</body>
</html>

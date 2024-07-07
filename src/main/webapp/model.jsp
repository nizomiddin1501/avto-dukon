<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<h2>Hello World!</h2>

<div class="container">


    <%@include file="WEB-INF/jspf/header.jsp"%>

    <div class="row">
        <div class="col-md-3">
            <%@include file="WEB-INF/jspf/slidebar.jsp"%>
        </div>

        <div class="col-md-9">
            <h2>Registration</h2>
            </hr>
            <form action="/modelAdd" method="post">

                <div class="form-group">
                    <label for="exampleInputName">Brand</label>
                    <select name="brand_id" class="form-control">
                        <option value="2">Kia</option>
                        <option value="5">Honda</option>
                        <option value="6">Shevrolet</option>
                        <option value="7">BMV</option>
                        <option value="8">Mersedes</option>
                        <option value="9">Hyundai</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="exampleInputName">Model Name</label>
                    <input type="text" class="form-control" name="name" id="exampleInputName"  placeholder="Enter Model Name">
                </div>




                <button type="submit" class="btn btn-primary">Save</button>
            </form>

<%--            <img src="E:/persistent/asd.jpg" alt="">--%>


            </div>


        </div>
    </div>




</body>
</html>

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
            <form action="/carAdd" method="post">

                <div class="form-group">
                    <label >Title</label>
                    <input type="text" class="form-control" name="title"  placeholder="Enter Title">
                </div>

                <div class="form-group">
                    <label >Description</label>
                    <input type="text" class="form-control" name="description" placeholder="Enter Description">
                </div>

                <div class="form-group">
                    <label >Year</label>
                    <input type="text" class="form-control" name="year" placeholder="Enter Year">
                </div>

                <div class="form-group">
                    <label >Price</label>
                    <input type="text" class="form-control" name="price" placeholder="Enter Price">
                </div>




                <div class="form-group">
                    <label >Model</label>
                    <select name="model_id" class="form-control">
                        <option value="1">malibu</option>
                    </select>
                </div>


                <div class="form-group">
                    <label >Member</label>
                    <select name="member_id" class="form-control">
                        <option value="2">Nizomiddin</option>
                    </select>
                </div>


                <button type="submit" class="btn btn-primary">Save</button>
            </form>

<%--            <img src="E:/persistent/asd.jpg" alt="">--%>


            </div>


        </div>
    </div>




</body>
</html>

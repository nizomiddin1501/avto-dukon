<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div class="container">


    <div class="row">
        <div class="col-md-3">
        </div>

        <div class="col-md-9">
            <h2>Registration</h2>
            </hr>
            <form action="/register" method="post">

                <div class="form-group">
                    <label for="exampleInputFirstname">Firstname</label>
                    <input type="text" class="form-control" name="firstname" id="exampleInputFirstname"  placeholder="Enter Firstname">
                </div>

                <div class="form-group">
                    <label for="exampleInputLastname">Lastname</label>
                    <input type="text" class="form-control" name="lastname" id="exampleInputLastname"  placeholder="Enter Lastname">
                </div>

                <div class="form-group">
                    <label for="exampleInputPhoneNumber">Phone Number</label>
                    <input type="number" class="form-control" name="phoneNumber" id="exampleInputPhoneNumber"  placeholder="Enter Phone Number">
                </div>



                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" name="email" id="exampleInputEmail1"  placeholder="Enter email">
                </div>

                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Password">
                </div>

                <div class="form-group">
                    <label for="exampleInputPhoto">Photo</label>
                    <input type="file" class="form-control" name="photo" id="exampleInputPhoto" placeholder="Photo">
                </div>

                <button type="submit" class="btn btn-primary">Registration</button>
            </form>




            </div>


        </div>
    </div>




</body>
</html>

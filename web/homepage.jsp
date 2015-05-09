
<html lang="en">
    <head>

        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script src="js/myscript.js"></script>
        <title>Home</title>
    </head>
    <body>
        <div class="container" id="home">

            <%@include file="component/header.jsp" %>

            <dl>
                <dt><h2><font color="#3C3C3C">Customer information</font></h2></dt>
                <dd><a href="addcustomer.jsp">Add New Customer</a></dd>
                <dd><a href="searchcustomer.jsp">Search Customer</a></dd>                               
                <dt><h2><font color="#3C3C3C">User information</font></h2></dt>
                <dd><a href="AddNewUser.jsp">Add New User</a></dd>
                <dd><a href="ChangePassword.jsp">Change Password</a></dd>
                <dd><a href="SearchUser.jsp">Search User</a></dd>
                <dt><h2><font color="#3C3C3C">About</font></h2></dt>
                <dd>Management Customer information</dd>
                <dd>BCK</dd>
                <dd>Version 1.0</dd>

            </dl>

        </div>

    </body>
</html>

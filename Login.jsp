
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Redirect"%>
<%@page import="DataAccessLayer.UserDAL"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <style>	

            body {
                background-image: url(images/bck.jpg) ;
                background-size: cover;
            }

        </style>

    </head>
    <body >
        <div class="container">
            <form action="Login.jsp" class="form-sigin" method="POST">
                <h1><font color="white">Welcome to page</font></h1>
                <h3 class="form-signin-heading"><font color="white">Please sign in:</font></h3>
                <div class="row">
                    <div class="col-lg-3">
                        <font color="white">User name: </font>
                        <input type="text" class="form-control " name="txtName" placeholder="Username" /></div></div>
                <p></p>
                <div class="row">
                    <div class="col-lg-3">
                        <font color="white">Password: </font>
                        <input type="password" class="form-control" name="txtPass" placeholder="Password" /></div></div>
                <p><p><input type="submit"  class="btn btn-primary" name="btnSubmit" value="Sign in" />


            </form>
            <%
                if (request.getParameter("btnSubmit") != null) {
                    User user = new User(request.getParameter("txtName"), request.getParameter("txtPass"));
                    UserDAL userDal = new UserDAL();
                    if (userDal.isValid(user))
                    {
                        session.setAttribute("username", user.getName());
                        session.setAttribute("password", user.getPassword());
                        response.sendRedirect("homepage.jsp");
                    }
                        
                    else {
            %>
            <h3><font color="#FF3030">User name or password incorrect or does not exist.</font></h3>
                <%
                        }
                    }

                %>
        </div>

    </body>
</html>

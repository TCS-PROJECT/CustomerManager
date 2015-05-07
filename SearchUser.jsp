
<%@page import="java.sql.Date"%>
<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DataAccessLayer.UserDAL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script src="js/myscript.js"></script>
        <title>Search User</title>
    </head>
    <body>
        <div class="container" id="searchusers">
            <%@include file="component/header.jsp" %>
            <form action="SearchUser.jsp" class="form-sigin">
                <h2 class="form-signin-heading">Please input username </h2>
                <p><input type="text" class="form-control" name="txtNa_Search" placeholder="Username" />      
                <p><input type="submit"  class="btn btn-primary" name="btnSearch_User" value="Search" />
                    <input type="button" class="btn btn-danger" name="btnBack" value="Back" onclick="window.location = 'homepage.jsp'" />
            </form>
            <%
                ArrayList<User> arr = new ArrayList<User>();
                String namee = request.getParameter("txtNa_Search");
                UserDAL user = new UserDAL();
                
                if (request.getParameter("btnSearch_User") != null) {
                    arr = user.Select_Search_User(namee);
                    if (namee == "" || namee.length() < 0) {
                        out.println("<h3>Search criteria empty!</h3>");
                    } else if (arr.isEmpty()) {
            %>
            <h3>User not found!</h3>
            <%
            } else {
            %>
            <h2>User Information:</h2>
            <div class="panel panel-default">
                <div class="panel-heading">Result</div>
                <table class="table">
                    <tr>
                        <!--<td></td>-->
                        <td>Username</td>
                        <td>Password</td>
                        <td>Action</td>
                    </tr>
                    <%
                        for (User s : arr) {
                            String name = s.getName();
                            String pa = s.getPassword();
                    %>
                    <tr>
                        <td><%=name%></td>
                        <td><%
                            for (int i = 0; i < pa.length(); i++) {
                                out.print('*');
                            }
                            %></td>
                        <td><a href="ChangePassword.jsp">Change Password</a> | <a href="DeleteUser.jsp?name=<%=name%>">Delete</a></td>
                    </tr>
                    <%
                                }
                            }
                        }
                    %>
                </table>
            </div>
    </body>
</html>

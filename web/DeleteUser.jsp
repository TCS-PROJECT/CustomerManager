
<%@page import="java.util.ArrayList"%>
<%@page import="DataAccessLayer.UserDAL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>Delete User</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script src="js/myscript.js"></script>
    </head>
    <body>  
        <div class="container" id="delatepass">
            <%@include file="component/header.jsp" %>
            <%  String name = "";
                if (request.getParameter("btnDelete_User") == null && request.getParameter("btnBack_User") == null) {
                    name = request.getParameter("name");
                    session.setAttribute("sname", name);
                }
            %>
            <form action="DeleteUser.jsp" class="form-sigin">
                <h2 class="form-signin-heading">Are you sure ? </h2>    
                <p><input type="submit"  class="btn btn-primary" name="btnDelete_User" value="Yes" />
                    <input type="button" class="btn btn-danger" name="btnBack_User" value="No" onclick="window.location = 'SearchUser.jsp'" />
            </form>
            <%
                UserDAL user = new UserDAL();

                if (request.getParameter("btnDelete_User") != null) {
                    user.Delete_User((String) session.getAttribute("sname"));
                    ArrayList<String> arr = new ArrayList<String>();
                    arr.addAll(user.Select_all_Username());
                    boolean d = arr.contains(name);
                    if (d == false) {
            %> 
            Success. You will be redirected ...
            <meta http-equiv="Refresh" content="2;url=homepage.jsp">
            <%
            } else {
            %>
            Failed. Try again
            <meta http-equiv="Refresh" content="2;url=SearchUser.jsp?id=<%=name%>">
            <%
                    }
                }
            %>
            </body>
            </html>

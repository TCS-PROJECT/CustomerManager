<%-- 
    Document   : Logout
    Created on : May 7, 2015, 12:54:35 PM
    Author     : Win8.1 VS10 X64
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("Login.jsp");
            
            %>
    </body>
</html>

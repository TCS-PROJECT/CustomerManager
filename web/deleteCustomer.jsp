
<%@page import="DataAccessLayer.CustomerDAL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>

        <%
            CustomerDAL pro = new CustomerDAL();
            pro.Delete(request.getParameter("id"));
            //out.println(request.getParameter("id"));
            response.sendRedirect("searchcustomer.jsp?where=delete");
        %>
    </body>
</html>

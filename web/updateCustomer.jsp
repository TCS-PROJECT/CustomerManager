

<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DataAccessLayer.CustomerDAL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%
            String discount = "Yes";
            if (request.getParameter("txtDiscount") == null) {
                discount = "No";
            }

            CustomerDAL pro = new CustomerDAL();

            pro.Update(request.getParameter("txtNa"), request.getParameter("txtDes"), request.getParameter("txtMadein"), request.getParameter("txtMnf").trim(), discount, request.getParameter("txtStatus"), request.getParameter("txtStart"), request.getParameter("txtEnd"), request.getParameter("txtPrice"), request.getParameter("txtId"));
            response.sendRedirect("searchcustomer.jsp?where=update");
        %>
        <section class="container" id="update">



        </section>
    </body>
</html>

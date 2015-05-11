

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
            if (request.getParameter("txtMarried") == null) {
                discount = "No";
            }

            CustomerDAL pro = new CustomerDAL();

            pro.Update(request.getParameter("txtNa"), request.getParameter("txtAddress"), request.getParameter("txtSex"), request.getParameter("txtDOB").trim(), discount, request.getParameter("txtStatus"), request.getParameter("txtStart"), request.getParameter("txtEnd"), request.getParameter("txtIncome"), request.getParameter("txtId"));
            response.sendRedirect("searchcustomer.jsp?where=update");
        %>
        <section class="container" id="update">



        </section>
    </body>
</html>

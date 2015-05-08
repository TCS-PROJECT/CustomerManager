
<%@page import="java.util.ArrayList"%>
<%@page import="DataAccessLayer.UserDAL"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script src="js/myscript.js"></script>

        <title>Add new User</title>
    </head>
    <body>
        <div class="container" id="addnewuser">

            <%@include file="component/header.jsp" %>
            <%
                //User user=new User(request.getParameter("txtNa"), request.getParameter("txtPa"));
                UserDAL userDal = new UserDAL();
                String na = request.getParameter("txtNa");
                String pa = request.getParameter("txtPa");
                ArrayList<String> arr = new ArrayList<String>();
                arr.addAll(userDal.Select_all_Username());
                boolean d = arr.contains(na);

            %>

            <div class="container">
                <form action="AddNewUser.jsp" class="form-sigin">
                    <h2 class="form-signin-heading">Enter  user information:</h2>
                    <p><input type="text" class="form-control" name="txtNa" placeholder="Username" />
                    <p><input type="password" class="form-control" name="txtPa" placeholder="Password" />
                    <p><input type="submit"  class="btn btn-primary" name="btnSubmit_Add" value="Save" />
                        <input type="button" class="btn btn-danger" name="btnBack" value="Back" onclick="window.location = 'homepage.jsp'" />
                </form>  
                <%                   if (request.getParameter("btnSubmit_Add") != null) {
                        if ((request.getParameter("txtNa").equals("")) || (d == true)) {
                %>
                Username cannot be null or already exist ! 
                <%
                } else {
                    userDal.Insert(na, pa);
                %>              
                <div class="modal fade" id="thongbao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Affirmation</h4>
                            </div>
                            <div class="modal-body well">
                                <h2>Add new user successfully!</h2>
                            </div>

                        </div>
                    </div>
                </div>
                <meta http-equiv="Refresh" content="2;url=homepage.jsp">
                <%
                        }
                    }
                %>   

            </div>           

    </body>
</html>

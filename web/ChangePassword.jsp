
<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<%@page import="DataAccessLayer.UserDAL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script src="js/myscript.js"></script>
    </head>
    <body>    
        <div class="container" id="changepass">
            <%@include file="component/header.jsp" %>
            <div class="container">
                <form action="ChangePassword.jsp" class="form-sigin">  
                    <h2 class="form-signin-heading">Please fill information to change password</h2>
                    <p><input type="text" class="form-control" name="txtName_changePassword" placeholder="Username" />
                    <p><input type="password" class="form-control" name="txtPass_changePassword" placeholder="New Password" />
                    <p><input type="submit"  class="btn btn-primary" name="btnSubmit_changePassword" value="Save" />
                        <input type="button" class="btn btn-danger" name="btnBack_changePassword" value="Back" onclick="window.location = 'homepage.jsp'" />

                        <%

                            if (request.getParameter("btnSubmit_changePassword") != null) {
                                UserDAL user = new UserDAL();
                                String na = request.getParameter("txtName_changePassword");
                                String pa = request.getParameter("txtPass_changePassword");
                                User u = new User(na, pa);
                                ArrayList<String> arr = new ArrayList<String>();
                                arr.addAll(user.Select_all_Username());
                                if (arr.contains(na)) {
                                    user.Update_User(na, pa);
                        %>
                    <div class="modal fade" id="thongbao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Affirmation</h4>
                                </div>
                                <div class="modal-body well">
                                    <h2>Change password successfully!</h2>
                                </div>

                            </div>
                        </div>
                    </div>
                    <meta http-equiv="Refresh" content="2;url=homepage.jsp">
                    <%
                    } else {
                    %>
                    No such username.Try again.
                    <%
                            }
                        }
                    %>


                </form>
            </div>
    </body>
</html>

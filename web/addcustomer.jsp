
<%@page import="DataAccessLayer.CustomerDAL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script src="js/myscript.js"></script>
        <title>Add New Customer</title>
    </head>
    <body>
        <script>
            function validateform() {
                var name = document.myform.txtNa.value;
                var add = document.myform.txtAddress.value;
                var income = document.myform.txtIncome.value;
                var dob = document.myform.txtDOB.value;
                var st = document.myform.txtStart.value;
                var en = document.myform.txtEnd.value;
                var sex = document.myform.txtSex.value;
                
                
                if (name == null || name == "") {
                    alert("Customer name can't be blank");
                    return false;
                }
                if (add == null || add == "") {
                    alert("Address can't be blank");
                    return false;
                }
                
                if (dob == null || dob == "") {
                    alert("Date of birth can't be blank");
                    return false;
                }
                
                if (sex == null || sex == "") {
                    alert("Gender can't be blank");
                    return false;
                }
                                               
                 if (st == null || st == "") {
                    alert("Start Date can't be blank");
                    return false;
                }
                
                 if (en == null || en == "") {
                    alert("End Date can't be blank");
                    return false;
                }
                
                if (income == null || income == "") {
                    alert("Income can't be blank");
                    return false;
                }
                
                var today = new Date();

                var mdate = new Date(document.myform.txtDOB.value);
				// check DOB and today
                if (mdate > today)
                {
                    alert("Date of birth can't be in future!");
                    return false;
                }    
                
                var start = Date.parse(document.myform.txtStart.value);
                var end = Date.parse(document.myform.txtEnd.value);
                if (start > end) {
                    alert("Start date in must before End date");
                    return false;
                }
              
                
                // check Income
                var ic = parseFloat(income);
                if (isNaN(ic)) {
                    alert("Income must be positive number");
                    return false;
                }
                else if (ic <= 0) {
                    alert("Income must be greater than 0");
                    return false;
                }
            }
        </script>
        <%
            if (request.getParameter("btnSave") != null) {

                CustomerDAL pro = new CustomerDAL();
                String discount = "Yes";
                if (request.getParameter("txtMarried") == null) {
                    discount = "No";
                }

                pro.Insert(request.getParameter("txtNa"), request.getParameter("txtAddress"), request.getParameter("txtSex"), request.getParameter("txtDOB").trim(), discount, request.getParameter("txtStatus"), request.getParameter("txtStart"), request.getParameter("txtEnd"), request.getParameter("txtIncome"));

        %>
        <div class="modal fade" id="thongbao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Affirmation</h4>
                    </div>
                    <div class="modal-body well">
                        <h2>New Customer is added successful!</h2>
                    </div>

                </div>
            </div>
        </div>
        <%            }
        %>
        <section class="container" id="add">
            <%@include file="component/header.jsp" %>
            <div class="panel panel-success col-lg-9">
                <div class="panel-heading">
                    <h3 class="panel-title">Fill all field to add new customer!</h3>
                </div>
                <div class="panel-body">
                    <form name="myform" action="addcustomer.jsp" method="POST" onsubmit="return validateform()">



                        <p><span class="label label-info">Customer Name:</span>

                            <input name="txtNa" id="name" type="text" ></p>
                        <p><span class="label label-primary">Address:</span>
                            <input name="txtAddress" id="des" type="text" value=""></p>
                        <p><span class="label label-danger">DOB</span>
                           <input name="txtDOB" id="mnf" type="date" ></p>
                        <p><span class="label label-default">Gender</span>
                            <input name="txtSex" id="madein" type="radio" value="Male">Male  <input name="txtSex" id="madein" type="radio" value="Female">Female</p>
                        <p><span class="label label-warning">Married</span>
                            <input name="txtMarried" id="discount" type="checkbox" ></p>
                        <p><span class="label label-info" id="status">Status</span>
                            <select name="txtStatus">
                                <option value="Live">Live</option>
                                <option value="Death">Death</option>
                            </select>
                        <p>
                            <span class="label label-success">Start Date:</span>
                            <input name="txtStart" id="start" type="date" >
                            <span class="label label-danger"> End Date:</span>
                            <input name="txtEnd" id="end" type="date" >
                        </p>
                        <p><span class="label label-warning">Income</span>
                            <input name="txtIncome" id="price" type="text" ></p>


                        <div class="panel-footer">
                            <button type="button" class="btn btn-default" onclick="window.location = 'homepage.jsp'">Back</button>
                            <input type="submit" name="btnSave"  class="btn btn-primary"  value="Save"/>
                        </div>
                    </form> 
                </div>
            </div>
        </section>

    </body>
</html>

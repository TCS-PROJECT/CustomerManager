
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
            function isDate(txtDate)
            {
                 //check date

                var currVal = txtDate;
                if (currVal == '')
                {
                    alert("Date can't be blank");
                    return false;
                }

                var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/; //Declare Regex
                var dtArray = currVal.match(rxDatePattern); // is format OK?

                if (dtArray == null)
                {
                    alert("Date must be in the format dd/mm/yyyy");
                    return false;
                }

                //Checks for dd/mm/yyyy format.
                dtMonth = dtArray[3];
                dtDay = dtArray[1];
                dtYear = dtArray[5];

                if (dtMonth < 1 || dtMonth > 12)
                {
                    alert("Date error!");
                    return false;
                }
                else if (dtDay < 1 || dtDay > 31)
                {
                    alert("Date error!");
                    return false;
                }
                else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31)
                {
                    alert("Date error!");
                    return false;
                }
                else if (dtMonth == 2)
                {
                    var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
                    if (dtDay > 29 || (dtDay == 29 && !isleap))
                    {
                        alert("Date error!");
                        return false;
                    }
                }

                //end check

                return true;
            }

            function validateform() {
                var name = document.myform.txtNa.value;
                var add = document.myform.txtDes.value;
                var income = document.myform.txtPrice.value;


                if (name == null || name == "") {
                    alert("Customer name can't be blank");
                    return false;
                }
                if (add == null || add == "") {
                    alert("Address can't be blank");
                    return false;
                }

               var dob = document.myform.txtMnf.value;
               isDate(dob);
               var st = document.myform.txtStart.value;
               isDate(st);
               var en = document.myform.txtEnd.value;
               isDate(en);
                var start = Date.parse(document.myform.txtStart.value.split('/').reverse().join('/'));
                var end = Date.parse(document.myform.txtEnd.value.split('/').reverse().join('/'));
                if (start > end) {
                    alert("Start date in must before End date");
                    return false;
                }
                var q = new Date();
                var m = q.getMonth() + 1;
                var d = q.getDay();
                var y = q.getFullYear();

                var today = new Date(y, m, d);

                var mdate = new Date(document.myform.txtMnf.value.split('/').reverse().join('/'));

                if (mdate > today)
                {
                    alert("Date of birth can't be in future!");
                    return false;
                }

                if (income == null || income == "") {
                    alert("Income can't be blank");
                    return false;
                } else {
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


            }
        </script>
        <%
            if (request.getParameter("btnSave") != null) {

                CustomerDAL pro = new CustomerDAL();
                String discount = "Yes";
                if (request.getParameter("txtDiscount") == null) {
                    discount = "No";
                }

                pro.Insert(request.getParameter("txtNa"), request.getParameter("txtDes"), request.getParameter("txtMadein"), request.getParameter("txtMnf").trim(), discount, request.getParameter("txtStatus"), request.getParameter("txtStart"), request.getParameter("txtEnd"), request.getParameter("txtPrice"));

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
                            <input name="txtDes" id="des" type="text" value=""></p>
                        <p><span class="label label-danger">DOB</span>
                            <input name="txtMnf" id="mnf" type="text" ></p>
                        <p><span class="label label-default">Gender</span>
                            <input name="txtMadein" id="madein" type="radio" value="Male">Male  <input name="txtMadein" id="madein" type="radio" value="Female">Female</p>
                        <p><span class="label label-warning">Married</span>
                            <input name="txtDiscount" id="discount" type="checkbox" ></p>
                        <p><span class="label label-info" id="status">Status</span>
                            <select name="txtStatus">
                                <option value="Live">Live</option>
                                <option value="Death">Death</option>
                            </select>
                        <p>
                            <span class="label label-success">Start Date:</span>
                            <input name="txtStart" id="start" type="text" >
                            <span class="label label-danger"> End Date:</span>
                            <input name="txtEnd" id="end" type="text" >
                        </p>
                        <p><span class="label label-warning">Income</span>
                            <input name="txtPrice" id="price" type="text" ></p>


                        <div class="panel-footer">
                            <button type="button" class="btn btn-default" >Back</button>
                            <input type="submit" name="btnSave"  class="btn btn-primary"  value="Save"/>
                        </div>
                    </form> 
                </div>
            </div>
        </section>

    </body>
</html>

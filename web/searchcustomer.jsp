
<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Customer"%>
<%@page import="DataAccessLayer.CustomerDAL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script src="js/myscript.js"></script>
        <title>Search Customer</title>

    </head>
    <body>
        <script >
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
                
              
               if(isDate(dob)==false){
                   return false;
               }
       
               
               if(isDate(st)==false){
                   return false;
               }
               
               if(isDate(en)==false){
                   return false;
               }
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

                var mdate = new Date(document.myform.txtDOB.value.split('/').reverse().join('/'));

                if (mdate > today)
                {
                    alert("Date of birth can't be in future!");
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
        <section class="container" id="search">
            <%@include file="component/header.jsp" %>
            <%
                Boolean isNull = false;
                ArrayList<Customer> pList = new ArrayList<Customer>();
                if (request.getParameter("where") != null) {
                    if (request.getParameter("where").trim().equals("delete")) {%>
            <!-- Modal 2-->
            <div class="modal fade" id="thongbao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Affirmation</h4>
                        </div>
                        <div class="modal-body well">
                            <h2>Customer is deleted successful!</h2>
                        </div>

                    </div>
                </div>
            </div>
            <%
            } else %>
            <div class="modal fade" id="thongbao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Affirmation</h4>
                        </div>
                        <div class="modal-body well">
                            <h2>Customer is updated successful!</h2>
                        </div>

                    </div>
                </div>
            </div>
            <%
          ;
                }
                if (request.getParameter("btnSearch") != null) {
                    CustomerDAL customerDAL = new CustomerDAL();
                    if (request.getParameter("txtDOB").equals("") == true && request.getParameter("txtName").equals("") == true) {
                        isNull = true;
                    } else if (request.getParameter("txtName").equals("")) {

                        pList = customerDAL.SearchbyDob(request.getParameter("txtDOB"));

                    } else if (request.getParameter("txtDOB").equals("")) {
                        pList = customerDAL.SearchbyName(request.getParameter("txtName"));
                    } else {
                        pList = customerDAL.SearchbyBoth(request.getParameter("txtName"), request.getParameter("txtDOB"));
                    }
                }

            %>
            <form action="searchcustomer.jsp" method="POST">
                <h1>Enter customer name or date of birth to search</h1>
                <p>Customer name: <input class="form-control" type="text" name="txtName">
                    or
                <p>Date of birth: <input type="text" class="form-control" name="txtDOB" >

                <p><input type="submit"  name="btnSearch"  class="btn btn-primary" value="Search">
                    <input type="reset" name="btnClear" class="btn btn-success" value="Clear" onclick='window.location = "searchcustomer.jsp"'/>
            </form>
            <%            if (request.getParameter("btnSearch") != null) {
                    if (isNull)
                        out.println("<h3>Search criteria empty! </h3>");
                    else if (pList.isEmpty()) {
            %>
            <h1>Customer not found!</h1>
            <%
            } else {
            %>



            <div class="panel panel-default">

                <!-- Default panel contents -->
                <div class="panel-heading">Search result</div>

                <!-- Table -->
                <table class="table table-striped">
                    <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>DOB</td>
                        <td>Address</td>
                        <td>Start Date</td>
                        <td>Modify</td>
                    </tr>
                    <%for (Customer p : pList) {%>
                    <tr>
                        <td>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" data-title="Customer Detail" data-pid="<%=p.getId()%>"
                                    data-pname="<%=p.getName()%>"  data-pdes="<%=p.getAddress()%>" 
                                    data-pmnf="<%=p.getDob()%>"  data-pmadein="<%=p.getGender()%>"
                                    data-pdc="<%=p.getMarried()%>"  data-psta="<%=p.getStatus()%>"
                                    data-pstart="<%=p.getStartDate()%>"  data-pend="<%=p.getEndDate()%>"
                                    data-pprice="<%=p.getIncome()%>"

                                    >
                                <%=p.getId()%>
                            </button>
                        </td>

                        <td><%=p.getName()%></td>
                        <td><%=p.getDob()%></td>      
                        <td><%=p.getAddress()%></td>
                        <td><%=p.getStartDate()%></td>

                        <td>
                            <div class="btn-group" role="group" >
                                <button type="button" class="btn btn-default" onclick="window.location.href = 'deleteCustomer.jsp?id=<%=p.getId()%>'">Delete</button>
                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" data-title="Update Customer" data-pid="<%=p.getId()%>"
                                        data-pname="<%=p.getName()%>"  data-pdes="<%=p.getAddress()%>" 
                                        data-pmnf="<%=p.getDob()%>"  data-pmadein="<%=p.getGender()%>"
                                        data-pdc="<%=p.getMarried()%>"  data-psta="<%=p.getStatus()%>"
                                        data-pstart="<%=p.getStartDate()%>"  data-pend="<%=p.getEndDate()%>"
                                        data-pprice="<%=p.getIncome()%>"

                                        >Update</button>
                            </div>    
                        </td>
                    </tr>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel"></h4>
                                </div>
                                <div class="modal-body">
                                    <form action="updateCustomer.jsp" method="POST" name="myform" onsubmit="return validateform()">
                                        <p><span class="label label-info">Customer ID:</span>
                                            <input  name="txtId" id="id" type="text" ></p>
                                        <p><span class="label label-info">Customer Name:</span>           
                                            <input name="txtNa" id="name" type="text" ></p>
                                        <p><span class="label label-primary">Address:</span>
                                            <input name="txtAddress" id="des" type="text" value=""></p>
                                        <p><span class="label label-danger">DOB</span>
                                            <input name="txtDOB" id="mnf" type="text" ></p>
                                        <p><span class="label label-default">Gender</span>
                                            <input name="txtSex" id="madein" type="radio" value="Male" <%if (p.getGender().equals("Male")) {%> checked <%}%>>Male  
                                            <input name="txtSex" id="madein" type="radio" value="Female"<%if (p.getGender().equals("Female")) {%> checked <%}%>>Female</p>
                                        <p><span class="label label-warning">Married</span>
                                            <input name="txtMarried" id="discount" type="checkbox"></p>
                                        <p><span class="label label-info" id="status">Status</span>
                                            <select name="txtStatus">
                                                <option value="Live" <%if (p.getStatus().contains("Live")) {%> selected <%}%>>Live</option>
                                                <option value="Death"<%if (p.getStatus().contains("Death")) {%> selected <%}%>>Death</option>
                                            </select>
                                        <p>
                                            <span class="label label-success">Start Date:</span>
                                            <input name="txtStart" id="start" type="text" >
                                            <span class="label label-danger"> End Date:</span>
                                            <input name="txtEnd" id="end" type="text" >
                                        </p>
                                        <p><span class="label label-warning">Income</span>
                                            <input name="txtIncome" id="price" type="text" ></p>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-primary" id="btnSave"  value="Save Changes"></input>
                                    </form> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </table >
            </div>
            <%
                    }
                }
            %> 
            <!-- Button trigger modal -->



        </section>

    </body>
</html>

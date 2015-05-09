<%-- 
    Document   : header
    Created on : May 7, 2015, 12:54:35 PM
    Author     : MK
--%>
<nav class="navbar navbar-default">

	<ul class="nav nav-tabs">
    <li role="presentation"  ><a href="homepage.jsp">Home</a></li>
    <li role="presentation" > <a href="addcustomer.jsp">Add New Customer</a></li>
    <li role="presentation"><a href="searchcustomer.jsp">Search Customer</a></li>  
    <li role="presentation" class="dropdown">
   <a class="dropdown-toggle" data-toggle="dropdown" href="#" >
      User configuration <span class="caret"></span>
    </a>
    <ul class="dropdown-menu" role="menu">       
       <li role="presentation"><a href="AddNewUser.jsp">Add new user</a></li>
       <li role="presentation"><a href="ChangePassword.jsp">Change Password</a></li>
       <li role="presentation"><a href="SearchUser.jsp">Search User</a></li>
    </ul>
  </li>
  
    <li role="presentation"><a href="about.jsp">About </a></li>
    <li role="presentation"><a href="Logout.jsp">Logout </a></li>
</ul>

</nav><!-- narbar -->

<%
        String username = "";
        String password = "";
        try{
            username = session.getAttribute("username").toString().toLowerCase();
            password = session.getAttribute("password").toString();
        }
        catch(NullPointerException ex){
                
                response.sendRedirect("Login.jsp");
             }
            
%>
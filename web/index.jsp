<%-- 
    Document   : search
    Created on : Jul 18, 2020, 7:15:42 PM
    Author     : Eksha Singh
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Universities</title>
        <style>
            ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
          }

          li {
            float: left;
            color: white;
          }

          li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
          }

          li a:hover:not(.active) {
            background-color: #111;
          }
          table, td, th {  
            border: 1px solid #ddd;
            text-align: left;
          }

          table {
            border-collapse: collapse;
            width: 100%;
          }

          th, td {
            padding: 15px;
          }

        </style>
    </head>
    <body style="background-color: black; color: white;">
        <div style="height: 200px; background-image: url('bg2.jpg'); background-repeat: no-repeat; background-position: right; background-size: cover; color: #e6c07b">
        <ul>
        <li style="padding: 15px; color: #e6c07b"><bold>UNIVERSITY SEARCH ENGINE</bold></li>
        <li><a href="Index.html">Home</a></li>
        <li><a href="about.html">About</a></li>
        <li style="float:right"><a href="login.html">Login</a></li>
        <li style="float:right"><a href="registration.html">Register</a></li>
    </ul>
            <center>
                <h1 style="padding: 20px;">Search Results</h1>
            </center>
            </div>

        <table border="1">
            <tr style="color: #e6c07b">
                <th>S.No.</th>
                <th>College Name</th>
                <th>College Rank</th>
                <th>College Streams</th>
                <th>College Courses</th>
                <th>College Type</th>
                <th>College Affiliation</th>
                <th>College Info</th>
                <th>College Site</th>
            </tr>
            <%
                try{
                    //database connection
                    Class.forName("com.mysql.jdbc.Driver"); //static keyword...first word capital
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/colleges", "root" , "mysql");
                                                    //protocol //sub protocol //local//port number//   //username  //password
                                         
        Statement st = con.createStatement();
                    //get username input from index.html
                    String user = request.getParameter("user");
                    //String sqlStr = "select * from colleges.colleges_info";
                    String sqlStr = "SELECT * FROM colleges_info WHERE college_streams like '%"+user+"%'";
                    ResultSet rs = st.executeQuery(sqlStr);
                    while(rs.next()){
                        %>
                        <tr style="color: white">
                            <td>0<%=rs.getInt("id")%> </td>
                            <td style="color: #e6c07b"><%=rs.getString("college_name")%> </td>
                            <td><%=rs.getInt("college_rank")%> </td>
                            <td><%=rs.getString("college_streams")%> </td>
                            <td><%=rs.getString("college_courses")%> </td>
                            <td><%=rs.getString("college_type")%> </td>
                            <td><%=rs.getString("college_affiliation")%> </td>
                            <td><%=rs.getString("college_info")%> </td>
                            <td><a href="<%=rs.getString("college_site")%>" style="color: #e6c07b"><%=rs.getString("college_site")%></a>
                            </td>
                        </tr>
                        <% }  //while loop complete here
                    
                }catch(Exception e){
                    System.out.println(e.getMessage());
                }
            %>
        </table>
    </center>
    </body>
</html>

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
    </head>
    <body style="background-color: whitesmoke; color: black; font-family: monospace">
    <center>
        <h1>Search Results</h1>
        <table border="1">
            <tr style="color: black">
                <th>Id</th>
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
                        <tr style="color: blue">
                            <td><%=rs.getInt("id")%> </td>
                            <td><%=rs.getString("college_name")%> </td>
                            <td><%=rs.getInt("college_rank")%> </td>
                            <td><%=rs.getString("college_streams")%> </td>
                            <td><%=rs.getString("college_courses")%> </td>
                            <td><%=rs.getString("college_type")%> </td>
                            <td><%=rs.getString("college_affiliation")%> </td>
                            <td><%=rs.getString("college_info")%> </td>
                            <td><a href="#"><%=rs.getString("college_site")%> </a>
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

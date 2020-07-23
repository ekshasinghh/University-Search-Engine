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
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <table border="1">
            <tr>
                <th>id</th>
                <th>UserName</th>
                <th>Password</th>
            </tr>
            <%
                try{
                    //database connection
                    Class.forName("com.mysql.jdbc.Driver"); //static keyword...first word capital
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root" , "mysql");
                                                    //protocol //sub protocol //local//port number//   //username  //password
                                         
        Statement st = con.createStatement();
                    //get username input from index.html
                    String user = request.getParameter("user");
                    String sqlStr = "select * from login where username='"+user+"'";
                    ResultSet rs = st.executeQuery(sqlStr);
                    while(rs.next()){
                        %>
                        <tr>
                            <td><%=rs.getInt("id")%> </td>
                            <td><%=rs.getString("username")%> </td>
                            <td><%=rs.getString("password")%> </td>
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

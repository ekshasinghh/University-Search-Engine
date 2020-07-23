<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<center>
    <br>
<%
String user=request.getParameter("userid");
session.setAttribute("userid",user);
String pass=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/colleges","root","mysql");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users where userid='"+user+"' and password='"+pass+"'");
try{
    rs.next();
if(rs.getString("password").equals(pass) && rs.getString("userid").equals(user))
{
out.println("Welcome " +user+"! <br> Go to <a href='Index.html'>Home Page</a> to continue.");
}
else{
out.println("Invalid password or username.");
}
}
catch (Exception e) {
e.printStackTrace();
}
%>
</center>
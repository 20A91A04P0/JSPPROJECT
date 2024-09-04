<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("guestname");
String phone=request.getParameter("phone");
String Roomno=request.getParameter("roomnumber");
String aadhar=request.getParameter("aadhar");
String checkindate=request.getParameter("checkin");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/novoteljsp","root","Sumanth#414");
String query="insert into guest(guestname,mobile,roomno,aadhar,checkin) values (?,?,?,?,?)";
PreparedStatement pre=con.prepareStatement(query);
pre.setString(1, name);
pre.setString(2, phone);
pre.setString(3, Roomno);
pre.setString(4, aadhar);
pre.setString(5, checkindate);
int a=pre.executeUpdate();
if(a!=0){
	%>
	<%="Data inserted successfully......!" %>
	<% 
}
else{
	%>
	<%="Data not inserted " %>
	<%
	con.close();
}
%>
</body>
</html>
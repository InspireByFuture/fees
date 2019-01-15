<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<h1>
Master Assign Subject</h1></center>
<div align="center">
<form method="post" name="form">
Select Class:&nbsp;
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3307/fees" user="root" password="gandharv"/>
<sql:query var="result" dataSource="${ds}">
select name from master
</sql:query>
<select name="class">
<c:forEach items="${result.rows }" var="row">
<option value="${row.name }"<c:if test="${row.name eq selectedname}">selected="selected"</c:if>>${row.name}</option>
</c:forEach></select>
<br><br>
Select Subject:&nbsp;
<sql:query var="subject" dataSource="${ds}">
select sub_name from subject
</sql:query>
<select name="subject">
<c:forEach items="${subject.rows }" var="row">
<option value="${row.sub_name }"<c:if test="${row.sub_name eq selectedsub_name}">selected="selected"</c:if>>${row.sub_name}</option>
</c:forEach></select>
<input type="submit" name="Save" value="Save">
<table>
<tr>
<th>Class Name</th>
<th>Subject Name</th>
</tr>
<sql:update var="insert" dataSource="${ds }">
insert
</sql:update>
</table>
</form>
</div>
</body>
</html>
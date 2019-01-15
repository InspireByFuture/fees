<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<html>
<head>
<script language= javascript>
function deleteRecord(id){
	var id=document.getElementById("name").value;
    var f=document.form;
    f.method="post";
    f.action='delete_subject.jsp?id='+id;
    f.submit();
}
function addRecord(){
	var id=document.getElementById("name").value;
    var f=document.form;
    f.method="post";
    f.action='add_subject.jsp?id='+id;
    f.submit();
}
</script>

<style>
	body {
		background-image: url("/Fees Management/WebContent/WEB-INF/b.jpg") no-repeat center center fixed;
		background-size: cover;
		height: 100%;
		width:100%;
		overflow: hidden;
		}
		
	h1{
		float:center;
		color:#990012;
		
	}
	
	input#session{
		 font-size:12px; font-weight: bold; display: block; width:150px;
		margin:0 910px;
		
	}
	
	#name{
	position:absolute;
	margin:0 650px;
	color:#151b5;
	}
	.table { 
	position:absolute;
	height:50px;
	overflow-y:scroll;
	border-collapse: collapse;
	border: 1px solid #333;
	padding: 0;
  	margin: 0 500px;
  	border-color:;
  	border-collapse: collapse;
  	font-family: "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
  	color: #000;
  	background: #bcd0e4 url("back.jpg") top left repeat-x;
	font-size:15px;
	color:#493d26;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
	width:450px;
	 }
	.table th, td { padding: 0.5em;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
		border: 1px dotted #666;
  text-align: center;
  color: #632a39;
	 }
	 .table td{
	 	background-color:#fff;	
	 }
	 .table th{
	 background-color:#e55451;
	 color:#fff;
	 }

.table tr:hover th[scope=row], .table tr:hover td
{ 
  background-color: #98afc7;
  color: #fff;
} 
.button{
	background-color:#4863a0;
	color:#fff;
  	font-weight: bold;
  	font-size: 15px;
  	text-transform: uppercase;
	vertical-align:bottom;
	}
	
#but{
position: absolute;
  margin:250 630px;
  width: 50%;
align:center;	
}

#label{
	position:absolute;
	margin:0 850px;
	text-color:#151b54;
}
		
</style>


</head>
<body background="b.jpg">
<center>
<h1>Master Subject</h1></center>
<div id="form">
<form method="post" name="form">
<label id="label">Session:</label>
<input type="number" id="session" placeholder="2019-2020">
<br><input type="text" id="name" placeholder="Enter Subject Name" align="center">
<table border="1" class="table">
<tr><th>S.No</th><th>Class Name</th></tr>
<%
Connection con = null;
String url = "jdbc:mysql://localhost:3307/";
String db = "fees";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="gandharv";

Statement st;
try{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
String query = "select * from subject";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>

<% while(rs.next()){
%>
<tr>
<td><%=rs.getInt("sno") %></td>
<td><%=rs.getString("sub_name") %></td>
</tr>
<%
}
 con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
<brr><br><br><div id=but>
<input type="button" class="button" name="add" value="Add"  onclick="addRecord();" >
<input type="reset"  class="button" name="clear" value="Clear">
<input type="button" class="button" name="delete" value="Delete" onclick="deleteRecord();" >
<input type="button" class="button" name="exit" value="Exit" onclick="javascript:window.close()">

</div>
</table>
</form>
</body>
</html>

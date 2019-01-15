<%@page import="java.sql.*"%>
<%

String id=request.getParameter("id");
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/fees", "root", "gandharv");
Statement st = conn.createStatement();
st.executeUpdate("insert into subject(sub_name) values('"+id+"')");
//response.sendRedirect("/Fees Management/WebContent/master.jsp");
}
catch(Exception e){}
%>
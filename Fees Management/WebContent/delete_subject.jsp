<%@page import="java.sql.*"%>
<%

String no=request.getParameter("id");
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/fees", "root", "gandharv");
Statement st = conn.createStatement();
st.executeUpdate("DELETE FROM subject WHERE sub_name = '"+no+"'");
//response.sendRedirect("/Fees Management/WebContent/master.jsp");
}
catch(Exception e){}
%>
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
int t=0;
String cn=request.getParameter("un");
try{
Connection con=null;
Statement stmt=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sound","root","seetha");
stmt=con.createStatement();
String s="select * from cus where cname='"+cn+"'";
ResultSet rs=stmt.executeQuery(s);
out.println("<html><body>");
while(rs.next())
{
	t+=rs.getInt("tp");
	out.println("item name \n:"+rs.getString("iname"));
	out.println("price :"+rs.getInt("tp")+"<br>");

}
	out.println("<br>Total :"+t);
}
catch(Exception e){}
%>

		
<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html><body>

<form action="pur.jsp">
Enter itemname :<input type="text" name="iname" />
Enter quality  :<input type="text" name="qty"  />
<input type="hidden" name="un" value="${param.un}" />
<%
String cn=request.getParameter("un");
String n=request.getParameter("iname");
String iqq=request.getParameter("qty");

int t=0;
try{
	int iq=Integer.valueOf(iqq);
Connection con=null;
PreparedStatement ps=null;
Statement stmt=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sound","root","seetha");
stmt=con.createStatement();
String s="select * from item";
ResultSet rs=stmt.executeQuery(s);
while(rs.next())
{
	if(rs.getString("name").equals(n))
	{
		int d=rs.getInt("qty");
		int diff=d-iq;
		if(diff>=0)
		{
			s="update item set qty="+diff+" where name='"+rs.getString("name")+"';";
			out.println("Total price :"+(iq*rs.getInt("price")));
	 t=iq*rs.getInt("price");
		}
	}
}
stmt.executeUpdate(s);

s="insert into cus values(?,?,?)";
ps=con.prepareStatement(s);
ps.setString(1,cn);
ps.setString(2,n);
ps.setInt(3,t);
ps.execute();
}
catch (Exception e){
	out.println("no stock ");
	
}	

%>
	<input type="submit" value="add" />
	</form>	

<form action="bi.jsp">
<input type="hidden" name="un" value="${param.un}" />
<input type="submit" value="finish" /> 

</form>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<style>
p
{
	position:absolute;
	top:50px;
	left:500px;
	color:green;
}
#s
{
		position:absolute;
	top:150px;
	left:500px;
	border-radius:50%;
	color:white;
	background-color:green;
	padding:10px;
}
</style>
<body style="text-align:center; font-size:30px;"> 
<p>welcome <c:out value="${param.uname}" /></p>
<form action="pur.jsp" >
<input type="hidden" name="un" value="${param.uname}" /><br><br>
<input type="submit" value="purchase" id="s" />
</form>
</body>
</html>
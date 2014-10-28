<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome to World Manager</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<table style="width:100%">
		<tr>
			<td style="width:25%;height:80%;" valign="top">
				<%@ include file="navbar.jsp" %>
			</td>
			<td style="width:75%;height:80%;">
				<h1>Sessions aren't allowed here!</h1>
				<%
					try {
						HttpSession s = request.getSession();
						String uid = (String)s.getAttribute("uid");
						out.println("Hello <strong>" + uid + "!");
						
					} catch (Exception e) {
						out.println("Could not access the Session.");
					}
				  %>
			</td>
		</tr>
	</table>
	<jsp:include page="footer.jsp" />
</body>
</html>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome to the World Manager</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%! 
		Cookie[] MyCookies;
		String uid = "";
		String pwd = "";
		int authLevel = 0;
	%>
	<table style="width:100%">
		<tr>
			<td style="width:25%;height:80%;" valign="top">
				<%@ include file="navbar.jsp" %>
			</td>
			<td style="width:75%;height:80%;">
			<% 
				if (session.getAttribute("uid") == null || session.getAttribute("uid").equals("")) {
					MyCookies = request.getCookies();
					if (MyCookies != null) {
						for (Cookie c : MyCookies) {
							if (c.getName().equalsIgnoreCase("credentials_uid")) {
								uid = c.getValue();
							}
							else if (c.getName().equalsIgnoreCase("credentials_pwd")) {
								pwd = c.getValue();
							}
						}
					}
				}
				else {
					uid = (String)session.getAttribute("uid");
					pwd = (String)session.getAttribute("pwd");
				}
			
			%>
				<form id="form1" method="post" action="loginuser.do">
					<table style="width:450px;">
						<tr>
							<td>
								<span>UserName:</span>
							</td>
							<td>
								<input name="uid" type="text" style="width:250px" value="<%=uid%>"/>
							</td>
						</tr>
						<tr>
							<td>
								<span>Password:</span>
							</td>
							<td>
								<input name="pwd" type="password" style="width:250px;" value="<%=pwd%>"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input name="noSession" type="checkbox">&nbsp; No Session
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input type="submit" value="Sign In" style="width:250px;" >
							</td>
						</tr>
					</table>
			</td>
		</tr>
	</table>
</body>
</html>
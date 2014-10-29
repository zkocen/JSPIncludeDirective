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
	<table style="width:100%;">
		<tr>
			<td style="width:25%;height:80%;" valign="top">
				<%@ include file="navbar.jsp" %>
			</td>
			<td style="width:75%;height:80%;">
				<% 
					String dbUIDFail = (pageContext.getAttribute("dbuserid", pageContext.APPLICATION_SCOPE) == null ? "bad" :
						(String)pageContext.getAttribute("dbuserid", pageContext.APPLICATION_SCOPE));
					String dbUIDSuccess = (application.getInitParameter("dbuserid") == null ? "bad" :
						application.getInitParameter("dbuserid"));
					
					String uid = (pageContext.getAttribute("uid", pageContext.SESSION_SCOPE) == null ? "bad" :
						(String)pageContext.getAttribute("uid", pageContext.SESSION_SCOPE));
					String sessionCode = (pageContext.getAttribute("SessionCode", pageContext.SESSION_SCOPE) == null ? "bad" :
						(String)pageContext.getAttribute("SessionCode", pageContext.SESSION_SCOPE));
					
					String scode = (pageContext.getAttribute("SecretCode", pageContext.APPLICATION_SCOPE) == null ? "bad" :
						(String)pageContext.getAttribute("SecretCode", pageContext.APPLICATION_SCOPE));
					String acode = (pageContext.getAttribute("AnotherCode", pageContext.REQUEST_SCOPE) == null ? "bad" :
						(String)pageContext.getAttribute("AnotherCode", pageContext.REQUEST_SCOPE));
					
					String pcode = (pageContext.getAttribute("key", pageContext.REQUEST_SCOPE) == null ? "bad" :
						(String)pageContext.getAttribute("key", pageContext.REQUEST_SCOPE));
					String pcode2 = request.getParameter("key");
					
					String lcode = (pageContext.getAttribute("LostCode") == null ? "bad" :
						(String)pageContext.getAttribute("LostCode"));
				%>
			</td>
		</tr>
	</table style="width:100%;" border="1">
</body>
</html>
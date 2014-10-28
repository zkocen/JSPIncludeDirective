<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome to the World Manager</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<table style="width:100%">
		<tr>
			<td style="width:25%;height:80%;" valign="top">
				<%@ include file="navbar.jsp" %>
			</td>
			<td style="width:75%;height:80%;">
				<%! 
					Calendar gc = GregorianCalendar.getInstance();
					String hour = String.format("%s", gc.get(Calendar.HOUR));
					String min = String.format("%s", gc.get(Calendar.MINUTE));
					String sec = String.format("%s", gc.get(Calendar.SECOND));
					Random r = new Random(gc.getTimeInMillis());
				%>
				<% 
					if(hour.length() < 2) hour = String.format("0%s", hour);
					if(min.length() < 2) min = String.format("0%s", min);
					if(sec.length() < 2) min = String.format("0%s", sec);
					
					out.println("Current Time: <h1>" + hour + ":" + min + ":" + sec + "</h1>");
					out.println("Your lucky number for today is: <h2>" + r.nextInt() + "</h2>");
				%>
			</td>
		</tr>
	</table>
</body>
</html>
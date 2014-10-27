<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.worldmanager.dbhelpers.*
            , com.worldmanager.dbmodels.*
            , java.sql.*" %>
            
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome to world manager</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<table style="width:100%;">
		<tr>
			<td style="width:25%; height:80%;" valign="top">
				<%@ include file="navbar.jsp"  %>
			</td>
			<td style="width:75%; height:80%;">
			
			<%  DBManager dbm = (DBManager)application.getAttribute("WorldDBManager"); 
				StringBuilder sb = new StringBuilder("<html><body>");
				try {
					if(!dbm.isConnected()) {
						if(!dbm.openConnection()) {
							sb.append("Could not connect to database...");
						}
					}
					
					sb.append("<table><border=1>"
							   + "<tr><td>ID</td>"
							   + "<td>NAME</tr>"
							   + "<td>COUNTRY_CODE</tr>"
							   + "<td>POPULATION</tr></tr>");
					
					///true mvc error here this should not be on this page
					
					String query = DBWorldQueries.getCitiesByDistrictByPopulation();
					ResultSet rs = dbm.ExecuteResultSet(query);
					while (rs.next()) {
						int id = rs.getInt("ID");
						String name = rs.getString("Name");
						String ctry = rs.getString("CountryCode");
						String dist = rs.getString("District");
						int pop = rs.getInt("Population");
					
						sb.append("<td><tr>" + id + "</td>"
								+ "<td>" + name + "</td>"
								+ "<td>" + ctry + "</td>"
								+ "<td>" + dist + "</td>"
								+ "<td>" + pop + "</td></tr>");
					}
					sb.append("</table>");
				}
				catch(Exception e) {
					sb.append("error " + e.getMessage() );
				}
				sb.append("</body></html>");
			%>
			 
			</td>
		</tr>
	</table>

</body>
</html>
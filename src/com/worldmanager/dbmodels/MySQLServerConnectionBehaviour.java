package com.worldmanager.dbmodels;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLServerConnectionBehaviour extends DBUserInfo implements ServerConnectionBehaviour {

	public MySQLServerConnectionBehaviour() {
		super();
	}
	
	public MySQLServerConnectionBehaviour(String uid, String pwd, String cat){
		super(uid, pwd, cat);
	}
	
	@Override
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection cn = DriverManager.getConnection(getConnectionURL());
			return cn;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String getConnectionURL() {
		return String.format("jdbc:mysql://localhost/world?user=root&password=presta2134");//, getUseID(), getPassword(), getCatalog());
	}

	@Override
	public String getConnectionDetails() {
		return "MySQL Database connection to " + getCatalog();
	}

	@Override
	public String getTablesSchemaQuery() {
		return "select table_name from information_schema.tables"
				+ "where table_schema = " + getCatalog();
	}

}
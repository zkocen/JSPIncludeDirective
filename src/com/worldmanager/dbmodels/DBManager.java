package com.worldmanager.dbmodels;

import java.io.Serializable;
import java.sql.*;

import com.mysql.jdbc.Statement;

public class DBManager implements Serializable{
	private static final long serialVersionUID = 1L;
	Connection cn = null;
	ServerConnectionBehaviour scb = null;
	
	public DBManager(){}
	
	public DBManager(ServerConnectionBehaviour cnBehaviour) {
		scb = cnBehaviour;
	}
	
	public boolean setConnectionBehaviour(ServerConnectionBehaviour value) {
		if (value == null) {
			throw new IllegalArgumentException("Please use a valid connection behaviour");
		}
		scb = value;
		return true;
	}
	
	public boolean openConnection() {
		try {
			if (scb == null) {
				throw new IllegalArgumentException("Define a connection behaviour.");
			}
			if (cn != null) closeConnection(false);
			cn = scb.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean closeConnection(boolean keepAlive) {
		try {
			if (cn != null) {
				if (!cn.isClosed()) {
					cn.close();
				}
			}
			if (!keepAlive) {
				cn = null;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean isConnected(){
		return cn != null;
	}
	
	public boolean ExecuteNonQuery(String query) {
		try {
			Statement st = (Statement) cn.createStatement();
			int i = st.executeUpdate(query);
			if (i == -1) {
				return false;
			}
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public ResultSet ExecuteResultSet(String query) throws SQLException {
		PreparedStatement st = cn.prepareStatement(query);
		ResultSet rs = st.executeQuery();
		return rs;
	}
	
	public Connection getConnection() {
		return cn;
	}
	
	public String getConnectionURL() {
		return scb.getConnectionURL();
	}
	
	public String getTablesSchemaQuery() {
		return scb.getTablesSchemaQuery();
	}
}

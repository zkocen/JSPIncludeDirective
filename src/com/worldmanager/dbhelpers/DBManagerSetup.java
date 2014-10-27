package com.worldmanager.dbhelpers;

import javax.servlet.*;

import com.worldmanager.dbmodels.DBManager;
import com.worldmanager.dbmodels.MySQLServerConnectionBehaviour;
import com.worldmanager.dbmodels.ServerConnectionBehaviour;

public class DBManagerSetup implements ServletContextListener {
	private DBManager dbm = null;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		if (dbm != null) {
			if (dbm.isConnected()) {
				dbm.closeConnection(false);
			}
		}
		dbm = null;
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		String uid = sc.getInitParameter("dbuserid");
		String pwd = sc.getInitParameter("dbuserpwd");
		String cat = sc.getInitParameter("dbinitcat");

		ServerConnectionBehaviour scb = new MySQLServerConnectionBehaviour(uid,
				pwd, cat);

		dbm = new DBManager(scb);

		sc.setAttribute("WorldDBManager", dbm);

	    System.out.println("WorldDBManager created and added to context");
	}
}

package com.worldmanager.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/loginuser.do")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUser() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		int authLevel = 1;
		
		HttpSession s = request.getSession();
		s.setAttribute("uid", uid);
		s.setAttribute("pwd", pwd);
		s.setAttribute("authlevel", authLevel);
		
		String destination = "listCities.jsp";
		if (request.getAttribute("dest") != null) {
			destination = (String)request.getAttribute("dest");
		}
		if (destination != null && destination.equals("listcities")) {
			destination = "listCities.jsp";
		}
		if (request.getParameter("rememberMe") != null) {
			String rememberMe = request.getParameter("rememberMe");
			if (rememberMe.equalsIgnoreCase("ON")) {
				int cookieLife = 3600*24*7;
				Cookie uidCook = new Cookie("credentials_uid", uid);
				uidCook.setMaxAge(cookieLife);
				response.addCookie(uidCook);
				Cookie pwdCook = new Cookie("credentials_pwd", pwd);
				pwdCook.setMaxAge(cookieLife);
				response.addCookie(pwdCook);
			}
		}
		if (authLevel < 1 || uid == null || uid == "") {
			response.sendRedirect(response.encodeRedirectURL("login.jsp"));
		} else {
			response.sendRedirect(response.encodeRedirectURL(destination));
		}
	}

}

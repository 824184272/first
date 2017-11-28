package com.snnu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginoutServlet
 */
@WebServlet("/LoginoutServlet")
public class LoginoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("username");
	    session.invalidate();
	    /*PrintWriter out = response.getWriter();
	    out.println(1);*/
	    String path = request.getContextPath();
	    int port = request.getServerPort();
	    String basePath  = null;
	    if(port==80){
	        basePath = request.getScheme()+"://"+request.getServerName()+path;
	    }else{
	        basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	    }
	    response.sendRedirect(basePath + "/index.jsp");
	}

}

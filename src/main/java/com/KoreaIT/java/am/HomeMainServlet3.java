package com.KoreaIT.java.am;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home/printDan")
public class HomeMainServlet3 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF8");
		
		String inputDan = request.getParameter("dan") == null ? "1" : request.getParameter("dan");
		String inputLimit = request.getParameter("limit") == null ? "9" : request.getParameter("limit");
		String inputColor = request.getParameter("color") == null ? "black" : request.getParameter("color");
		
		int dan = Integer.parseInt(inputDan);
		int limit = Integer.parseInt(inputLimit);
		
		response.getWriter().append(String.format("<div style=\"color: %s;\">== %d 단 ==</div>", inputColor, dan));
		for(int i = 1; i <= limit; i++) {
			response.getWriter().append(String.format("<div style=\"color: %s;\">%d * %d = %d</div>", inputColor, dan, i, dan *i));
		}
	}
}

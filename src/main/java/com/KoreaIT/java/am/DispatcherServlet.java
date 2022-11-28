package com.KoreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import com.KoreaIT.java.am.config.Config;
import com.KoreaIT.java.am.controller.ArticleController;
import com.KoreaIT.java.am.exception.SQLErrorException;
import com.KoreaIT.java.am.util.DBUtil;
import com.KoreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/s/*")
public class DispatcherServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 관련 세팅
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// URL 검증
		String requestUri = request.getRequestURI();
		String[] requestUriBits = requestUri.split("/");
		
		if(requestUriBits.length < 5) {
			response.getWriter().append("올바른 요청이 아닙니다.");
			return;
		}
		
		Connection conn = null;
		
		try {
			Class.forName(Config.getDBDriverClassName() );
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로딩 실패");
		}

		try {
			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUser(), Config.getDBPassword() );
			
			// 로그인 정보 전송
			HttpSession session = request.getSession();
			
			boolean isLogined = false;
			int loginedMemberId = -1;
			String loginedMemberName = (String) session.getAttribute("loginedMemberName");
			
			if(session.getAttribute("loginedMemberLoginId") != null) {
				isLogined = true;
				loginedMemberId = (int)session.getAttribute("loginedMemberId");
			}
			
			request.setAttribute("isLogined", isLogined);
			request.setAttribute("loginedMemberId", loginedMemberId);
			request.setAttribute("loginedMemberName", loginedMemberName);
			
			// 분기에 따른 전송
			String controllerName = requestUriBits[3];
			String actionMethodName = requestUriBits[4];
			
			if(controllerName.equals("article")) {
				ArticleController articleController = new ArticleController(request, response, conn);
				
				if(actionMethodName.equals("list")) {
					articleController.showList();
				}
			}
			
		} catch (SQLException e) {
			System.out.println("DB 접속 에러 : " + e);
		} catch (SQLErrorException e) {
			e.getOrigin().printStackTrace();
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

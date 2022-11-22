package com.KoreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.KoreaIT.java.am.util.DBUtil;
import com.KoreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/list")
public class ArticleListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로딩 실패");
		}

		String url = "jdbc:mysql://localhost:3306/JSPTest?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeNehavior=convertToNull";
		String user = "root";
		String pw = "";

		try {
			conn = DriverManager.getConnection(url, user, pw);
			
			SecSql sql = new SecSql();
			
			sql.append("SELECT * FROM article");
			
			List<Map<String, Object>> articleRows = DBUtil.selectRows(conn, sql);
			
			request.setAttribute("articleRows", articleRows);	// request에 담아서 보냄 (key, val) 형식으로 보냄
			request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
			
		} catch (SQLException e) {
			System.out.println("DB 접속 에러 : " + e);
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
}

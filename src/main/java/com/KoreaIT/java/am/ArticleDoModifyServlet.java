package com.KoreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.KoreaIT.java.am.util.DBUtil;
import com.KoreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/doModify")
public class ArticleDoModifyServlet extends HttpServlet {
	@Override
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
			
			// 게시글 수정
			int id = Integer.parseInt(request.getParameter("id"));
			String title = request.getParameter("title");
			String body = request.getParameter("body");

			SecSql sql = SecSql.from("UPDATE article");
			sql.append("SET title = ?", title);
			sql.append(", `body` = ?", body);
			sql.append("WHERE id = ?", id);
			
			DBUtil.update(conn, sql);
			
			response.getWriter().append(String.format("<script>alert('%d번 게시글 수정 완료!'); location.replace('detail?id=%d');</script>)", id, id));
			
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
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

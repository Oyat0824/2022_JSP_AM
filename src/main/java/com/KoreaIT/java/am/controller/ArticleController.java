package com.KoreaIT.java.am.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.KoreaIT.java.am.dto.Article;
import com.KoreaIT.java.am.service.ArticleService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ArticleController {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ArticleService articleService;
	
	public ArticleController(HttpServletRequest request, HttpServletResponse response, Connection conn) {
		this.request = request;
		this.response = response;
		articleService = new ArticleService(conn);
	}
	
	// 리스트
	public void showList() throws ServletException, IOException {
		// 페이지 파라미터 관련
		int page = 1;
		
		if (request.getParameter("page") != null && request.getParameter("page").length() != 0) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 전체 페이지 수 구하기
		int totalPage = articleService.getListTotalPage();
		// 보여줄 게시글 구하기
		List<Article> articles = articleService.getArticles(page);
		
		// 리퀘스트에 담아서 보내기
		request.setAttribute("page", page);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("articles", articles);	// request에 담아서 보냄 (key, val) 형식으로 보냄
		request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
	}
	
}

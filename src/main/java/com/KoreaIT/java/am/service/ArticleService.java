package com.KoreaIT.java.am.service;

import java.sql.Connection;
import java.util.List;

import com.KoreaIT.java.am.dao.ArticleDao;
import com.KoreaIT.java.am.dto.Article;

public class ArticleService {
	private int itemsInAPage;
	private ArticleDao articleDao;

	public ArticleService(Connection conn) {
		itemsInAPage = 10;
		articleDao = new ArticleDao(conn);
	}

	// 개시글 페지이 구하기
	public int getListTotalPage() {
		int totalCount = articleDao.getListTotalCount();
		int totalPage = (int) Math.ceil((double) totalCount / itemsInAPage);

		return totalPage;
	}

	// 게시글 목록 가져오기
	public List<Article> getArticles(int page) {
		int limitFrom = (page - 1) * itemsInAPage;

		return articleDao.getArticles(limitFrom, itemsInAPage);
	}

}

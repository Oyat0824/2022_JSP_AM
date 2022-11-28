package com.KoreaIT.java.am.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.KoreaIT.java.am.util.DBUtil;
import com.KoreaIT.java.am.util.SecSql;

public class ArticleService {
	private Connection conn;
	private int itemsInAPage;

	public ArticleService(Connection conn) {
		this.conn = conn;
		itemsInAPage = 10;
	}

	public int getListTotalPage() {
		// 게시글 개수
		SecSql sql = SecSql.from("SELECT COUNT(id)");
		sql.append("FROM article");

		// 개시글 개수에 따른 페이지 수 구하기
		int totalCount = DBUtil.selectRowIntValue(conn, sql);
		int totalPage = (int) Math.ceil((double) totalCount / itemsInAPage);

		return totalPage;
	}

	public List<Map<String, Object>> getArticleRows(int page) {
		int limitFrom = (page - 1) * itemsInAPage;

		// 게시글 목록 가져오기
		SecSql sql = SecSql.from("SELECT A.*, M.name AS WriterName");
		sql.append("FROM article AS A");
		sql.append("INNER JOIN `member` AS M");
		sql.append("ON A.memberId = M.id");
		sql.append("ORDER BY A.id DESC");
		sql.append("LIMIT ?, ?", limitFrom, itemsInAPage);

		return DBUtil.selectRows(conn, sql);
	}

}

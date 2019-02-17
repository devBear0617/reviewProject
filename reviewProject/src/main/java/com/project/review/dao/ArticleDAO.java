package com.project.review.dao;


import com.project.review.vo.Article;

public interface ArticleDAO {
	Article findOne(int id);
    int save(Article article);
}

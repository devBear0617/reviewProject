package com.project.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.review.dao.ArticleDAO;
import com.project.review.vo.Article;

@Controller
@RequestMapping("/article")
public class Article_controller {
    
    @Autowired
    private ArticleDAO articleDAO;
    
    @GetMapping("/{id}")
    public String findOne(@PathVariable("id") int id, Model model) {
        Article article = articleDAO.findOne(id);
        model.addAttribute("article", article);
        return "editor/article";
    }

    @GetMapping("create")
    public String createArticle(Model model) {
        Article article = new Article();
        model.addAttribute("article", article);
        return "editor/new";
    }

    @PostMapping("create")
    public String createArticle(Article article, Model model) {
        articleDAO.save(article);
        model.addAttribute("id", article.getId());
        return "editor/success";
    }
}
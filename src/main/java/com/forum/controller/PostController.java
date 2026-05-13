package com.forum.controller;

import com.forum.model.Post;
import com.forum.model.Reply;
import com.forum.model.User;
import com.forum.service.PostService;
import com.forum.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/post")
public class PostController {


    @Autowired
    private PostService postService;

    @Autowired
    private ReplyService replyService;

    @GetMapping("/list")
    public String list(Model model, @RequestParam(required = false) String keyword) {
        List<Post> posts;
        if (keyword != null && !keyword.trim().isEmpty()) {
            posts = postService.searchPosts(keyword);
            model.addAttribute("keyword", keyword);
        } else {
            posts = postService.getAllPosts();
        }
        model.addAttribute("posts", posts);
        return "post/list";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        Post post = postService.getPostById(id);
        List<Reply> replies = replyService.getRepliesByPostId(id);
        model.addAttribute("post", post);
        model.addAttribute("replies", replies);
        return "post/detail";
    }

    @GetMapping("/add")
    public String toAdd(HttpSession session) {
        if (session.getAttribute("loginUser") == null) {
            return "redirect:/user/login";
        }
        return "post/add";
    }


    @PostMapping("/add")
    public String add(Post post, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        post.setUserId(user.getId());
        postService.createPost(post);
        return "redirect:/post/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        Post post = postService.getPostById(id);
        if (post != null && post.getUserId().equals(user.getId())) {
            postService.deletePost(id);
        }
        return "redirect:/post/list";
    }
}
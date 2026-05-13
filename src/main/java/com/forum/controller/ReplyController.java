package com.forum.controller;


import com.forum.model.Reply;
import com.forum.model.User;
import com.forum.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/reply")
public class ReplyController {


    @Autowired
    private ReplyService replyService;


    @PostMapping("/add")
    public String add(Reply reply, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        reply.setUserId(user.getId());
        replyService.addReply(reply);
        return "redirect:/post/detail/" + reply.getPostId();
    }

    @GetMapping("/delete/{id}/{postId}")
    public String delete(@PathVariable Long id, @PathVariable Long postId, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        replyService.deleteReply(id);
        return "redirect:/post/detail/" + postId;
    }
}
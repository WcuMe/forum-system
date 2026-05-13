package com.forum.controller;

import com.forum.model.User;
import com.forum.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String toRegister() {
        return "user/register";
    }

    @PostMapping("/register")
    public String register(User user, Model model) {
        if (userService.getUserByUsername(user.getUsername()) != null) {
            model.addAttribute("error", "用户名已存在");
            return "user/register";
        }
        if (userService.register(user)) {
            return "redirect:/user/login";
        }
        model.addAttribute("error", "注册失败");
        return "user/register";
    }

    @GetMapping("/login")
    public String toLogin() {
        return "user/login";
    }

    @PostMapping("/login")
    public String login(String username, String password, HttpSession session, Model model) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("loginUser", user);
            return "redirect:/post/list";
        }
        model.addAttribute("error", "用户名或密码错误");
        return "user/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/login";
    }
}
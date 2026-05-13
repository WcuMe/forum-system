package com.forum.service;


import com.forum.mapper.UserMapper;
import com.forum.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User login(String username, String password) {
        return userMapper.login(username, password);
    }


    public User getUserById(Long id) {
        return userMapper.selectById(id);
    }

    public User getUserByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Transactional
    public boolean register(User user) {
        if (userMapper.selectByUsername(user.getUsername()) != null) {
            return false;
        }
        return userMapper.insert(user) > 0;
    }
}
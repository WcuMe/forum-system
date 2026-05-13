package com.forum.service;


import com.forum.mapper.PostMapper;
import com.forum.model.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;


@Service
public class PostService {


    @Autowired
    private PostMapper postMapper;


    public List<Post> getAllPosts() {
        return postMapper.selectAll();
    }

    public Post getPostById(Long id) {
        return postMapper.selectById(id);
    }

    public List<Post> searchPosts(String keyword) {
        return postMapper.searchByKeyword(keyword);
    }

    @Transactional
    public boolean createPost(Post post) {
        return postMapper.insert(post) > 0;
    }

    @Transactional
    public boolean deletePost(Long id) {
        return postMapper.deleteById(id) > 0;
    }
}
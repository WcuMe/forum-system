package com.forum.service;


import com.forum.mapper.ReplyMapper;
import com.forum.model.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class ReplyService {

    @Autowired
    private ReplyMapper replyMapper;

    public List<Reply> getRepliesByPostId(Long postId) {
        return replyMapper.selectByPostId(postId);
    }


    @Transactional
    public boolean addReply(Reply reply) {
        return replyMapper.insert(reply) > 0;
    }


    @Transactional
    public boolean deleteReply(Long id) {
        return replyMapper.deleteById(id) > 0;
    }
}
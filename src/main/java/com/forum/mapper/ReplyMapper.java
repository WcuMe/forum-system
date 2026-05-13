package com.forum.mapper;

import com.forum.model.Reply;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ReplyMapper {
    @Select("SELECT r.*, u.username as author_name FROM reply r " +
            "LEFT JOIN user u ON r.user_id = u.id " +
            "WHERE r.post_id = #{postId} ORDER BY r.created_at ASC")
    List<Reply> selectByPostId(Long postId);

    @Insert("INSERT INTO reply(content, post_id, user_id, created_at) VALUES(#{content}, #{postId}, #{userId}, NOW())")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Reply reply);

    @Delete("DELETE FROM reply WHERE id = #{id}")
    int deleteById(Long id);
}
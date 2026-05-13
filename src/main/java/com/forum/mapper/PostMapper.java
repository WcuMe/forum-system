package com.forum.mapper;

import com.forum.model.Post;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PostMapper {
    @Select("SELECT p.*, u.username as author_name FROM post p LEFT JOIN user u ON p.user_id = u.id ORDER BY p.created_at DESC")
    List<Post> selectAll();

    @Select("SELECT p.*, u.username as author_name FROM post p LEFT JOIN user u ON p.user_id = u.id WHERE p.id = #{id}")
    Post selectById(Long id);


    @Select("SELECT p.*, u.username as author_name FROM post p LEFT JOIN user u ON p.user_id = u.id WHERE p.title LIKE CONCAT('%', #{keyword}, '%') OR p.content LIKE CONCAT('%', #{keyword}, '%') ORDER BY p.created_at DESC")
    List<Post> searchByKeyword(String keyword);

    @Insert("INSERT INTO post(title, content, user_id, created_at) VALUES(#{title}, #{content}, #{userId}, NOW())")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Post post);

    @Delete("DELETE FROM post WHERE id = #{id}")
    int deleteById(Long id);
}
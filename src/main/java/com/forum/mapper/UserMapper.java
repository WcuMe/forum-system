package com.forum.mapper;

import com.forum.model.User;
import org.apache.ibatis.annotations.*;


@Mapper
public interface UserMapper {
    @Select("SELECT * FROM user WHERE id = #{id}")
    User selectById(Long id);


    @Select("SELECT * FROM user WHERE username = #{username}")
    User selectByUsername(String username);

    @Select("SELECT * FROM user WHERE username = #{username} AND password = #{password}")
    User login(@Param("username") String username, @Param("password") String password);

    @Insert("INSERT INTO user(username, password, email, created_at) VALUES(#{username}, #{password}, #{email}, NOW())")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(User user);
}
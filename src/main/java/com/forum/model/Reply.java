package com.forum.model;

import java.io.Serializable;
import java.util.Date;

public class Reply implements Serializable {
    private Long id;
    private String content;
    private Long postId;
    private Long userId;
    private Date createdAt;
    private String authorName;

    public Reply() {}

    public Reply(String content, Long postId, Long userId) {
        this.content = content;
        this.postId = postId;
        this.userId = userId;
        this.createdAt = new Date();
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public Long getPostId() { return postId; }
    public void setPostId(Long postId) { this.postId = postId; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public String getAuthorName() { return authorName; }
    public void setAuthorName(String authorName) { this.authorName = authorName; }
}
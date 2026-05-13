<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>帖子列表 - 简易论坛系统</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/post/list">简易论坛系统</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="/post/list">帖子列表</a></li>
            <li><a href="/post/add">发布帖子</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#">欢迎，${sessionScope.loginUser.username}</a></li>
            <li><a href="/user/logout">退出登录</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row" style="margin-bottom: 20px;">
        <div class="col-md-8 col-md-offset-2">
            <form action="/post/list" method="get" class="form-inline">
                <div class="form-group">
                    <input type="text" name="keyword" class="form-control" placeholder="搜索帖子标题或内容" value="${keyword}">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
                <a href="/post/list" class="btn btn-link">清除搜索</a>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">帖子列表</div>
                <div class="panel-body">
                    <c:choose>
                        <c:when test="${empty posts}">
                            <p class="text-center text-muted">暂无帖子</p>
                        </c:when>
                        <c:otherwise>
                            <div class="list-group">
                                <c:forEach var="post" items="${posts}">
                                    <a href="/post/detail/${post.id}" class="list-group-item">
                                        <h4 class="list-group-item-heading">${post.title}</h4>
                                        <p class="list-group-item-text">${post.content}</p>
                                        <small class="text-muted">
                                            作者：${post.authorName} &nbsp;|&nbsp;
                                            时间：${post.createdAt}
                                        </small>
                                    </a>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <a href="/post/add" class="btn btn-primary">发布新帖子</a>
        </div>
    </div>
</div>
</body>
</html>
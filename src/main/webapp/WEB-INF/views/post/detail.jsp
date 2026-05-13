<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${post.title} - 简易论坛系统</title>
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
            <li><a href="/post/list">帖子列表</a></li>
            <li><a href="/post/add">发布帖子</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#">欢迎，${sessionScope.loginUser.username}</a></li>
            <li><a href="/user/logout">退出登录</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">${post.title}</h3>
                </div>
                <div class="panel-body">
                    <p>${post.content}</p>
                    <hr>
                    <small class="text-muted">
                        作者：${post.authorName} &nbsp;|&nbsp;
                        发布时间：${post.createdAt}
                    </small>
                    <c:if test="${sessionScope.loginUser.id == post.userId}">
                        <a href="/post/delete/${post.id}" class="btn btn-danger btn-xs pull-right"
                           onclick="return confirm('确定删除该帖子吗？')">删除</a>
                    </c:if>
                </div>
            </div>
            <div class="panel panel-success">
                <div class="panel-heading">回复列表</div>
                <div class="panel-body">
                    <c:choose>
                        <c:when test="${empty replies}">
                            <p class="text-muted">暂无回复</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="reply" items="${replies}">
                                <div class="well well-sm">
                                    <p>${reply.content}</p>
                                    <small class="text-muted">
                                        ${reply.authorName} &nbsp;|&nbsp; ${reply.createdAt}
                                        <c:if test="${sessionScope.loginUser.id == reply.userId}">
                                            <a href="/reply/delete/${reply.id}/${post.id}" class="btn btn-danger btn-xs"
                                               onclick="return confirm('确定删除该回复吗？')">删除</a>
                                        </c:if>
                                    </small>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">发表评论</div>
                <div class="panel-body">
                    <form action="/reply/add" method="post">
                        <input type="hidden" name="postId" value="${post.id}">
                        <div class="form-group">
                            <textarea name="content" class="form-control" rows="3" placeholder="请输入回复内容" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-info">提交回复</button>
                    </form>
                </div>
            </div>
            <a href="/post/list" class="btn btn-default">返回列表</a>
        </div>
    </div>
</div>
</body>
</html>
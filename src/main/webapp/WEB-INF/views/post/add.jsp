<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>发布帖子 - 简易论坛系统</title>
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
            <li class="active"><a href="/post/add">发布帖子</a></li>
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
                    <h3 class="panel-title">发布新帖子</h3>
                </div>
                <div class="panel-body">
                    <form action="/post/add" method="post">
                        <div class="form-group">
                            <label>帖子标题</label>
                            <input type="text" name="title" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>帖子内容</label>
                            <textarea name="content" class="form-control" rows="5" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">发布</button>
                        <a href="/post/list" class="btn btn-default">取消</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
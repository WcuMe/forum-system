<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("loginUser") != null) {
        response.sendRedirect(request.getContextPath() + "/post/list");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>欢迎来到简易论坛系统</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container" style="margin-top: 100px;">
    <div class="jumbotron text-center">
        <h1>简易论坛系统</h1>
        <p>欢迎使用简易论坛系统，请先登录或注册</p>
        <p>
            <a class="btn btn-primary btn-lg" href="/user/login">登录</a>
            <a class="btn btn-success btn-lg" href="/user/register">注册</a>
        </p>
    </div>
</div>
</body>
</html>
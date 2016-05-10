<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 16/4/27
  Time: 下午1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <link href="//cdn.bootcss.com/video.js/5.8.0/alt/video-js-cdn.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="//cdn.bootcss.com/video.js/5.8.0/video.js"></script>

    <!-- jquery-comments文件 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery-comments.css">
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <!-- Data -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/data/comments-data.js"></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-comments.js"></script>

    <style type="text/css">
        body {
            padding: 20px;
            margin: 0px;
            font-size: 14px;
            font-family: "Arial", Georgia, Serif;
        }
    </style>
    <!-- Init jquery-comments -->
    <script type="text/javascript">
        $(function() {
            $('#comments-container').comments({
                profilePictureURL: 'https://viima-app.s3.amazonaws.com/media/user_profiles/user-icon.png',
                roundProfilePictures: true,
                textareaRows: 1,
                enableAttachments: true,
                getComments: function(success, error) {
                    setTimeout(function() {
                        success(commentsArray);
                    }, 500);
                },
                postComment: function(data, success, error) {
                    setTimeout(function() {
                        success(data);
                    }, 500);
                },
                putComment: function(data, success, error) {
                    setTimeout(function() {
                        success(data);
                    }, 500);
                },
                deleteComment: function(data, success, error) {
                    setTimeout(function() {
                        success();
                    }, 500);
                },
                upvoteComment: function(data, success, error) {
                    setTimeout(function() {
                        success(data);
                    }, 500);
                },
                uploadAttachments: function(dataArray, success, error) {
                    setTimeout(function() {
                        success(dataArray);
                    }, 500);
                },
            });
        });
    </script>

<%--让页面在高分辨率的手机上显示正确的尺寸，防止因为屏幕像素高而使得页面元素变得很小--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/navigation.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/bottom.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/video.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/course.css" rel="stylesheet" type="text/css"/>

    <title>视频</title>
</head>
<body>
<div class="top_content">
    <ul>
        <% if (session.getAttribute("username") == null) {
        %>
        <li><a href="<%=request.getContextPath()%>/jsp/user/userLogin.jsp">登录</a></li>
        <li><a href="<%=request.getContextPath()%>/jsp/user/userRegister.jsp">注册</a></li>
        <% } else {
        %>
        <li><a href="<%=request.getContextPath()%>/jsp/user/userHomepage.jsp">我的主页</a></li>
        <li><a href="<%=request.getContextPath()%>/userLogout">退出</a></li>
        <%
            }
        %>
    </ul>
    <div class="top_title">
        欢迎 ${username} 来到 问道视频学习网站
    </div>
</div>
<%--top结束--%>

<div class="logo">
    <div class="logo_left">
        <img src="<%=request.getContextPath()%>/resources/images/wendaologo.png" alt="logoImage">
    </div>
    <div class="logo_middle"><img src="<%=request.getContextPath()%>/resources/images/sunny.png" height="80px"/></div>
    <div class="logo_right">
        <form action="" method="get">
            <div class="search_text">
                <input name="search" type="text" placeholder="请输入搜索内容"/>
                <button name="searchButton" type="button"><i class="glyphicon glyphicon-search"></i></button>
            </div>
        </form>
    </div>
</div>
<div class="top_content">
</div>
<div class="container">
    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-7">
            <div class="video">
                <video id="my_video" class="video-js vjs-default-skin" controls preload="auto"
                       poster="http://video-js.zencoder.com/oceans-clip.png"
                       data-setup="{}">
                    <source src="http://vjs.zencdn.net/v/oceans.mp4" type='video/mp4'/>
                </video>
            </div>
            <div class="comments">
                <div id="comments-container"></div>
                <%--<h4 class="m-t-lg m-b" style="padding-top: 30px">3 Comments</h4>--%>
                <%--<section class="comment-list block">--%>
                <%--<article id="comment-id-1" class="comment-item"><a class="pull-left thumb-sm"> <img--%>
                <%--src="<%=request.getContextPath()%>/resources/images/interest_art_choose.jpg" height="20px" width="20px" class="img-circle"> </a>--%>
                <%--<section class="comment-body m-b">--%>
                <%--<header><a href="#"><strong>John smith</strong></a> <label--%>
                <%--class="label bg-info m-l-xs">Editor</label> <span--%>
                <%--class="text-muted text-xs block m-t-xs"> 24 minutes ago </span>--%>
                <%--</header>--%>
                <%--<div class="m-t-sm">Lorem ipsum dolor sit amet, consectetur adipiscing elit.--%>
                <%--Morbi id neque quam. Aliquam sollicitudin venenatis ipsum ac feugiat.--%>
                <%--Vestibulum.--%>
                <%--</div>--%>
                <%--</section>--%>
                <%--</article>--%>
                <%--<!-- .comment-reply -->--%>
                <%--<article id="comment-id-2" class="comment-item comment-reply"><a--%>
                <%--class="pull-left thumb-sm"> <img src="<%=request.getContextPath()%>/resources/images/interest_art_choose.jpg" height="20px" width="20px" class="img-circle">--%>
                <%--</a>--%>
                <%--<section class="comment-body m-b">--%>
                <%--<header><a href="#"><strong>John smith</strong></a> <label--%>
                <%--class="label bg-dark m-l-xs">Admin</label> <span--%>
                <%--class="text-muted text-xs block m-t-xs"> 26 minutes ago </span>--%>
                <%--</header>--%>
                <%--<div class="m-t-sm">Lorem ipsum dolor sit amet, consecteter adipiscing elit,--%>
                <%--sed diam nonummy nibh euismod tincidunt ut laoreet.--%>
                <%--</div>--%>
                <%--</section>--%>
                <%--</article>--%>
                <%--<!-- / .comment-reply -->--%>
                <%--<article id="comment-id-3" class="comment-item"><a class="pull-left thumb-sm"> <img--%>
                <%--src="<%=request.getContextPath()%>/resources/images/interest_art_choose.jpg" height="20px" width="20px" class="img-circle"> </a>--%>
                <%--<section class="comment-body m-b">--%>
                <%--<header><a href="#"><strong>John smith</strong></a> <label--%>
                <%--class="label bg-dark m-l-xs">Admin</label> <span--%>
                <%--class="text-muted text-xs block m-t-xs"> 26 minutes ago </span>--%>
                <%--</header>--%>
                <%--<blockquote class="m-t"><p>Lorem ipsum dolor sit amet, consectetur--%>
                <%--adipiscing elit. Integer posuere erat a ante.</p>--%>
                <%--<small>Someone famous in <cite title="Source Title">Source Title</cite>--%>
                <%--</small>--%>
                <%--</blockquote>--%>
                <%--<div class="m-t-sm">Lorem ipsum dolor sit amet, consecteter adipiscing elit,--%>
                <%--sed diam nonummy nibh euismod tincidunt ut laoreet.--%>
                <%--</div>--%>
                <%--</section>--%>
                <%--</article>--%>
                <%--</section>--%>
                <%--<h4 class="m-t-lg m-b">Leave a comment</h4>--%>
                <%--<form action="<%=request.getContextPath()%>/addComment" method="post">--%>
                <%--<div class="form-group"><label>Comment</label> <textarea class="form-control"--%>
                <%--rows="5"--%>
                <%--placeholder="Type your comment" name="textarea"></textarea>--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                <%--&lt;%&ndash;<button type="submit" class="btn btn-success">Submit comment</button>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">Ocean</div>
                <div class="panel-body">
                    <p>海洋blablablabla</p>
                </div>
                <!-- List group -->
                <ul class="list-group">
                    <li class="list-group-item"><span type="button" class="glyphicon glyphicon-heart"> 14</span>
                        <span class="glyphicon glyphicon-play-circle"> 15</span></li>
                    <li class="list-group-item">类型：自然</li>
                    <li class="list-group-item"><a href="<%=request.getContextPath()%>/jsp/noteWrite.jsp">创建笔记</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    var myPlayer = videojs('my_video');
    videojs("my_video").ready(function () {
        var myPlayer = this;
        myPlayer.play();
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#comments-container').comments({
            getComments: function (success, error) {
                $.post("<%=request.getContextPath()%>/video/getComment",
                        {
                            videoId: "123"
                        },
                        function (jsonArray) {
                            obj = JSON.parse(jsonArray)
                            success(obj['data']);
                        });
            },
            postComment: function(commentJSON, success, error) {
                $.ajax({
                    type: 'post',
                    url: '<%=request.getContextPath()%>/video/addComment',
                    data: commentJSON,
                    success: function(comment) {
                        success(comment)
                    },
                    error: error
                });
            }

        });
    });

</script>

</html>

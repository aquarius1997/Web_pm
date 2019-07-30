<%--
  Created by IntelliJ IDEA.
  User: Joins
  Date: 2019-07-24
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML>
<!--
Phantom by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>Phantom by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/resources/assets/css/main.css" />
    <noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>

    <style>
        img{
            -ms-transform: rotate(90deg);
            -webkit-transform: rotate(90deg);
            transform: rotate(90deg);
        }
    </style>
</head>
<body class="is-preload">

<!--jQuery를 사용하기 위해 -->
<div id="page-wrapper">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <div class="inner">

            <!-- Logo -->
            <a href="" class="logo">
                <span class="symbol"><img src="/resources/images/logo.svg" alt="" /></span><span class="title">FULL MOON</span>
            </a>

            <!-- Nav -->
            <nav>
                <ul>
                    <li><a href="#menu">Menu</a></li>
                </ul>
            </nav>

        </div>
    </header>

    <!-- Menu -->
    <nav id="menu">
        <h2>Menu</h2>
        <ul>
            <li><a href="">Home</a></li>
<%--            <li><a href="/customLogin">Manager Login</a></li>--%>
            <li><a href="/customLogin">Manager Login</a></li>

        <%--            <li><a href="generic.html">Tempus etiam</a></li>--%>
<%--            <li><a href="generic.html">Consequat dolor</a></li>--%>
<%--            <li><a href="elements.html">Elements</a></li>--%>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <header>
                <h1>FULL MOON에서 8월 상품을 만나보세요<br /></h1>
                <p>가게 안내 메세지 적기</p>
            </header>

            <section class="tiles">

                <c:forEach items="${list}" var="board">

                    <article>
                        <span class="image">
                            <img src="${board.uploadPath}/${board.uuid}_${board.fileName}" alt=""/>
                        </span>
                        <a href="/promotion/details?pm_pno=<c:out value="${board.pm_mno}"/>">
<%--                            <h2><c:out value="${board.fileName}"/></h2>--%>
                        </a>
                    </article>
                </c:forEach>

<%--                <article class="style1">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic01.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details1">--%>

<%--                        <h2>Magna</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style2">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic02.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details2">--%>
<%--                        <h2>Lorem</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style3">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic03.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details3">--%>
<%--                        <h2>Feugiat</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style4">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic04.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details4">--%>
<%--                        <h2>Tempus</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style5">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic05.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details5">--%>
<%--                        <h2>Aliquam</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style6">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic06.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details6">--%>
<%--                        <h2>Veroeros</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style2">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic07.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details7">--%>
<%--                        <h2>Ipsum</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style3">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic08.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details8">--%>
<%--                        <h2>Dolor</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style1">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic09.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details9">--%>
<%--                        <h2>Nullam</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style5">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic10.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details10">--%>
<%--                        <h2>Ultricies</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style6">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic11.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details11">--%>
<%--                        <h2>Dictum</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
<%--                <article class="style4">--%>
<%--									<span class="image">--%>
<%--										<img src="/resources/images/pic12.jpg" alt="" />--%>
<%--									</span>--%>
<%--                    <a href="/promotion/details12">--%>
<%--                        <h2>Pretium</h2>--%>
<%--                        <div class="content">--%>
<%--                            <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </article>--%>
            </section>
        </div>
    </div>

    <!-- Footer -->
    <footer id="footer">
        <div class="inner">
<%--            <section>--%>
<%--                <h2>Get in touch</h2>--%>
<%--                <form method="post" action="#">--%>
<%--                    <div class="fields">--%>
<%--                        <div class="field half">--%>
<%--                            <input type="text" name="name" id="name" placeholder="Name" />--%>
<%--                        </div>--%>
<%--                        <div class="field half">--%>
<%--                            <input type="email" name="email" id="email" placeholder="Email" />--%>
<%--                        </div>--%>
<%--                        <div class="field">--%>
<%--                            <textarea name="message" id="message" placeholder="Message"></textarea>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <ul class="actions">--%>
<%--                        <li><input type="submit" value="Send" class="primary" /></li>--%>
<%--                    </ul>--%>
<%--                </form>--%>
<%--            </section>--%>
            <section>
                <h2>Follow</h2>
                <ul class="icons">
                    <li><a href="#" class="icon brands style2 fa-twitter"><span class="label">Twitter</span></a></li>
                    <li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
                    <li><a href="https://www.instagram.com/aquarius17_02/" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
                    <li><a href="#" class="icon brands style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
                    <li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
                    <li><a href="#" class="icon brands style2 fa-500px"><span class="label">500px</span></a></li>
                    <li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
                    <li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
                </ul>
            </section>
            <ul class="copyright">
                <li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
            </ul>
        </div>
    </footer>

</div>


<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>

</body>
</html>
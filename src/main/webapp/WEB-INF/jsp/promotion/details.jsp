<%--
  Created by IntelliJ IDEA.
  User: Joins
  Date: 2019-07-24
  Time: 오후 3:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Generic - Phantom by HTML5 UP</title>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <div class="inner">

            <!-- Logo -->
            <a href="/promotion" class="logo">
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
            <li><a href="/promotion">Home</a></li>
            <li><a href="">Manager Login</a></li>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <h1><c:out value="${board.pm_title}"/></h1>
<%--            <span class="image main"><img src="/resources/images/${board.uploadPath}" alt="" /></span>--%>

<%--            <span class="image main">--%>
            <span>
            <div class="uploadResult">
                <ul>

                </ul>
            </div>
            </span>
            <!--첨부파일의 데이터를 가져온다-->
            <script>

                $(document).ready(function(){

                    (function(){

                        var pm_mno = '<c:out value="${board.pm_mno}"/>';

                        $.getJSON("/board/getAttachList", {pm_mno: pm_mno}, function(arr){

                            console.log(arr);

                            var str = "";

                            $(arr).each(function(i, attach){

                                //image type
                                if(attach.fileType){
                                    var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);

                                    str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                                    str += "<img width='65%' height='65%' src='/display?fileName="+fileCallPath+"'>";
                                    str += "</div>";
                                    str +"</li>";
                                }else{

                                    str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                                    str += "<span> "+ attach.fileName+"</span><br/>";
                                    str += "<img src='/resources/img/attach.png'></a>";
                                    str += "</div>";
                                    str +"</li>";
                                }

                                // if(attach.fileType){
                                //     str = "<img src='"+attach.uploadPath+"'/'"+attach.uuid+"'_'"+attach.fileName+"'>"
                                // }

                            });

                            $(".uploadResult ul").html(str);
                        }); //end getjson


                    })();//end function
                });
            </script>


            <p><c:out value="${board.pm_text}"/></p>

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
                    <li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
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
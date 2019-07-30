<%--
  Created by IntelliJ IDEA.
  User: Joins
  Date: 2019-07-25
  Time: 오후 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>


<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Read</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Board Read Page</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <div class="form-group">
                    <label>Num.</label> <input class="form-control" name='pm_mno'
                                              value='<c:out value="${board.pm_mno}"/>' readonly="readonly">
                </div>

                <div class="form-group">
                    <label>상품 코드</label><input class="form-control" name="pm_code"
                                               value="<c:out value="${board.pm_code}"/>" readonly="readonly">
                </div>

                <div class="form-group">
                    <label>상품명</label> <input class="form-control" name='pm_title'
                                                value='<c:out value="${board.pm_title}"/>' readonly="readonly">
                </div>

                <div class="form-group">
                    <label>상세설명</label>
                    <textarea class="form-control" rows="10" name='pm_text'
                              readonly="readonly"><c:out value="${board.pm_text}" /></textarea>
                </div>

                <div class="form-group">
                    <label>사입처</label> <input class="form-control" name='pm_buy_p'
                                                 value='<c:out value="${board.pm_buy_p}"/>' readonly="readonly">
                </div>

                <div class="form-group">
                    <label>사입처 전화번호</label> <input class="form-control" name='pm_buy_p'
                                                value='<c:out value="${board.pm_buy_p}"/>' readonly="readonly">
                </div>

                <div class="form-group">
                    <label>현재 수량</label> <input class="form-control" name='pm_num'
                                                   value='<c:out value="${board.pm_num}"/>' readonly="readonly">
                </div>

                <%-- 		<button data-oper='modify' class="btn btn-default">
                        <a href="/board/modify?bno=<c:out value="${board.bno}"/>">Modify</a></button>
                        <button data-oper='list' class="btn btn-info">
                        <a href="/board/list">List</a></button> --%>


                <!-- <button data-oper='modify' class="btn btn-default">Modify</button>
                 -->

                <sec:authentication property="principal" var="pinfo"/>

                <sec:authorize access="isAuthenticated()">

<%--                    <c:if test="${pinfo.username eq board.writer}">--%>

                        <button data-oper='modify' class="btn btn-default">Modify</button>

<%--                    </c:if>--%>
                </sec:authorize>
                <!-- 아래는 시큐리티 설정 전 수정버튼-->
<%--                <button data-oper='modify' class="btn btn-default">Modify</button>--%>
                <button data-oper='list' class="btn btn-info">List</button>

                <%-- <form id='operForm' action="/boad/modify" method="get">
                  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
                </form> --%>


                <form id='operForm' action="/board/modify" method="get">
                    <input type='hidden' id='pm_mno' name='pm_mno' value='<c:out value="${board.pm_mno}"/>'>
<%--                    <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>--%>
<%--                    <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>--%>
<%--                    <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>--%>
<%--                    <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>--%>

                </form>



            </div>
            <!--  end panel-body -->

        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->



<div class='bigPictureWrapper'>
    <div class='bigPicture'>
    </div>
</div>



<style>
    .uploadResult {
        width:100%;
        background-color: white;
    }
    .uploadResult ul{
        display:flex;
        flex-flow: row;
        justify-content: center;
        align-items: center;
        -ms-transform: rotate(-90deg);
        -webkit-transform: rotate(-90deg);
        transform: rotate(-90deg);
    }
    .uploadResult ul li {
        list-style: none;
        padding: 10px;
        align-content: center;
        /*allign-content: left;*/
        text-align: center;
        -ms-transform: rotate(-90deg);
        -webkit-transform: rotate(-90deg);
        transform: rotate(-90deg);
    }
    .uploadResult ul li img{
        width: 200px;
        height: 200px;
        -ms-transform: rotate(-90deg);
        -webkit-transform: rotate(-90deg);
        transform: rotate(-90deg);
    }
    .uploadResult ul li span {
        color:white;
    }
    .bigPictureWrapper {
        position: absolute;
        display: none;
        justify-content: center;
        align-items: center;
        top:0%;
        width:100%;
        height:100%;
        background-color: white;
        z-index: 100;
        /*background:rgba(255,255,255,0.5);*/
    }
    .bigPicture {
        position: relative;
        display:flex;
        justify-content: center;
        align-items: center;
    }

    .bigPicture img {
        width:600px;
    }

</style>



<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Files</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <div class='uploadResult'>
                    <ul>
                    </ul>
                </div>
            </div>
            <!--  end panel-body -->
        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->


<%--<div class='row'>--%>

<%--    <div class="col-lg-12">--%>

<%--        <!-- /.panel -->--%>
<%--        <div class="panel panel-default">--%>
<%--            <!--       <div class="panel-heading">--%>
<%--                    <i class="fa fa-comments fa-fw"></i> Reply--%>
<%--                  </div> -->--%>

<%--            <!--       <div class="panel-heading">--%>
<%--                    <i class="fa fa-comments fa-fw"></i> Reply--%>
<%--                    <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>--%>
<%--                  </div>      -->--%>

<%--            <div class="panel-heading">--%>
<%--                <i class="fa fa-comments fa-fw"></i> Reply--%>
<%--                <sec:authorize access="isAuthenticated()">--%>
<%--                    <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>--%>
<%--                </sec:authorize>--%>
<%--            </div>--%>



<%--            <!-- /.panel-heading -->--%>
<%--            <div class="panel-body">--%>

<%--                <ul class="chat">--%>

<%--                </ul>--%>
<%--                <!-- ./ end ul -->--%>
<%--            </div>--%>
<%--            <!-- /.panel .chat-panel -->--%>

<%--            <div class="panel-footer"></div>--%>


<%--        </div>--%>
<%--    </div>--%>
<%--    <!-- ./ end row -->--%>
<%--</div>--%>



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
<%--                <div class="form-group">--%>
<%--                    <label>Reply</label>--%>
<%--                    <input class="form-control" name='reply' value='New Reply!!!!'>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label>Replyer</label>--%>
<%--                    <input class="form-control" name='replyer' value='replyer'>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label>Reply Date</label>--%>
<%--                    <input class="form-control" name='replyDate' value='2018-01-01 13:13'>--%>
<%--                </div>--%>

            </div>
            <div class="modal-footer">
                <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
                <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
                <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
                <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
            </div>          </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->





<script type="text/javascript">
    $(document).ready(function() {

        var operForm = $("#operForm");

        $("button[data-oper='modify']").on("click", function(e){

            operForm.attr("action","/board/modify").submit();

        });


        $("button[data-oper='list']").on("click", function(e){

            operForm.find("#pm_mno").remove();
            operForm.attr("action","/board/list")
            operForm.submit();

        });
    });
</script>


<script>


    $(document).ready(function(){

        (function(){

            var pm_mno = '<c:out value="${board.pm_mno}"/>';

            /* $.getJSON("/board/getAttachList", {bno: bno}, function(arr){

              console.log(arr);


            }); *///end getjson
            $.getJSON("/board/getAttachList", {pm_mno: pm_mno}, function(arr){

                console.log(arr);

                var str = "";

                $(arr).each(function(i, attach){

                    //image type
                    if(attach.fileType){
                        var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);

                        str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                        str += "<img src='/display?fileName="+fileCallPath+"'>";
                        str += "</div>";
                        str +"</li>";
                    }else{

                        str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                        str += "<span> "+ attach.fileName+"</span><br/>";
                        str += "<img src='/resources/img/attach.png'></a>";
                        str += "</div>";
                        str +"</li>";
                    }
                });

                $(".uploadResult ul").html(str);


            });//end getjson


        })();//end function

        // $(".uploadResult").on("click","li", function(e){
        //
        //     console.log("view image");
        //
        //     var liObj = $(this);
        //
        //     var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
        //
        //     if(liObj.data("type")){
        //         showImage(path.replace(new RegExp(/\\/g),"/"));
        //     }else {
        //         //download
        //         self.location ="/download?fileName="+path
        //     }
        //
        //
        // });
        //
        // function showImage(fileCallPath){
        //
        //     alert(fileCallPath);
        //
        //     $(".bigPictureWrapper").css("display","flex").show();
        //
        //     $(".bigPicture")
        //         .html("<img src='/display?fileName="+fileCallPath+"' >")
        //         .animate({width:'100%', height: '100%'}, 1000);
        //
        // }
        //
        // $(".bigPictureWrapper").on("click", function(e){
        //     $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
        //     setTimeout(function(){
        //         $('.bigPictureWrapper').hide();
        //     }, 1000);
        // });


    });

</script>






<%@include file="../includes/footer.jsp"%>

<%--
  Created by IntelliJ IDEA.
  User: Joins
  Date: 2019-07-25
  Time: 오후 3:04
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
        <h1 class="page-header">Board Modify</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Board Modify</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <form role="form" action="/board/modify" method="post">

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


                    <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
                    <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
                    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
                    <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>


                    <div class="form-group">
                        <label>Num.</label> <input class="form-control" name='pm_mno'
                                                   value='<c:out value="${board.pm_mno}"/>' readonly="readonly">
                    </div>

                    <div class="form-group">
                        <label>상품 코드</label> <input class="form-control" name='pm_code'
                                                   value='<c:out value="${board.pm_code}"/>'>
                    </div>

                    <div class="form-group">
                        <label>상품명</label> <input class="form-control" name='pm_title'
                                                  value='<c:out value="${board.pm_title}"/>'>
                    </div>

                    <div class="form-group">
                        <label>상세설명</label>
                        <textarea class="form-control" rows="10" name='pm_text'
                                  ><c:out value="${board.pm_text}"/></textarea>
                    </div>

                    <div class="form-group">
                        <label>사입처</label> <input class="form-control" name='pm_buy_f'
                                                  value='<c:out value="${board.pm_buy_f}"/>'>
                    </div>

                    <div class="form-group">
                        <label>사입처 전화번호</label> <input class="form-control" name='pm_buy_p'
                                                       value='<c:out value="${board.pm_buy_p}"/>'>
                    </div>

                    <div class="form-group">
                        <label>현재 수량 </label>
                        <input class="form-control" name='pm_num' value='<c:out value="${board.pm_num}"/>'>

<%--                        <span id="numberUpDown"><c:out value="${board.theNumber}"/></span>--%>
<%--                        <a href="#" id="increaseQuantity">▲</a>--%>
<%--                        <a href="#" id="decreaseQuantity">▼</a>--%>
<%--                        <script>--%>
<%--                            $(function(){--%>
<%--                                $('#decreaseQuantity').click(function(e){--%>
<%--                                    e.preventDefault();--%>
<%--                                    var stat = $('#numberUpDown').text();--%>
<%--                                    var num = parseInt(stat,10);--%>
<%--                                    num--;--%>
<%--                                    if(num<=0){--%>
<%--                                        alert('더이상 줄일수 없습니다.');--%>
<%--                                        num =1;--%>
<%--                                    }--%>
<%--                                    $('#numberUpDown').text(num);--%>
<%--                                });--%>
<%--                                $('#increaseQuantity').click(function(e){--%>
<%--                                    e.preventDefault();--%>
<%--                                    var stat = $('#numberUpDown').text();--%>
<%--                                    var num = parseInt(stat,10);--%>
<%--                                    num++;--%>

<%--                                    if(num>5){--%>
<%--                                        alert('더이상 늘릴수 없습니다.');--%>
<%--                                        num=5;--%>
<%--                                    }--%>
<%--                                    $('#numberUpDown').text(num);--%>
<%--                                });--%>
<%--                            });--%>

<%--//                        </script>--%>
                    </div>


                    <sec:authentication property="principal" var="pinfo"/>

                    <sec:authorize access="isAuthenticated()">

<%--                        <c:if test="${pinfo.username eq board.writer}">--%>

                            <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
                            <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
<%--                        </c:if>--%>
                    </sec:authorize>
                    <!--아래는 시큐리티 설정 전-->
<%--                    <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>--%>
<%--                    <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>--%>

                    <button type="submit" data-oper='list' class="btn btn-info">List</button>


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
        background-color: gray;
    }
    .uploadResult ul{
        display:flex;
        flex-flow: row;
        justify-content: center;
        align-items: center;
    }
    .uploadResult ul li {
        list-style: none;
        padding: 10px;
        align-content: center;
        text-align: center;
    }
    .uploadResult ul li img{
        width: 100px;
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
        background-color: gray;
        z-index: 100;
        background:rgba(255,255,255,0.5);
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
                <div class="form-group uploadDiv">
                    <input type="file" name='uploadFile' multiple="multiple">
                </div>

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


<script type="text/javascript">
    $(document).ready(function() {


        var formObj = $("form");

        $('button').on("click", function(e){

            e.preventDefault();

            var operation = $(this).data("oper");

            console.log(operation);

            if(operation === 'remove'){
                formObj.attr("action", "/board/remove");

            }else if(operation === 'list'){
                //move to list
                formObj.attr("action", "/board/list").attr("method","get");

                var pageNumTag = $("input[name='pageNum']").clone();
                var amountTag = $("input[name='amount']").clone();
                var keywordTag = $("input[name='keyword']").clone();
                var typeTag = $("input[name='type']").clone();

                formObj.empty();

                formObj.append(pageNumTag);
                formObj.append(amountTag);
                formObj.append(keywordTag);
                formObj.append(typeTag);

            }else if(operation === 'modify'){

                console.log("submit clicked");

                var str = "";

                $(".uploadResult ul li").each(function(i, obj){

                    var jobj = $(obj);

                    console.dir(jobj);

                    str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
                    str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
                    str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
                    str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";

                });
                formObj.append(str).submit();
            }

            formObj.submit();
        });

    });
</script>


<script>

    $(document).ready(function() {
        (function(){

            var pm_mno = '<c:out value="${board.pm_mno}"/>';

            $.getJSON("/board/getAttachList", {pm_mno: pm_mno}, function(arr){

                console.log(arr);

                var str = "";


                $(arr).each(function(i, attach){

                    //image type
                    if(attach.fileType){
                        var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);

                        str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
                        str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                        str += "<span> "+ attach.fileName+"</span>";
                        str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
                        str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                        str += "<img src='/display?fileName="+fileCallPath+"'>";
                        str += "</div>";
                        str +"</li>";
                    }else{

                        str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
                        str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                        str += "<span> "+ attach.fileName+"</span><br/>";
                        str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
                        str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                        str += "<img src='/resources/img/attach.png'></a>";
                        str += "</div>";
                        str +"</li>";
                    }
                });


                $(".uploadResult ul").html(str);

            });//end getjson
        })();//end function


        $(".uploadResult").on("click", "button", function(e){

            console.log("delete file");

            if(confirm("Remove this file? ")){

                var targetLi = $(this).closest("li");
                targetLi.remove();
            }
        });

        var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
        var maxSize = 5242880; //5MB

        function checkExtension(fileName, fileSize){

            if(fileSize >= maxSize){
                alert("파일 사이즈 초과");
                return false;
            }

            if(regex.test(fileName)){
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
                return false;
            }
            return true;
        }

        var csrfHeaderName ="${_csrf.headerName}";
        var csrfTokenValue="${_csrf.token}";

        $("input[type='file']").change(function(e){

            var formData = new FormData();

            var inputFile = $("input[name='uploadFile']");

            var files = inputFile[0].files;

            for(var i = 0; i < files.length; i++){

                if(!checkExtension(files[i].name, files[i].size) ){
                    return false;
                }
                formData.append("uploadFile", files[i]);

            }

            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,data:
                formData,type: 'POST',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                },
                dataType:'json',
                success: function(result){
                    console.log(result);
                    showUploadResult(result); //업로드 결과 처리 함수

                }
            }); //$.ajax

            // $.ajax({
            //     url: '/uploadAjaxAction',
            //     processData: false,
            //     contentType: false,data:
            //     formData,type: 'POST',
            //     dataType:'json',
            //     success: function(result){
            //         console.log(result);
            //         showUploadResult(result); //업로드 결과 처리 함수
            //
            //     }
            // }); //$.ajax

        });

        function showUploadResult(uploadResultArr){

            if(!uploadResultArr || uploadResultArr.length == 0){ return; }

            var uploadUL = $(".uploadResult ul");

            var str ="";

            $(uploadResultArr).each(function(i, obj){

                if(obj.image){
                    var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
                    str += "<li data-path='"+obj.uploadPath+"'";
                    str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
                    str +" ><div>";
                    str += "<span> "+ obj.fileName+"</span>";
                    str += "<button type='button' data-file=\'"+fileCallPath+"\' "
                    str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                    str += "<img src='/display?fileName="+fileCallPath+"'>";
                    str += "</div>";
                    str +"</li>";
                }else{
                    var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
                    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");

                    str += "<li "
                    str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
                    str += "<span> "+ obj.fileName+"</span>";
                    str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
                    str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                    str += "<img src='/resources/img/attach.png'></a>";
                    str += "</div>";
                    str +"</li>";
                }

            });

            uploadUL.append(str);
        }

    });

</script>

<!-- 상품 수량을 버튼으로 조정하는 스크립트 추가-->
<%--<script>--%>
<%--    function plus(){--%>
<%--        var num = "${board.theNumber}";--%>
<%--        num = Number(num) + 1;--%>
<%--    }--%>

<%--    function minus(){--%>
<%--        var num = "${board.theNumber}";--%>
<%--        num = Number(num) - 1;--%>
<%--    }--%>
<%--</script>--%>

<%@include file="../includes/footer.jsp"%>

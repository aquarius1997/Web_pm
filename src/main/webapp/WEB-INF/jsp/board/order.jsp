<%--
  Created by IntelliJ IDEA.
  User: Joins
  Date: 2019-07-29
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Items required for order (Under 3 items)</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>


<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Items required for order (Under 3 items)
            </div>

            <!-- /.panel-heading -->
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>#번호</th>
                    <%--                        <th>상품</th> <!-- 이미지-->--%>
                        <th>상품명</th>
                        <th>상품 코드</th>
                        <th>남은수량</th>
                        <th>작성날짜</th>
                    </tr>
                    </thead>

                    <c:forEach items="${list}" var="board">
                        <tr>
                            <td><c:out value="${board.pm_mno}" /></td>
                        <%--                            <td><img src="/resources/manage/imgs/${board.imgPath}" alt="" width="175" height="250"/></td>--%>
                            <td><c:out value="${board.pm_title}" /></td>
                            <td><c:out value="${board.pm_code}"/></td>
                            <td><c:out value="${board.pm_num}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${board.pm_regdate}" /></td>
                        </tr>
                    </c:forEach>

                </table>

<%--                <div class='row'>--%>
<%--                    <div class="col-lg-12">--%>

<%--                        <form id='searchForm' action="/board/order" method='get'>--%>
<%--                            <select name='type'>--%>
<%--                                &lt;%&ndash;                                <option value=""&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                        <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>&ndash;%&gt;--%>
<%--                                <option value="T"--%>
<%--                                        <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>상품명</option>--%>
<%--                                    <option value="C"--%>
<%--                                            <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>상품 코드</option>--%>
<%--                                &lt;%&ndash;                                <option value="W"&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                        <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                <option value="TC"&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                        <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                    or 내용</option>&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                <option value="TW"&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                        <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                    or 작성자</option>&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                <option value="TWC"&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                        <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목&ndash;%&gt;--%>
<%--                                &lt;%&ndash;                                    or 내용 or 작성자</option>&ndash;%&gt;--%>
<%--                            </select> <input type='text' name='keyword'--%>
<%--                                             value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input--%>
<%--                                type='hidden' name='pageNum'--%>
<%--                                value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input--%>
<%--                                type='hidden' name='amount'--%>
<%--                                value='<c:out value="${pageMaker.cri.amount}"/>' />--%>
<%--                            <button class='btn btn-default'>Search</button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>


                <div class='pull-right'>
                    <ul class="pagination">


                        <c:if test="${pageMaker.prev}">
                            <li class="paginate_button previous"><a
                                    href="${pageMaker.startPage -1}">Previous</a></li>
                        </c:if>

                        <c:forEach var="num" begin="${pageMaker.startPage}"
                                   end="${pageMaker.endPage}">
                            <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
                                <a href="${num}">${num}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${pageMaker.next}">
                            <li class="paginate_button next"><a
                                    href="${pageMaker.endPage +1 }">Next</a></li>
                        </c:if>


                    </ul>
                </div>
                <!--  end Pagination -->
            </div>

            <form id='actionForm' action="/board/order" method='get'>
                <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

                <input type='hidden' name='type'
                       value='<c:out value="${ pageMaker.cri.type }"/>'> <input
                    type='hidden' name='keyword'
                    value='<c:out value="${ pageMaker.cri.keyword }"/>'>


            </form>


            <!-- Modal  추가 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                        </div>
                        <div class="modal-body">처리가 완료되었습니다.</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save
                                changes</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->


        </div>
        <!--  end panel-body -->
    </div>
    <!-- end panel -->
</div>
</div>
<!-- /.row -->






<script type="text/javascript">
    $(document)
        .ready(
            function() {

                var result = '<c:out value="${result}"/>';

                checkModal(result);

                history.replaceState({}, null, null);

                function checkModal(result) {

                    if (result === '' || history.state) {
                        return;
                    }

                    if (parseInt(result) > 0) {
                        $(".modal-body").html(
                            "게시글 " + parseInt(result)
                            + " 번이 등록되었습니다.");
                    }

                    $("#myModal").modal("show");
                }

                $("#regBtn").on("click", function() {

                    self.location = "/board/register";

                });

                var actionForm = $("#actionForm");

                $(".paginate_button a").on(
                    "click",
                    function(e) {

                        e.preventDefault();

                        console.log('click');

                        actionForm.find("input[name='pageNum']")
                            .val($(this).attr("href"));
                        actionForm.submit();
                    });
                //
                // $(".move")
                //     .on(
                //         "click",
                //         function(e) {
                //
                //             e.preventDefault();
                //             actionForm
                //                 .append("<input type='hidden' name='bno' value='"
                //                     + $(this).attr(
                //                         "href")
                //                     + "'>");
                //             actionForm.attr("action",
                //                 "/board/get");
                //             actionForm.submit();
                //
                //         });

                var searchForm = $("#searchForm");

                $("#searchForm button").on(
                    "click",
                    function(e) {

                        if (!searchForm.find("option:selected")
                            .val()) {
                            alert("검색종류를 선택하세요");
                            return false;
                        }

                        if (!searchForm.find(
                            "input[name='keyword']").val()) {
                            alert("키워드를 입력하세요");
                            return false;
                        }

                        searchForm.find("input[name='pageNum']")
                            .val("1");
                        e.preventDefault();

                        searchForm.submit();

                    });

            });
</script>






<%@include file="../includes/footer.jsp"%>

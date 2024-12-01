<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->

<section class="bg-light">
    <div class="container">

        <div class="row justify-content-center">

            <!-- start form section -->
            <div class="col-md-11 col-lg-9">

                <div class="border bg-white p-1-9 p-lg-2-3 p-xl-6 rounded">

                    <div class="text-center mb-1-9">
                       <h2 class="font-weight-600 mb-3">커뮤니티 게시글 등록</h2>
                       <p class="mb-0">입양 후기 / 반려 이야기 / 실종 / 임시 보호 에 대한 커뮤니티 게시글을 작성해주세요.</p>
                    </div>

                    <form class="quform" action="" method="post" enctype="multipart/form-data" onclick="">
                        <div class="quform-elements">

                            <div class="row">

                                <!-- Begin Select element -->
                                <div class="col-md-6">
                                    <div class="quform-element form-group">
                                        <label for="applyfor">게시글 종류 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <select id="applyfor" class="form-control form-select" name="applyfor">
                                                <option>게시글 종류</option>
                                                <option value="Office Executive">입양 후기</option>
                                                <option value="Mutual Fund Executive">반려 이야기</option>
                                                <option value="Financial Investment">실종</option>
                                                <option value="Others">임시 보호</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                                <!-- End Select element -->
                                
                                <!-- Begin Select element -->
                                <div class="col-md-6">
                                    <div class="quform-element form-group">
                                        <label for="applyfor">동물 종류 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <select id="applyfor" class="form-control form-select" name="applyfor">
                                                <option>동물 종류</option>
                                                <option value="Office Executive">개</option>
                                                <option value="Mutual Fund Executive">고양이</option>
                                                <option value="Financial Investment">기타</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                                <!-- End Select element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6">
                                    <div class="quform-element form-group">
                                        <label for="name">글 제목</label>
                                        <div class="quform-input">
                                            <input id="name" class="form-control" type="text" name="name" placeholder="입력" />
                                        </div>
                                    </div>

                                </div>
                                <!-- End Text input element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6">
                                    <div class="quform-element form-group">
                                        <label for="last_name">거주 지역</label>
                                        <div class="quform-input">
                                            <input id="last_name" class="form-control" type="text" name="last_name" placeholder="자동 등록 / 변경을 원하시면 마이페이지에서 변경해주세요." />
                                        </div>
                                    </div>
                                </div>
                                <!-- End Text input element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6">
                                    <div class="quform-element form-group">
                                        <label for="email">실종(발견) 장소 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <input id="email" class="form-control" type="text" name="email" placeholder="입력" />
                                        </div>
                                    </div>
                                </div>
                                <!-- End Text input element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6">
                                    <div class="quform-element form-group">
                                        <label for="linkedin">실종(발견) 일자 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <input id="linkedin" class="form-control" type="text" name="linkedin" placeholder="입력" />
                                        </div>
                                    </div>

                                </div>
                                <!-- End Text input element -->

                                

                                <!-- Begin Textarea element -->
                                <div class="col-md-12">
                                    <div class="quform-element form-group">
                                        <label for="message">글 내용</label>
                                        <div class="quform-input">
                                            <textarea id="message" class="form-control" name="message" rows="4" placeholder="실종과 임시보호 게시글은 성별, 나이, 색상, 기타 특징 등 동물 정보를 상세히 적어주세요"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Textarea element -->
                                
                                
                                <!-- Begin Select element -->
                                <div id="test123" class="col-md-10">
                                    <div class="quform-element form-group">

                                        <!-- Begin Upload element -->
                                        <div class="quform-input">

                                            <label for="resume">Resume/CV <span class="quform-required">*</span></label>

                                            <div class="custom-file">
                                                <input class="custom-file-input" type="file" id="resume" name="resume" />
                                                <label class="custom-file-label" data-browse="Browse">Choose file</label>
                                            </div>

                                            <p class="quform-description">All files allowed. Maximum size 10MB.</p>

                                        </div>
                                        <!-- End Upload element -->

                                    </div>
                                    
                                </div>
                                <!-- End Select element -->

                                <!-- Begin Select element -->
                                <div class="col-md-2">
                                    <div class="quform-element form-group">

                                        <div class="quform-input">
                                            <label for="coverletter"></label>

                                            <div class="custom-file">
                                                <button id="btnAdd" class="butn w-100" type="button"><span>파일 추가</span></button>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <!-- End Select element -->

                                

                                <!-- Begin Submit button -->
                                <div class="col-md-12">
                                    <div class="quform-submit-inner text-center">
                                        <button class="butn w-100" type="submit"><span>글 등록하기</span></button>
                                    </div>
                                    <div class="quform-loading-wrap"><span class="quform-loading"></span></div>
                                </div>
                                <!-- End Submit button -->

                            </div>

                        </div>
                    </form>

                </div>

            </div>
            <!-- end form section -->

        </div>
    </div>
</section>

<!-- <script>
$(function(){
	var cnt = 1;
	// 파일추가 버튼 클릭시
	$("#btnAdd").click(function(){
		$("#test123").append("<div class='quform-element form-group'><div class='quform-input'><label for='resume'>Resume/CV <span class='quform-required'>*</span></label><div class='custom-file'><input class='custom-file-input' type='file' id='resume' name='resume' /><label class='custom-file-label' data-browse='Browse'>Choose file</label></div><p class='quform-description'>All files allowed. Maximum size 10MB.</p></div></div>");
		cnt++;
	});
	console.log(cnt);
});
</script> -->

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->

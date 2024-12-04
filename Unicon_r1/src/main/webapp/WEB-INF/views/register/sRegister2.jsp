<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

		<!-- 헤더 -->
		<style>
		.header-image {
		    width: 696px; /* 가로 크기 설정 */
		    height: auto; /* 비율 유지 */
		    margin-bottom: 50px;	    
		}
		.image-container {
		    max-width: 696px; /* 이미지의 최대 너비와 동일하게 설정 */
		    width: 100%; /* 부모 요소에 맞춤 */
		    margin: 0 auto; /* 가운데 정렬 */
		    text-align: center; /* 자식 요소 가운데 정렬 */
		}
		
		.header-image {
		    width: 100%; /* 부모 요소의 너비에 맞춤 */
		    height: auto; /* 비율 유지 */
		}
		</style>
		<!-- 헤더 -->

<!--====================================작성부=====================================-->

         <!-- APPLY FORM
        ================================================== -->
        <section class="bg-light">
            <div class="container">

                <div class="row justify-content-center">
                
		            <!-- 헤더 -->
		            <div class="image-container">
		                <img src="${pageContext.request.contextPath}/resources/registerH2.png" alt="회원가입 헤더" class="header-image">
		            </div>                

                    <!-- start form section -->
                    <div class="col-md-11 col-lg-9">

                        <div class="border bg-white p-1-9 p-lg-2-3 p-xl-6 rounded">

                            <div class="text-center mb-1-9">
                                <h2 class="font-weight-600 mb-3">회원가입</h2>
                                <p class="mb-0">UNICORN에 가입하고 당신만의 소중한 친구를 찾아보세요. 간단한 회원가입으로 바로 시작할 수 있습니다.</p>
                            </div>

                            <form class="quform" action="quform/apply-job.php" method="post" enctype="multipart/form-data" onclick="">
                                <div class="quform-elements">

                                    <div class="row">

                                        <!-- Begin Select element -->
                                        <div class="col-md-12">
                                            <div class="quform-element form-group">
                                                <label for="applyfor">Apply For <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <select id="applyfor" class="form-control form-select" name="applyfor">
                                                        <option value="">-- Apply For --</option>
                                                        <option value="member">일반회원</option>
                                                        <option value="shops">쇼핑몰 관리자</option>
                                                        <option value="ints">보호센터</option>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Select element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="name">First Name <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="name" class="form-control" type="text" name="name" placeholder="First Name" />
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="last_name">Last Name <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="last_name" class="form-control" type="text" name="last_name" placeholder="Last Name" />
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="email">Email Address <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="email" class="form-control" type="text" name="email" placeholder="name@example.com" />
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="linkedin">URL</label>
                                                <div class="quform-input">
                                                    <input id="linkedin" class="form-control" type="text" name="linkedin" placeholder="Linkedin" />
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Select element -->
                                        <div class="col-md-6">
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
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">

                                                <div class="quform-input">
                                                    <label for="coverletter">Cover Letter</label>

                                                    <div class="custom-file">
                                                        <input class="custom-file-input" type="file" id="coverletter" name="coverletter" />
                                                        <label class="custom-file-label" data-browse="Browse">Choose file</label>
                                                    </div>

                                                    <p class="quform-description">All files allowed. Maximum size 10MB.</p>

                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Select element -->

                                        <!-- Begin Textarea element -->
                                        <div class="col-md-12">
                                            <div class="quform-element form-group">
                                                <label for="message">In a Few Words <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <textarea id="message" class="form-control" name="message" rows="4" placeholder="How'd you hear about Crizal?"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Textarea element -->

                                        <!-- Begin Captcha element -->
                                        <div class="col-md-12">
                                            <div class="quform-element">
                                                <label for="type_the_word">Type the word <span class="quform-required">*</span></label>
                                                <div class="form-group">
                                                    <div class="quform-input">
                                                        <input id="type_the_word" class="form-control" type="text" name="type_the_word" placeholder="Type the below word" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="quform-captcha">
                                                        <div class="quform-captcha-inner">
                                                            <img src="quform/images/captcha/courier-new-light.png" alt="...">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Captcha element -->

                                        <!-- Begin Submit button -->
                                        <div class="col-md-12">
                                            <div class="quform-submit-inner text-center">
                                                <button class="butn w-100" type="submit"><span>Apply Now</span></button>
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



				

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->

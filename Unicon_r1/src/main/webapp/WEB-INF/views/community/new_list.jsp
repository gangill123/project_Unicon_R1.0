<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<section>
   <div class="container">
       <div class="section-heading">
           <h2>Our Latest Projects</h2>
           <p class="w-md-75 w-lg-55">Business consectetur adipisicing elit eiusmod tempor incididunt ut labore et dolore magna aliqua quis nostrud exercitation consequat.</p>
       </div>
   </div>
   
   <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#jjjModal">Launch modal</button>

   <div class="container">
       <div class="row">

           <!-- Start links -->
           <div class="filtering col-sm-12 text-center">
               <span data-filter='*' class="active">All</span>
               <span data-filter='.business'>Business</span>
               <span data-filter='.finance'>Finance</span>
               <span data-filter='.consulting'>Consulting</span>
           </div>
           <!-- End links -->

       </div>

       <!-- start portfolio gallery -->
       <div class="text-center row">

           <div class="col-lg-3 col-md-6 items finance mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg" data-sub-html="<h4 class='text-white'>Investment Project #01</h4><p>Finance Plan</p>">
               <div class="project-grid">
                   <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg">
                   </div>
                   <div class="project-grid-overlay">
                       <div class="w-100 px-3">
                           <h4><a href="#!" data-bs-toggle="modal" data-bs-target="#jjjModal">Investment Project</a></h4>
                           <p>Finance Plan</p>
                       </div>
                   </div>
               </div>
           </div>
<%--            <div class="col-lg-3 col-md-6 items finance mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg" data-sub-html="<h4 class='text-white'>Investment Project #01</h4><p>Finance Plan</p>"> --%>
<!--                <div class="project-grid"> -->
<%--                    <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg"> --%>
<!--                    </div> -->
<!--                    <div class="project-grid-overlay"> -->
<!--                        <div class="w-100 px-3"> -->
<!--                            <h4><a href="#!">Investment Project</a></h4> -->
<!--                            <p>Finance Plan</p> -->
<!--                        </div> -->
<!--                    </div> -->
<!--                </div> -->
<!--            </div> -->
           <div class="col-lg-3 col-md-6 items finance mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-1.jpg" data-sub-html="<h4 class='text-white'>Investment Planning #02</h4><p>Finance Plan</p>">
               <div class="project-grid">
                   <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-1.jpg">
                   </div>
                   <div class="project-grid-overlay">
                       <div class="w-100 px-3">
                           <h4><a href="#!">Investment Planning</a></h4>
                           <p>Finance Plan</p>
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-lg-3 col-md-6 items business mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-3.jpg" data-sub-html="<h4 class='text-white'>Online Consulting #03</h4><p>Business Plan</p>">
               <div class="project-grid">
                   <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-3.jpg">
                   </div>
                   <div class="project-grid-overlay">
                       <div class="w-100 px-3">
                           <h4><a href="#!">Online Consulting</a></h4>
                           <p>Business Plan</p>
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-lg-3 col-md-6 items consulting mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-6.jpg" data-sub-html="<h4 class='text-white'>Saving Investments #04</h4><p>Consulting Plan</p>">
               <div class="project-grid">
                   <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-6.jpg">
                   </div>
                   <div class="project-grid-overlay">
                       <div class="w-100 px-3">
                           <h4><a href="#!">Saving Investments</a></h4>
                           <p>Consulting Plan</p>
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-lg-3 col-md-6 items consulting mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-5.jpg" data-sub-html="<h4 class='text-white'>Financial Analysis #05</h4><p>Consulting Plan</p>">
               <div class="project-grid">
                   <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-5.jpg">
                   </div>
                   <div class="project-grid-overlay">
                       <div class="w-100 px-3">
                           <h4><a href="#!">Financial Analysis</a></h4>
                           <p>Consulting Plan</p>
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-lg-3 col-md-6 items business mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-4.jpg" data-sub-html="<h4 class='text-white'>Business Consulting #06</h4><p>Business Plan</p>">
               <div class="project-grid">
                   <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-4.jpg">
                   </div>
                   <div class="project-grid-overlay">
                       <div class="w-100 px-3">
                           <h4><a href="#!">Business Consulting</a></h4>
                           <p>Business Plan</p>
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-lg-3 col-md-6 items finance mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-7.jpg" data-sub-html="<h4 class='text-white'>Financial Analysis #07</h4><p>Finance Plan</p>">
               <div class="project-grid">
                   <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-7.jpg">
                   </div>
                   <div class="project-grid-overlay">
                       <div class="w-100 px-3">
                           <h4><a href="#!">Financial Analysis</a></h4>
                           <p>Finance Plan</p>
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-lg-3 col-md-6 items business mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-8.jpg" data-sub-html="<h4 class='text-white'>Business Consulting #08</h4><p>Business Plan</p>">
               <div class="project-grid">
                   <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-8.jpg">
                   </div>
                   <div class="project-grid-overlay">
                       <div class="w-100 px-3">
                           <h4><a href="#!">Business Consulting</a></h4>
                           <p>Business Plan</p>
                       </div>
                   </div>
               </div>
           </div>
       </div> <!-- <div class="portfolio-gallery-isotope text-center row"> -->
       <!-- end portfolio gallery -->

    </div>
</section>


<!-- 모달2 -->
<div class="modal fade" id="jjjModal" tabindex="-1" 
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="top: 50px;">
    <div class="modal-dialog" style="max-width: 1200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">해당 커뮤니티 종류</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-6 mb-sm-7 mb-md-8 mb-lg-9" style="margin-bottom: 28px;">
                   <div class="col-lg-5 text-center text-lg-start mb-1-9 mb-lg-0">

                       <!-- product left start -->
                       <div class="xzoom-container">
                           <img class="xzoom5 mb-1-9" id="xzoom-magnific" src="${pageContext.request.contextPath }/resources/new_assets/img/shop/preview/01_product.jpg" xoriginal="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/01_product.jpg" alt="..." style="width: 526px;">
                           <div class="xzoom-thumbs m-0">
                               <a href="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/01_product.jpg"><img class="xzoom-gallery5 xactive" width="80" src="${pageContext.request.contextPath }/resources/new_assets/img/shop/thumbs/01_product.jpg" xpreview="${pageContext.request.contextPath }/resources/new_assets/img/shop/preview/01_product.jpg" alt="..." title="The description goes here"></a>
                               <a href="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/02_product.jpg"><img class="xzoom-gallery5" width="80" src="${pageContext.request.contextPath }/resources/new_assets/img/shop/preview/02_product.jpg" alt="..." title="The description goes here"></a>
                               <a href="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/03_product.jpg"><img class="xzoom-gallery5" width="80" src="${pageContext.request.contextPath }/resources/new_assets/img/shop/preview/03_product.jpg" alt="..." title="The description goes here"></a>
                               <a href="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/04_product.jpg"><img class="xzoom-gallery5" width="80" src="${pageContext.request.contextPath }/resources/new_assets/img/shop/preview/04_product.jpg" alt="..." title="The description goes here"></a>
                           </div>
                       </div>
                       <!-- product left end -->

                   </div>
                   
                   
                   
                   
                   <div class="col-lg-7 ps-lg-2-3">
                       <div class="product-detail" style="overflow-y: auto; max-height: 470px;">
                           <div class="media">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/avatar-01.jpg" class="me-3" style="border-radius: 50%;" alt="...">
                                <div class="media-body">
                                    <h4 class="mt-0 mb-2 h4">징젱종잉123</h4>
                                    <!-- <h6 class="mt-0 mb-2 h6">1998-07-11 00:00 좋아요 711개 <i class="fa-regular fa-heart"></i></h6> -->
                                    <p>동물병원 다녀왔어요 ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ</p>
                                </div>
                            </div>
                           <div class="bg-primary separator-line-horrizontal-full mb-4"></div>
                           <p>Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</p>
                           <div class="bg-primary separator-line-horrizontal-full mb-4"></div>
                           
                           
                           <div class="media" style="margin-bottom: 30px;">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/avatar-01.jpg" class="me-3" style="border-radius: 50%;" alt="...">
                                <div class="media-body">
                                    <div class="container" style="display: flex; flex-direction: column; padding: 0px;">
									    <div class="top-section" style="display: flex; width: 100% grid-template-columns: repeat(4, 1fr);">
									        <div class="box" style="display: flex; width: 45%; text-align: left;"><h4 class="mt-0 mb-2 h5">징젱종잉 1</h4></div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 30%; text-align: center;">1998-07-11 00:00</div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 20%; text-align: center;">좋아요 711개</div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 5%; text-align: right;"><i class="fa-solid fa-heart"></i></div>
									    </div>
									    <div class="bottom-section" style="display: flex; justify-content: flex-start; align-items: center;">
									        <div class="box" style="text-align: left;">Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</div>
									    </div>
									</div>
                                </div>
                            </div>
                            
                            
                            <div class="media" style="margin-bottom: 30px;">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/avatar-01.jpg" class="me-3" style="border-radius: 50%;" alt="...">
                                <div class="media-body">
                                    <div class="container" style="display: flex; flex-direction: column; padding: 0px;">
									    <div class="top-section" style="display: flex; width: 100% grid-template-columns: repeat(4, 1fr);">
									        <div class="box" style="display: flex; width: 45%; text-align: left;"><h4 class="mt-0 mb-2 h5">징젱종잉 1</h4></div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 30%; text-align: center;">1998-07-11 00:00</div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 20%; text-align: center;">좋아요 711개</div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 5%; text-align: right;"><i class="fa-solid fa-heart"></i></div>
									    </div>
									    <div class="bottom-section" style="display: flex; justify-content: flex-start; align-items: center;">
									        <div class="box" style="text-align: left;">Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</div>
									    </div>
									</div>
                                </div>
                            </div>
                            
                            
<!--                             <div class="media" style="margin-bottom: 30px;"> -->
<%--                                 <img src="${pageContext.request.contextPath }/resources/assets/images/avatar-01.jpg" class="me-3" style="border-radius: 50%;" alt="..."> --%>
<!--                                 <div class="media-body"> -->
<!--                                     <h4 class="mt-0 mb-2 h5">징젱종잉 1</h4> -->
<!--                                     Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore. -->
<!--                                 </div> -->
<!--                                 <div class="datetime" style="margin-left: 15px;">1998-07-11 00:00</div> -->
<!--                                 <div class="likecount" style="margin-left: 15px;">좋아요 711개</div> -->
<!--                                 <div class="like" style="margin-left: 15px;"><i class="fa-solid fa-heart"></i></div> -->
<!--                             </div> -->
                            
                            <div class="media" style="margin-bottom: 30px;">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/avatar-01.jpg" class="me-3" style="border-radius: 50%;" alt="...">
                                <div class="media-body">
                                    <div class="container" style="display: flex; flex-direction: column; padding: 0px;">
									    <div class="top-section" style="display: flex; width: 100% grid-template-columns: repeat(4, 1fr);">
									        <div class="box" style="display: flex; width: 45%; text-align: left;"><h4 class="mt-0 mb-2 h5">징젱종잉 1</h4></div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 30%; text-align: center;">1998-07-11 00:00</div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 20%; text-align: center;">좋아요 711개</div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 5%; text-align: right;"><i class="fa-solid fa-heart"></i></div>
									    </div>
									    <div class="bottom-section" style="display: flex; justify-content: flex-start; align-items: center;">
									        <div class="box" style="text-align: left;">괜찮으신가요ㅜㅜㅜㅜㅜ</div>
									    </div>
									</div>
                                </div>
                            </div>
                            
                            
                            <div class="media" style="margin-bottom: 30px;">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/avatar-01.jpg" class="me-3" style="border-radius: 50%;" alt="...">
                                <div class="media-body">
                                    <div class="container" style="display: flex; flex-direction: column; padding: 0px;">
									    <div class="top-section" style="display: flex; width: 100% grid-template-columns: repeat(4, 1fr);">
									        <div class="box" style="display: flex; width: 45%; text-align: left;"><h4 class="mt-0 mb-2 h5">징젱종잉 1</h4></div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 30%; text-align: center;">1998-07-11 00:00</div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 20%; text-align: center;">좋아요 711개</div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 5%; text-align: right;"><i class="fa-solid fa-heart"></i></div>
									    </div>
									    <div class="bottom-section" style="display: flex; justify-content: flex-start; align-items: center;">
									        <div class="box" style="text-align: left;">괜찮으신가요ㅜㅜㅜㅜㅜ</div>
									    </div>
									</div>
                                </div>
                            </div>
                            
                            
                            <div class="media" style="margin-bottom: 30px;">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/avatar-01.jpg" class="me-3" style="border-radius: 50%;" alt="...">
                                <div class="media-body">
                                    <div class="container" style="display: flex; flex-direction: column; padding: 0px;">
									    <div class="top-section" style="display: flex; width: 100% grid-template-columns: repeat(4, 1fr);">
									        <div class="box" style="display: flex; width: 45%; text-align: left;"><h4 class="mt-0 mb-2 h5">징젱종잉 1</h4></div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 30%; text-align: center;">1998-07-11 00:00</div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 20%; text-align: center;">좋아요 711개</div>
									        <div class="box" style="display: flex; justify-content: center; align-items: center; width: 5%; text-align: right;"><i class="fa-solid fa-heart"></i></div>
									    </div>
									    <div class="bottom-section" style="display: flex; justify-content: flex-start; align-items: center;">
									        <div class="box" style="text-align: left;">Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</div>
									    </div>
									</div>
                                </div>
                            </div>
                           
                           
                           <!-- 일단 안씀 -->
                           
<!--                            <p class="rating-text"><span>SKU:</span> <span class="text-primary">290397</span></p> -->
<!--                            <p>Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</p> -->

<!--                            <div class="mb-4"> -->

<!--                                <div class="d-inline-block me-3 pe-3 border-end border-color-extra-medium-gray"> -->
<!--                                    <i class="fas fa-star"></i> -->
<!--                                    <i class="fas fa-star"></i> -->
<!--                                    <i class="fas fa-star"></i> -->
<!--                                    <i class="fas fa-star"></i> -->
<!--                                    <i class="fas fa-star-half-alt"></i> -->
<!--                                </div> -->

<!--                                <div class="d-inline-block"> -->
<!--                                    <a class="text-primary" href="#!">Write a review</a> -->
<!--                                </div> -->

<!--                            </div> -->
<!--                            <div class="mb-4"> -->
<!--                                <span class="me-3 display-25 font-weight-600 offer-price">$499.00</span> -->
<!--                                <span class="display-25 font-weight-700 text-primary">$299.00</span> -->
<!--                            </div> -->

<!--                            <div class="row"> -->
<!--                                <div class="col-4 col-md-2 col-lg-2"> -->
<!--                                    <label>Size:</label> -->

<!--                                    <select class="mb-4"> -->
<!--                                        <option value="S">S</option> -->
<!--                                        <option value="M">M</option> -->
<!--                                        <option value="L">L</option> -->
<!--                                        <option value="XL">XL</option> -->
<!--                                    </select> -->

<!--                                </div> -->
<!--                                <div class="col-6 col-md-2 col-lg-3"> -->
<!--                                    <div class="product-color"> -->
<!--                                        <label>Color:</label> -->
<!--                                        <select class="mb-4"> -->
<!--                                            <option value="Red">Black</option> -->
<!--                                            <option value="Black">Red</option> -->
<!--                                            <option value="Beige">Beige</option> -->
<!--                                            <option value="White">White</option> -->
<!--                                        </select> -->
<!--                                    </div> -->
<!--                                </div> -->
<!--                            </div> -->
<!--                            <div class="row"> -->
<!--                                <div class="col-4 col-lg-2"> -->
<!--                                    <label>Qty:</label> -->
<!--                                    <input type="text" class="form-control mb-4" value="1" placeholder="1"> -->
<!--                                </div> -->

<!--                            </div> -->

<!--                            <div class="row mb-4"> -->
<!--                                <div class="col-lg-12"> -->
<!--                                    <button class="butn primary me-2 mb-2 mb-md-0"><span><i class="fas fa-shopping-cart me-1"></i> Add to Cart</span></button> -->
<!--                                    <button class="butn text-uppercase"><span><i class="fas fa-heart me-1"></i> Add to wishlist</span></button> -->
<!--                                </div> -->
<!--                            </div> -->

<!--                            <div class="row"> -->

<!--                                <div class="col-lg-7"> -->

<!--                                    <label>Share on:</label> -->
<!--                                    <ul class="social-icon-style3 ps-0"> -->
<!--                                        <li><a href="#!"><i class="fab fa-facebook-f"></i></a></li> -->
<!--                                        <li><a href="#!"><i class="fab fa-twitter"></i></a></li> -->
<!--                                        <li><a href="#!"><i class="fab fa-instagram"></i></a></li> -->
<!--                                        <li><a href="#!"><i class="fab fa-youtube"></i></a></li> -->
<!--                                        <li><a href="#!"><i class="fab fa-linkedin-in"></i></a></li> -->
<!--                                    </ul> -->

<!--                                </div> -->

<!--                            </div> -->
                           
                           <!-- 일단 안씀 -->
                           
                           
                           
                       </div> <!-- <div class="product-detail"> -->
                       
                       <div style="width: 100%; height: 36px; margin-top: 10px;">
                       		<span style="margin-right: 5%;">1998-07-11 00:00</span><span style="margin-right: 5%;">좋아요 711개</span><span><i class="fa-regular fa-heart"></i></span>
                       </div>
                       <input type="text" style="width: 100%; height: 36px; margin-bottom: 10px;" placeholder="댓글 달기...">
                       <button type="button" class="btn btn-outline-success">댓글</button>
                       <button type="button" class="btn btn-outline-primary">수정</button>
                       <button type="button" class="btn btn-outline-danger">신고</button>
                       <button type="button" class="btn btn-outline-danger">삭제</button>
                       
                   </div> <!-- <div class="col-lg-7 ps-lg-2-3"> -->
                   
                   
                   
                       
                       
                       
                       
               </div> <!-- <div class="row mb-6 mb-sm-7 mb-md-8 mb-lg-9"> -->
            </div> <!-- <div class="modal-body"> -->
<!--             <div class="modal-footer"> -->
            
<!--             </div> -->
        </div> <!-- <div class="modal-content"> -->
    </div> <!-- <div class="modal-dialog" style="max-width: 1200px;"> -->
</div>


<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->




<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->

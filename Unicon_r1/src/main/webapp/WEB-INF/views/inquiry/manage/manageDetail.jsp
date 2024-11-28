<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>유니콘</title>
<!-- plugins:css -->
<link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Plugin css for this page -->

<style>


</style>


<!-- End plugin css for this page -->
<!-- inject:css -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="/resources/admin/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
</head>
<body>
	<div class="container-scroller">
		<!-- partial:navbar.jsp -->
		<%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:sidebar.jsp -->
			<%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">





<div class="card">
	<div class="container my-5">
	<h4 class="card-title">Unicon Q&amp;A 문의 관리 </h4>
    <div class="row">    
        <!-- Blog Left -->
        <div class="col-lg-9 mb-4">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <!-- Post Content -->
                    <h5 class="card-title text-primary">${boardDetail.title}</h5>
                   <ul class="list-inline mb-4" style="color: green;">
                        <li class="list-inline-item"><i class="fa fa-comments"></i> NO: ${boardDetail.bno}</li>
                        <li class="list-inline-item"><i class="fa fa-user"></i> 작성자: ${boardDetail.member_name}</li>
                        <li class="list-inline-item"><i class="fa fa-folder-open"></i> 카테고리: ${boardDetail.istatus}</li>
                        <li class="list-inline-item"><i class="fas fa-calendar-alt"></i> 작성일: ${boardDetail.created_at}</li>
                        <li class="list-inline-item"><i class="fas fa-envelope"></i> 이메일: ${boardDetail.email}</li>
                        <li class="list-inline-item"><i class="fas fa-phone"></i> 휴대폰 번호: ${boardDetail.phone}</li>
                    </ul>
                     <p class="text-dark">${boardDetail.content}</p>
                    <img src="${boardDetail.inquiryFile.thumbnailPath}" alt="Thumbnail" class="img-fluid rounded shadow-sm mb-4">
                    <hr>

                    <!-- Comment Section -->
                    <h6 class="text-dark">문의 답변</h6>
                    <div class="bg-secondary text-white p-3 rounded">
                       <c:forEach var="answer" items="${answers}">
						    <div class="bg-secondary text-white p-3 rounded mb-3">
						        <h6>${answer.dname}</h6>
						        <p>${answer.dcontent}</p>
						        <p><small>${answer.createdAt}</small></p> <!-- 답변 작성일 -->
						    </div>
						</c:forEach>
					</div>
                </div>
            </div>

            <!-- 관리자 전용 문의 답변 -->
<div class="card border-0 shadow-sm mt-4">
    <div class="card-body">
        <h6 class="text-primary">관리자 전용 문의 답변</h6>
        <form id="answerForm">
            <div class="row g-3">
                <div class="col-md-6">
                    <input type="text" id="dname" class="form-control" name="dname" placeholder="관리자">
                </div>
                <div class="col-12">
                    <textarea id="dcontent" class="form-control" name="dcontent" rows="3" placeholder="답변을 입력해주세요."></textarea>
                </div>
                <div class="col-12 text-end">
                    <button type="button" class="btn btn-primary" onclick="submitAnswer()">답변하기</button>
                </div>
            </div>
        </form>
    </div>
</div>
        </div>

        <!-- Blog Right -->
        <div class="col-lg-3">
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-body">
                    <h6 class="text-primary">문의 게시판</h6>
                    <ul class="list-unstyled mb-0">
                        <li><a href="../inquiry" class="text-dark">고객 문의 게시판</a></li>
                    </ul>
                </div>
            </div>
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-body">
                    <h6 class="text-primary">관리자 문의 게시판</h6>
                    <ul class="list-unstyled mb-0">
                        <li><a href="../manage" class="text-dark">관리자 문의 게시판 돌아가기</a></li>
                    </ul>
                </div>
            </div>
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <h6 class="text-primary">고객 서비스 카테고리 페이지</h6>
                    <ul class="list-unstyled">
                        <li><a href="../inquiry" class="text-dark">고객센터 메인</a></li>
                        <li><a href="../adoption" class="text-dark">입양 관련 문의</a></li>
                        <li><a href="../shop" class="text-dark">쇼핑 관련 문의</a></li>
                        <li><a href="../community" class="text-dark">커뮤니티 관련 문의</a></li>
                        <li><a href="../etc" class="text-dark">기타 문의</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


<script>
function submitAnswer() {
    const bno = ${boardDetail.bno};  // JSP에서 bno 값을 사용
    const dname = document.getElementById("dname").value;
    const dcontent = document.getElementById("dcontent").value;

    const formData = new FormData();
    formData.append('bno', bno);
    formData.append('dname', dname);
    formData.append('dcontent', dcontent);

    fetch('/api/addAnswer', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
    	console.log('답변이 추가되었습니다.', data);

        // SweetAlert2로 성공 메시지 표시
        Swal.fire({
            icon: 'success',
            title: '답변이 추가되었습니다!',
            text: '답변이 성공적으로 등록되었습니다.',
            confirmButtonText: '확인'
        });

        // 폼 초기화
        document.getElementById("dname").value = '';
        document.getElementById("dcontent").value = '';

        // 답변 목록을 갱신하거나 UI에 반영
        const answerList = data;  // 서버에서 반환된 답변 목록
        const answerContainer = document.getElementById("answer-list"); // 답변을 표시할 컨테이너

        // 기존 답변 목록 지우기
        answerContainer.innerHTML = '';

        // 새로운 답변 목록을 추가
        answerList.forEach(answer => {
            const answerDiv = document.createElement('div');
            answerDiv.classList.add('bg-light', 'p-3', 'rounded', 'mb-2');
            answerDiv.innerHTML = `<strong>${answer.dname}</strong>: ${answer.dcontent}`;
            answerContainer.appendChild(answerDiv);
        });
    })
    .catch(error => {
        console.error('Error:', error);
    });
}
</script>












				</div>
				<!-- content-wrapper ends -->
				<!-- partial:footer.jsp -->
				<%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="/resources/admin/js/off-canvas.js"></script>
	<script src="/resources/admin/js/hoverable-collapse.js"></script>
	<script src="/resources/admin/js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<!-- End custom js for this page -->
</body>
</html>
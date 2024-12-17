<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

/* 모달 배경 */
.modal {
    display: none;  /* 기본적으로 숨김 */
    position: fixed; /* 화면에 고정 */
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 배경 반투명 */

    overflow: hidden; /* 모달 안에서 스크롤 방지 */
}

/* 모달 내용 */
.modal-content {
    background-color: white; /* 모달 배경색 */
    padding: 20px; /* 내부 여백 */
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
    max-width: 500px; /* 모달 최대 너비 */
    width: 90%; /* 화면에 맞게 조정 */

}
/* 닫기 버튼 */
.close-btn {
    color: #aaa;
    font-size: 28px;
    font-weight: bold;
    position: absolute;
    top: 10px;
    right: 20px;
    cursor: pointer;
}

.close-btn:hover,
.close-btn:focus {
    color: black;
    text-decoration: none;
}

/* 텍스트 영역 스타일 */
textarea {
    width: 100%;
    padding: 60px;
    font-size: 16px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-top: 10px;
}

/* 수정 완료 버튼 스타일 */
.btn-primary {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;
}

.btn-primary:hover {
    background-color: #0056b3;
}

#dname {
    border: none;
    background-color: transparent; /* 배경색도 없애고 싶다면 */
}

.container {
    max-width: 1140px;
}
.card-title {
    font-size: 1.8rem;
    font-weight: bold;
}

.modal .close-btn {
    font-size: 30px;
    color: #333;
    cursor: pointer;
}
.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
}
.bg-light {
    background-color: #f9f9f9;
}
.rounded-circle {
    border-radius: 50% !important;
}
.bg-light .p-3 {
    background-color: #f1f1f1 !important;
}

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
   <div class="card">
        <br>
        <br>
        <h4 class="card-title">Unicorn Q&amp;A 문의 관리</h4>
        <div class="row">    
            <!-- Blog Left -->
            <div class="col-lg-9 mb-4">
                <div class="card" style="border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 15px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); background-color: #f9f9f9;">
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
                        <c:if test="${not empty boardDetail.inquiryFile.thumbnailPath}">
                            <img src="${boardDetail.inquiryFile.thumbnailPath}" alt="Thumbnail" />
                        </c:if>
                        <hr>

                        <!-- Comment Section -->

                        <h6 class="text-dark">문의 답변</h6>
                        <div class="bg-secondary text-white p-3 rounded">
                            <c:forEach var="answer" items="${answers}">
                                <div class="bg-secondary text-white p-3 rounded mb-3">                                          
                                    <h6><img src="${pageContext.request.contextPath}/resources/assets/images/U문의.jpg" 
                                            alt="U" class="rounded-circle me-2" style="width: 30px; height: 30px;"> ${answer.dname}</h6>
                                    <p>${answer.dcontent}</p>
                                    <p>
                                    <small>${answer.created_at}</small>
                                    </p>

                                    <!-- 수정할 답변을 입력받는 모달 -->
                                    <div id="updateModal" class="modal">
                                        <div class="modal-content">
                                            <span class="close-btn" onclick="closeModal()">&times;</span>
                                            <h2 style="color: black;">답변 수정</h2>
                                            <textarea id="update-dcontent" placeholder="수정할 답변 내용을 입력하세요" rows="5"></textarea>
                                            <button class="btn btn-primary" onclick="saveAnswer()">수정 완료</button>
                                        </div>
                                    </div>

                                    <!-- 수정 버튼 -->
                                    <button onclick="openUpdateModal(${answer.dno})" class="btn btn-warning btn-sm">수정</button>

                                    <!-- 삭제 버튼 -->
                                    <button type="button" class="btn btn-danger btn-sm" onclick="deleteAnswer(${answer.dno})">삭제</button>
                                </div>
                            </c:forEach>
                        </div>
                    
                    </div>
                </div>

                <!-- 관리자 전용 문의 답변 -->
               <div class="card" style="border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 15px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); background-color: #f9f9f9;">
                    <div class="card-body">
                        <h6 class="text-primary">관리자 전용 문의 답변</h6>
                        <form id="answerForm">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <input type="text" id="dname" class="form-control" name="dname" placeholder="관리자" value="관리자" readonly="readonly" style="width: 90px; display: inline-block;">
                                </div>        
                                <div class="col-12">
                                    <textarea id="dcontent" class="form-control" name="dcontent" rows="4" placeholder="답변을 입력해주세요."></textarea>
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
                <div class="card" style="border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 15px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); background-color: #f9f9f9;">
                    <div class="card-body">
                        <h6 class="text-primary">문의 현황</h6>
                        <ul class="list-unstyled mb-0">
                            <li><a href="../graph" class="text-dark">문의 현황 차트</a></li>
                        </ul>
                    </div>
                </div>
              	<div class="card" style="border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 15px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); background-color: #f9f9f9;">

                    <div class="card-body">
                        <h6 class="text-primary">관리자 문의 게시판</h6>
                        <ul class="list-unstyled mb-0">
                            <li><a href="../manage" class="text-dark">관리자 문의 게시판 돌아가기</a></li>
                        </ul>
                    </div>
                </div>
				<div class="card" style="border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 15px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); background-color: #f9f9f9;">
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



<!-- 삭제 버튼  -->
<script>
function deleteAnswer(dno) {
    // 삭제 확인 메시지 표시
    if (confirm("정말 삭제하시겠습니까?")) {
        // AJAX 요청으로 삭제 처리 (RequestBody 사용)
        fetch('/api/manageDelete', {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ dno: dno })  // dno를 요청 본문에 포함
        })
        .then(response => response.json())
        .then(data => {
        	 console.log(data.message);
             Swal.fire({
                 icon: 'success',
                 title: '답변이 삭제되었습니다!',
                 text: data.message,
                 confirmButtonText: '확인'
             }).then((result) => {
                 if (result.isConfirmed) {
                     // 삭제 후 페이지 새로 고침
                     location.reload();  // 페이지 새로 고침
                 }
             });
       
        })
        .catch(error => {
            console.error('삭제 오류:', error);
            alert("답변 삭제 중 오류가 발생했습니다.");
        });
    }
}
</script>




<!-- 답글 수정 버튼 -->
<script>
//모달 열기
function openUpdateModal(dno) {
    const modal = document.getElementById("updateModal");
    modal.style.display = "block";  // 모달 열기

    // 수정 완료 버튼에 dno 값도 함께 전달하여 호출
    document.querySelector(".btn-primary").onclick = function() {
        saveAnswer(dno);
    };
}

// 모달 닫기
function closeModal() {
    const modal = document.getElementById("updateModal");
    modal.style.display = "none";  // 모달 닫기
}

// 답변 수정 완료
function saveAnswer(dno) {
    const dcontent = document.getElementById("update-dcontent").value;
    if (dcontent) {
        // PUT 요청 시 데이터는 body에 포함
        fetch('/api/manageEdit', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ dno: dno, dcontent: dcontent })  // dno와 dcontent를 JSON 형태로 전달
        })
        .then(response => response.json())  // 서버 응답 처리
        .then(data => {
            // 성공 메시지 출력 (SweetAlert2 사용)
            Swal.fire({
                icon: 'success',
                title: '성공',
                text: data.message,  // 서버에서 받은 메시지 출력
                showConfirmButton: false,
                timer: 1500
            }).then(() => {
                closeModal();  // 모달 닫기
                location.reload();  // 페이지 새로 고침
            });
        })
        .catch(error => console.error('Error:', error));
    } else {
        alert("답변 내용을 입력하세요.");
    }
}
</script>


<script>
function submitAnswer() {
    const bno = ${boardDetail.bno};  // JSP에서 bno 값을 사용
    const dname = document.getElementById("dname").value;
    const dcontent = document.getElementById("dcontent").value;
    console.log("입력된 dcontent 값:", dcontent); // dcontent 값 확인

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

    	Swal.fire({
    	    icon: 'success',
    	    title: '답변이 추가되었습니다!',
    	    text: '답변이 성공적으로 등록되었습니다.',
    	    confirmButtonText: '확인'
    	}).then((result) => {
    	    if (result.isConfirmed) {
    	        // 확인 버튼을 클릭하면 폼 초기화 후 페이지 새로 고침
    	        document.getElementById("dname").value = '';
    	        document.getElementById("dcontent").value = '';

    	        // 페이지 새로 고침
    	        location.reload();
    	    }
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
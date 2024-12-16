<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>판매자</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/admin/vendors/mdi/css/materialdesignicons.min.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/admin/vendors/css/vendor.bundle.base.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/admin/vendors/font-awesome/css/font-awesome.min.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style.css" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/images/favicon.png" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
      .btns-flex {
        display: flex;
      }
      .store-search input {
      	width: 150px;
      }
      /* .store-search {
      	display: flex;
      	justify-content: space-between;
      	align-items: center;
      } */
      .store-search label {
    	margin: 0 0.4rem;
    	font-size: 13px;
      }
      .store-search-btn {
   	    display: inline-block;
	    height: 0;
	    padding: 0;
	    font-size: 28px;
	    margin: 0 10px;
	    line-height: 0;
      }
      input {
        border: 1px solid #dbdde2;
	    padding: 4px 8px 4px 8px;
	    font-size: 14px;
	    transition: border 0.1s;
      }

      input:focus {
        border: 1px solid #bf94e4; /* 포커스 시 보더 색상 변경 */
        outline: none; /* 기본 아웃라인 제거 */
      }
      input[type="checkbox"] {
        transform: scale(1.5);
        margin: 0 0.2rem 0 0.5rem;
        cursor: pointer;
      }
      .store-btn {
      	border : 1px solid #dbdde2;
      	background-color: white;
      	padding: 0 0.6rem;
      	font-size: 12px;
      }
      .search-btn {
      	display: flex;
      	justify-content: center;
      	gap: 1rem;
      }
      
      .search-btn button {
	    border: 1px solid #dbdde2;
	    background-color: white;	
	    cursor: pointer; /* 마우스 포인터 변경 */
	    width: 120px;
	    height: 40px;
	  }
	  .search-btn .search {
	  	background-color: #bf94e4;
    	border: 1px solid #bf94e4;
	  }
	  .search-btn .search:hover {
	  	background-color: #b783e3;
    	border: 1px solid #b783e3;
	  }
	  .search-btn .reset:hover {
	  	border: 1px solid #bf94e4;
	  }
	  
		.btns-flex {
			gap: 1rem;
			margin-bottom: 0.8rem;
		}
		
		

	  	
  </style>
  
  <script>
    $(document).ready(function() {
        let selectedValues = [];

        // 전체 체크박스 클릭 이벤트
        $('#selectAll').change(function() {
            const isChecked = $(this).is(':checked');
            $('.status-checkbox').prop('checked', isChecked).prop('disabled', isChecked);

            // 전체 체크박스가 체크되면 모든 값 추가, 아니면 비우기
            if (isChecked) {
                selectedValues = $('.status-checkbox').map(function() {
                    return this.value;
                }).get();
            } else {
                selectedValues = [];
            }

            console.log(selectedValues); // 배열 출력
        });

        // 각 체크박스 클릭 이벤트
        $('.status-checkbox').change(function() {
            const value = $(this).val();
            if ($(this).is(':checked')) {
                // 체크된 경우 배열에 추가
                selectedValues.push(value);
            } else {
                // 체크 해제된 경우 배열에서 제거
                selectedValues = selectedValues.filter(v => v !== value);
            }

            // 전체 체크박스 상태 업데이트
            $('#selectAll').prop('checked', $('.status-checkbox:checked').length === $('.status-checkbox').length);
            
            console.log(selectedValues); // 배열 출력
        });
        
     // 오늘 날짜와 1년 전 날짜 초기화
        const today = new Date();
        const formattedToday = today.toISOString().split('T')[0];
        const oneYearAgo = new Date(today);
        oneYearAgo.setDate(today.getDate() - 365);
        const formattedOneYearAgo = oneYearAgo.toISOString().split('T')[0];

        // 시작일과 종료일 필드 설정
        $('#startDate').val(formattedOneYearAgo).attr('max', formattedToday);
        $('#endDate').val(formattedToday).attr('max', formattedToday);

        // 날짜 포맷을 YYYY-MM-DD로 변환
        const formatDate = (date) => {
            if (!(date instanceof Date) || isNaN(date)) {
                console.error("Invalid date:", date);
                return ""; // 유효하지 않은 경우 빈 문자열 반환
            }
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            return (year+"-"+month+"-"+day);
        };

        function setDate(days) {
            const startDate = new Date(today);
            const endDate = new Date(today);
            startDate.setDate(today.getDate() - days);
            endDate.setDate(today.getDate());

            $('#startDate').val(formatDate(startDate));
            $('#endDate').val(formatDate(endDate));
        }

        // 버튼 클릭 이벤트
        $('#selete-today').click(function() {
            setDate(0); // 오늘
        });

        $('#oneWeek').click(function() {
            setDate(7); // 1주일 전
        });

        $('#oneMonth').click(function() {
            setDate(30); // 1개월 전 (대략)
        });

        $('#threeMonths').click(function() {
            setDate(90); // 3개월 전 (대략)
        });

        $('#sixMonths').click(function() {
            setDate(180); // 6개월 전 (대략)
        });

        $('#oneYear').click(function() {
            setDate(365); // 1년 전
        });

        $('#all').click(function() {
            $('#startDate').val(''); // 전체 선택 시 빈 값으로 설정
            $('#endDate').val('');
            $('#startDate').attr('readonly', true); // 리드온리 설정
            $('#endDate').attr('readonly', true); // 리드온리 설정
        });
        
        $('#selete-today, #oneWeek, #oneMonth, #threeMonths, #sixMonths, #oneYear').click(function() {
            $('#startDate').attr('readonly', false); // 리드온리 해제
            $('#endDate').attr('readonly', false); // 리드온리 해제
        });
        
        
        $('.search').click( function () {
        	var productName = $('#productName').val().trim(); // 상품명
        	var manufacturerName = $('#manufacturerName').val().trim(); // 상품명
        	var brandName = $('#brandName').val().trim(); // 상품명
        	var category = $('#category').val().trim(); // 상품명
        	// 선택된 체크박스의 값을 배열로 가져오기
            var selectedStatuses = "";
        	
            $('.status-checkbox:checked').each(function() {
                selectedStatuses += $(this).val() + ","; // 값을 문자열로 추가하고 쉼표로 구분
            });

            // 마지막 쉼표 제거
            if (selectedStatuses.length > 0) {
                selectedStatuses = selectedStatuses.slice(0, -1);
            } else {
                alert("판매 선택을 체크해 주세요."); // 아무것도 체크되지 않으면 경고 메시지
                return; // 함수 종료
            }
          
            var start_date = $('#startDate').val();
            var end_date = $('#endDate').val();
            
        	 // 날짜가 비어 있지 않다면 초를 추가
            if (start_date) {
                start_date += " 00:00:00"; // 자정으로 설정
            }

            if (end_date) {
                end_date += " 23:59:59"; // 끝나는 날의 마지막 순간으로 설정
            }
         	// MySQL 쿼리에서 사용
            
        	var data = {
        		  product_name: productName,
        		  manufacturer: manufacturerName,
        		  brand: brandName,
                  product_category_type: category,
                  selectedStatuses : selectedStatuses,
                  start_date : start_date,
                  end_date : end_date
        	}
        	
        	$.ajax({
        	    url: '/store/products/list', // 요청을 보낼 URL을 입력하세요.
        	    type: 'POST', // 요청 방식 (POST)
        	    contentType: 'application/json', // 요청 데이터의 타입
        	    data: JSON.stringify(data), // data 객체를 JSON 문자열로 변환
        	    success: function(response) {
        	     	// 응답에서 데이터 갯수만큼 반복
					// 날짜 포맷팅 함수 (forEach 밖에서 정의)
			        function formatDate(dateString) {
			            const date = new Date(dateString);
			            const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
			            return date.toLocaleDateString('ko-KR', options);
			        }
        	        
        	        response.forEach(function(item) {
        	        	// 날짜 포맷팅
        	            const startDate = formatDate(item.start_date);
        	            const endDate = formatDate(item.end_date);
        	            const createDate = formatDate(item.create_date);
        	            const updateDate = formatDate(item.update_date);
        	            
        	            // 각 아이템에 대해 처리
        	            var row = '<tr style="height: 36px;cursor: pointer;" class="product-row" data-product-id="' + item.product_id + '">' +
        	                '<td style="width: 30px; padding:0px;"><input class="item-checkbox" type="checkbox"></td>' +
        	                '<td style="width: 100px;">' + item.product_id + '</td>' +
        	                '<td style="width: 300px;">' + item.product_name + '</td>' +
        	                '<td style="width: 100px;">' + item.product_status + '</td>' +
        	                '<td style="width: 100px;">' + item.option_type + '</td>' +
        	                '<td style="width: 100px;">' + item.product_stock + '</td>' +
        	                '<td style="width: 100px;">' + item.product_price + '원</td>' +
        	                '<td style="width: 100px;">' + item.discount_rate + '%</td>' +
        	                '<td style="width: 100px;">' + item.delivery_price + '원</td>' +
        	                '<td style="width: 100px;">' + item.manufacturer + '</td>' +
        	                '<td style="width: 100px;">' + item.brand + '</td>' +
        	                '<td style="width: 100px;">' + startDate + '</td>' +
        	                '<td style="width: 100px;">' + endDate + '</td>' +
        	                '<td style="width: 100px;">' + createDate + '</td>' +
        	                '<td style="width: 100px;">' + updateDate + '</td>' +
        	                '</tr>';
        	                
        	            $('#table_body').append(row); // id가 table_body인 요소에 행 추가
        	        });
        	    	// 테이블 행 클릭 이벤트 등록
                    $('.product-row').on('click', function(event) {
                        // 체크박스가 클릭된 경우에는 이벤트 취소
                        if ($(event.target).is('.product-checkbox')) {
                            return; // 체크박스를 클릭했으면 아무것도 하지 않음
                        }

                        var productId = $(this).data('product-id'); // 클릭한 행의 product_id 가져오기
                        
                        var $clickedRow = $(this); // 클릭한 행을 저장
                        var productName = $(this).find('td:nth-child(3)').text(); // 클릭한 행에서 상품명 가져오기
                        var productStatus = $(this).find('td:nth-child(4)').text(); // 클릭한 행에서 상품명 가져오기
                        
                     	// 이미 열려 있는 데이터 행이 있는지 확인
                        if ($clickedRow.next('.header-row').length > 0) {
                            // 이미 열려 있으면 닫기
                            $clickedRow.next('.header-row').remove(); // 헤더 행 제거
                            $clickedRow.nextAll('.data-row' + productId).remove(); 
                            return; // 추가 처리 없이 종료
                        }
                        
                        
					    $.ajax({
					        url: '/store/products/optionDetails/'+productId, // 요청을 보낼 URL
					        type: 'GET', // 요청 방식 (GET)
					        contentType: 'application/json', // 요청 데이터의 타입
					        success: function(response) {
					         	// 클릭한 행 다음에 헤더를 추가
					            
					            
					            response.forEach(function(item){
					            	// 옵션2와 옵션값2가 null일 경우 공백으로 설정
					                item.option_name2 = item.option_name2 ? item.option_name2 : '';
					                item.option_value2 = item.option_value2 ? item.option_value2 : '';
					                var dataRows = '<tr class="data-row' + productId + '" style="height: 36px; background:#e7e7e7;">' +
					                    '<td style="width: 30px; padding:0px;"><input class="product-checkbox" type="checkbox"></td>' + // 체크박스 위치
					                    '<td style="width: 100px;">' + productId + '</td>' + // 상품 번호
					                    '<td style="width: 300px;">' + productName + '</td>' + // 상품명
					                    '<td style="width: 100px;">' + productStatus + '</td>' + // 판매 상태 - 예시로 "판매중"으로 고정
					                    '<td style="width: 100px;">' + item.option_name + '</td>' + // 옵션1
					                    '<td style="width: 100px;">' + item.option_value + '</td>' + // 옵션값1
					                    '<td style="width: 100px;">' + item.option_name2 + '</td>' + // 옵션2 (null이면 공백)
					                    '<td style="width: 100px;">' + item.option_value2 + '</td>' + // 옵션값2 (null이면 공백)
					                    '<td style="width: 100px;">' + item.option_stock + '</td>' + // 재고수량
					                    '<td style="width: 100px;">+ ' + item.option_price + '원</td>' + // 판매가
					                    '</tr>';
					                // 클릭한 tr 다음에 새로운 데이터 행 추가
					                $clickedRow.after(dataRows); // 클릭한 행의 다음에 데이터 행 추가
					            });
					            var headerRow = '<tr class="header-row" style="height: 36px; background: #a9a9a9">' +
				                '<td style="width: 30px; padding:0px;"></td>' +
				                '<td style="width: 100px;">상품번호</td>' +
				                '<td style="width: 300px;">상품명</td>' +
				                '<td style="width: 100px;">상태</td>' +
				                '<td style="width: 100px;">옵션1</td>' +
				                '<td style="width: 100px;">옵션값1</td>' +
				                '<td style="width: 100px;">옵션2</td>' +
				                '<td style="width: 100px;">옵션값2</td>' +
				                '<td style="width: 100px;">재고수량</td>' +
				                '<td style="width: 100px;">판매가</td>' +
				                '</tr>';

			                $clickedRow.after(headerRow); // 클릭한 행의 다음에 데이터 행 추가
					            
					        },
					        error: function(xhr, status, error) {
					            console.error("요청 실패:", error); // 요청 실패 시 처리
					            // 에러 처리 로직을 여기에 작성
					        }
					    });
                        // 추가적인 처리 로직 작성
                    });
        	    },
        	    error: function(xhr, status, error) {
        	        console.error("요청 실패:", error); // 요청 실패 시 처리
        	        // 에러 처리 로직을 여기에 작성
        	    }
        	});
        });
        
     	// 선택 삭제 버튼 클릭 이벤트 등록
        $('.store-btn.select-delete').on('click', function() {
            // 체크된 체크박스 선택
            var checkedCheckboxes = $('.product-checkbox:checked'); 

            // 체크된 체크박스가 0개일 경우 경고
            if (checkedCheckboxes.length === 0) {
                alert('하나 이상의 상품을 선택해야 합니다.');
                return;
            }

            // 하나의 체크박스가 체크된 경우 처리 로직 작성
            var productId = checkedCheckboxes.closest('tr').find('td:nth-child(2)').text(); // 상품 번호 가져오기
            console.log('삭제할 상품 ID:', productId);
            
        });
     	
        // 셀렉트 박스의 change 이벤트 등록
		$('#productStatus').on('change', function() {
		    // 체크된 체크박스가 있는지 확인
		    var checkedCount = $('.item-checkbox:checked').length;
		
		    if (checkedCount === 0) {
		        // 체크박스가 선택되지 않은 경우
		        alert('체크박스를 선택해야 합니다.');
		        // 셀렉트 박스 값을 "판매변경"으로 되돌리기
		        $(this).val('판매변경');
		    } 
		});
        
        
		$('#update-btn').on('click', function() {
			// 체크된 체크박스 가져오기
	        var checkedRows = $('.item-checkbox:checked');

	        // 체크된 줄이 없을 경우 경고
	        if (checkedRows.length === 0) {
	            alert('하나 이상의 상품을 선택해야 합니다.');
	            return;
	        }

	        // 체크된 줄의 판매 상태와 셀렉트 박스의 값 가져오기
	        var currentStatus = "";
	        var currentProductId = "";
	        var productStatus = $('#productStatus').val(); // 선택된 셀렉트 박스의 값

	        checkedRows.each(function() {
	            var productRow = $(this).closest('tr'); // 체크박스가 있는 행
	            currentProductId = productRow.find('td:nth-child(2)').text(); // 판매 상태가 있는 열의 인덱스
	            currentStatus = productRow.find('td:nth-child(4)').text(); // 판매 상태가 있는 열의 인덱스
	        });
	        
	        console.log("productStatus : "+ productStatus);
	        
	        if(productStatus == "판매변경") {
	        	alert("변경할 상태를 선택하세요.");
	        	return;
	        }
	        
	        // selectedStatuses의 값이 "승인대기"인 경우 경고
	        if (currentStatus== "승인대기") {
	            alert("승인대기 중입니다.");
	            return;
	        }
	        
	     	// AJAX 요청
	        var data = {
	            currentProductId: currentProductId,
	            productStatus: productStatus
	        };
	     	
	        $.ajax({
	            url: '/store/products/updateStatus', // 요청을 보낼 URL
	            type: 'POST', // 요청 방식
	            contentType: 'application/json', // 요청 데이터의 타입
	            data: JSON.stringify(data), // data 객체를 JSON 문자열로 변환
	            success: function(response) {
	                console.log("응답:", response); // 성공적으로 응답을 받았을 때 처리
	                alert("상태가 성공적으로 업데이트되었습니다.");
	             	// 페이지 새로 고침
	                location.reload();
	            },
	            error: function(xhr, status, error) {
	                console.error("요청 실패:", error); // 요청 실패 시 처리
	                alert("상태 업데이트 중 오류가 발생했습니다.");
	            }
	        });
	    });
		
		//changeSalesPeriodButton
		$('#changeSalesPeriodButton').click(function () {
			// 체크된 체크박스가 있는지 확인
		    var checkedCount = $('.item-checkbox:checked').length;
		    if (checkedCount === 0) {
		        // 체크박스가 선택되지 않은 경우
		        alert('체크박스를 선택해야 합니다.');
		    }
		    // 체크된 체크박스 가져오기
		    var checkedRows = $('.item-checkbox:checked');
			// 체크된 줄이 없을 경우 경고
	        if (checkedRows.length === 0) {
	            alert('하나 이상의 상품을 선택해야 합니다.');
	            return;
	        }
			
			var currentProductId ="";
			var start_date = "";
			var end_date = "";
	        checkedRows.each(function() {
	            var productRow = $(this).closest('tr'); // 체크박스가 있는 행
	            currentProductId = productRow.find('td:nth-child(2)').text(); // 판매 상태가 있는 열의 인덱스
	            start_date = productRow.find('td:nth-child(12)').text(); // 판매 상태가 있는 열의 인덱스
	            end_date = productRow.find('td:nth-child(13)').text(); // 판매 상태가 있는 열의 인덱스
	        });
	        
	    	// 프롬프트로 날짜 입력 받기
	        var newStartDate = prompt("새로운 시작일을 입력하세요 (형식: YYYYMMDD):");
	        var newEndDate = prompt("새로운 종료일을 입력하세요 (형식: YYYYMMDD):");
	        
	     	// 날짜 유효성 검사 함수
	        function isValidDate(dateString) {
	            // YYYYMMDD 형식의 정규 표현식
	            var regex = /^(20[0-2][0-9])(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
	            return regex.test(dateString);
	        }

	        // 오늘 날짜 구하기
	        var today = new Date();
	        var todayString = today.toISOString().slice(0, 10).replace(/-/g, ''); // YYYYMMDD 형식으로 변환

	        // 시작일 유효성 검사
	        if (!isValidDate(newStartDate)) {
	            alert("시작일의 형식이 잘못되었습니다. YYYYMMDD 형식으로 입력하세요.");
	            return;
	        }

	        // 종료일 유효성 검사
	        if (!isValidDate(newEndDate)) {
	            alert("종료일의 형식이 잘못되었습니다. YYYYMMDD 형식으로 입력하세요.");
	            return;
	        }

	        // 오늘 날짜보다 이전인지 검사
	        if (newStartDate < todayString) {
	            alert("시작일은 오늘 날짜보다 이전일 수 없습니다.");
	            return;
	        }

	        if (newEndDate < todayString) {
	            alert("종료일은 오늘 날짜보다 이전일 수 없습니다.");
	            return;
	        }

	        // 종료일이 시작일보다 이전인지 검사
	        if (newEndDate <= newStartDate) {
	            alert("종료일은 시작일보다 이후여야 합니다.");
	            return;
	        }

	    	 // 날짜 포맷팅 함수 (시분초 포함)
	        function formatDateWithTime(dateString, isStartDate) {
	            var formattedDate = dateString.substring(0, 4) + '-' + dateString.substring(4, 6) + '-' + dateString.substring(6, 8);
	            return formattedDate + (isStartDate ? ' 00:00:00' : ' 23:59:59');
	        }

	        // 날짜가 유효하다면 추가 처리
	        console.log("상품 ID:", currentProductId);
	        console.log("새로운 시작일:", formatDateWithTime(newStartDate, true)); // 시작일: 시분초 00:00:00
	        console.log("새로운 종료일:", formatDateWithTime(newEndDate, false)); // 종료일: 시분초 23:59:59

	        // 여기에 서버 요청 또는 추가 처리 로직을 작성
	        
	        var data = {
                currentProductId: currentProductId,
                newStartDate: formatDateWithTime(newStartDate, true), // 시작일 포맷팅
                newEndDate: formatDateWithTime(newEndDate, false) // 종료일 포맷팅
            };
	        
	        // AJAX 요청 예시
	        $.ajax({
	            url: '/store/products/updateDate', // 서버 API 엔드포인트 URL
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function(response) {
	                // 요청 성공 시 처리
	                console.log("성공:", response);
	            	// 페이지 새로 고침
	                location.reload();
	            },
	            error: function(xhr, status, error) {
	                // 요청 실패 시 처리
	                console.error("오류:", error);
	            }
	        });
		});

		$('#changeStockQuantityButton').click( function () {
			// 체크된 체크박스가 있는지 확인
		    var checkedCount = $('.product-checkbox:checked').length;
		    if (checkedCount === 0) {
		        // 체크박스가 선택되지 않은 경우
		        alert('체크박스를 선택해야 합니다.');
		    }
		    
			// 체크된 체크박스 가져오기
		    var checkedRows = $('.product-checkbox:checked');
			// 체크된 줄이 없을 경우 경고
	        if (checkedRows.length === 0) {
	            alert('하나 이상의 상품을 선택해야 합니다.');
	            return;
	        }
			
	        var currentProductId ="";
			var productName ="";
			var option_price = "";
	        checkedRows.each(function() {
	            var productRow = $(this).closest('tr'); // 체크박스가 있는 행q
	            currentProductId = productRow.find('td:nth-child(2)').text(); // 판매 상태가 있는 열의 인덱스
	            productName = productRow.find('td:nth-child(6)').text(); // 판매 상태가 있는 열의 인덱스
	        	 // option_price에서 +와 원 제거
	            option_price = productRow.find('td:nth-child(10)').text(); // 가격이 있는 열의 인덱스
	            option_price = option_price.replace(/^\+/g, '').replace(/원$/g, '').trim(); // + 제거 및 원 제거 후 공백 제거
	        });
	        
	        var newStock = prompt("변경할 재고수량을 입력하세요.");
			
	     	// 입력값이 숫자인지 유효성 검사
	        if (newStock === null || isNaN(newStock) || newStock.trim() === "" || Number(newStock) < 0) {
	            alert("유효한 재고수량을 입력하세요. (0 이상의 숫자여야 합니다.)");
	            return; // 함수 종료
	        }
		    // 숫자로 변환
		    newStock = Number(newStock);
		    
		    console.log(option_price);
		    	
		    var data = {
                currentProductId: currentProductId,
                newStock: newStock, 
                option_value : productName,
                option_price : option_price
            };
		    
		 	// AJAX 요청
		    $.ajax({
		        url: '/store/products/updateStock', // 요청할 URL
		        type: 'POST', // HTTP 메서드
		        contentType: 'application/json', // 요청 데이터 타입
		        data: JSON.stringify(data), // 데이터를 JSON 형식으로 변환
		        success: function(response) {
		            // 요청 성공 시 처리할 로직
		            alert('재고가 성공적으로 업데이트되었습니다.');
		         	// 페이지 새로 고침
	                location.reload();
		        },
		        error: function(xhr, status, error) {
		            // 요청 실패 시 처리할 로직
		            alert('재고 업데이트에 실패했습니다. 오류: ' + error);
		            console.error(xhr); // 오류 로그
		        }
		    });
		});
		$('#changePriceButton').click( function () {
			// 체크된 체크박스가 있는지 확인
		    var checkedCount = $('.item-checkbox:checked').length;
		    if (checkedCount === 0) {
		        // 체크박스가 선택되지 않은 경우
		        alert('체크박스를 선택해야 합니다.');
		    }
		    
			// 체크된 체크박스 가져오기
		    var checkedRows = $('.item-checkbox:checked');
			// 체크된 줄이 없을 경우 경고
	        if (checkedRows.length === 0) {
	            alert('하나 이상의 상품을 선택해야 합니다.');
	            return;
	        }
			
	        var currentProductId ="";
	        checkedRows.each(function() {
	            var productRow = $(this).closest('tr'); // 체크박스가 있는 행q
	            currentProductId = productRow.find('td:nth-child(2)').text(); // 판매 상태가 있는 열의 인덱스
	        });
	        
	        var product_price = prompt("변경할 판매가를 입력하세요.");
			
	  		// 입력값이 숫자인지 유효성 검사
	        if (product_price === null || isNaN(product_price) || product_price.trim() === "" || Number(product_price) < 0) {
	            alert("유효한 판매가를 입력하세요. (0 이상의 숫자여야 합니다.)");
	            return; // 함수 종료
	        }

		    // 숫자로 변환
		    product_price = Number(product_price);
		    
		    console.log(product_price);
		    	
		    var data = {
                currentProductId: currentProductId,
                product_price : product_price
            };
		    
		 	// AJAX 요청
		    $.ajax({
		        url: '/store/products/updatePrice', // 요청할 URL
		        type: 'POST', // HTTP 메서드
		        contentType: 'application/json', // 요청 데이터 타입
		        data: JSON.stringify(data), // 데이터를 JSON 형식으로 변환
		        success: function(response) {
		            // 요청 성공 시 처리할 로직
		            alert('판매가를 성공적으로 업데이트되었습니다.');
		         	// 페이지 새로 고침
	                location.reload();
		        },
		        error: function(xhr, status, error) {
		            // 요청 실패 시 처리할 로직
		            alert('판매가를  업데이트에 실패했습니다. 오류: ' + error);
		            console.error(xhr); // 오류 로그
		        }
		    });
		});
		
    });
</script>
  </head>
  <body>
    <div class="container-scroller">
      <%@ include file="/WEB-INF/views/inc/admin_navbar_store.jsp"%>
      <div class="container-fluid page-body-wrapper">
        <%@ include file="/WEB-INF/views/inc/admin_sidebar_store.jsp"%>
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="d-xl-flex justify-content-between align-items-start">
              <h2 class="text-dark font-weight-bold mb-2">상품 조회/수정</h2>
              <div
                class="d-sm-flex justify-content-xl-between align-items-center mb-2"
              ></div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="tab-content tab-transparent-content">
                  <div
                    class="tab-pane fade show active"
                    id="business-1"
                    role="tabpanel"
                    aria-labelledby="business-tab"
                  >
                    <div class="row" style="color :#4d5159;">
                      <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                          <div style="background-color: #f8f9fd" class="card-body">
                            <div  class="col-lg-12 store-search" style="display: flex;">
                            	<div style="width: 180px">
    	                       		<h4>검색어</h4>
                            	</div>
                            	<div style="display: flex; align-items: center;">
                            		<div>
		                            	<label for="productName">상품명</label>
										<input type="text" id="productName" name="productName">
										<label for="manufacturerName">제조사명</label>
										<input type="text" id="manufacturerName" name="manufacturerName">
                            		</div>
                            		<div>
										<label for="brandName">브랜드명</label>
										<input type="text" id="brandName" name="brandName">
										<label for="category">카테고리</label>
										<input type="text" id="category" name="category">
                            		</div>
                            	</div>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="col-lg-12" style="display: flex;padding: 0.5em 0 0 0; ">
                           		<!-- <h4 style="margin-right: 170px">판매 선택</h4> -->
                           		<div style="width: 180px ">
    	                       		<h4 style="padding-left: 9px;">판매 선택</h4>
                            	</div>
							    <div style="display: flex;   ">
							        <label style="margin-left: 0.6rem;">
								        <input type="checkbox" id="selectAll"> 전체
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="승인대기" class="status-checkbox"> 승인대기
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="승인" class="status-checkbox"> 승인
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매중" class="status-checkbox"  checked> 판매중
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="품절" class="status-checkbox"> 품절
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매중지" class="status-checkbox"> 판매중지
								    </label>
							    </div>
                            </div>
                            <div class="dropdown-divider"></div>
                            
                            <div class="col-lg-12" style="display: flex;padding: 0.5em 0;">
                           		<div style="width: 180px">
    	                       		<h4 style="padding-left: 9px;padding-top: 9px">기간(상품 등록일)</h4>
                            	</div>
							    <div style="display: flex; margin-right: 0.5rem">
							        <button class="store-btn" id="selete-today">오늘</button>
								    <button class="store-btn" id="oneWeek">1주일</button>
								    <button class="store-btn" id="oneMonth">1개월</button>
								    <button class="store-btn" id="threeMonths">3개월</button>
								    <button class="store-btn" id="sixMonths">6개월</button>
								    <button class="store-btn" id="oneYear">1년</button>
								    <button class="store-btn" id="all">전체</button>
							    </div>
							    <input type="date" id="startDate">
							    <span style="line-height: 36px; margin: 0 0.5em	">~</span>
							     <input type="date" id="endDate" max="">
                            </div>
                            <div class="dropdown-divider"></div>
                            	<div class="search-btn" style=" padding-top: 1em; ">
	                            	<button class="search" >검색</button>
	                            	<button class="reset" >초기화</button>
                            	</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="tab-content tab-transparent-content">
                  <div
                    class="tab-pane fade show active"
                    id="business-1"
                    role="tabpanel"
                    aria-labelledby="business-tab"
                  >
                    <div class="row">
                      <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body">
                            <h4 class="card-title">
                              	상품 목록 (총 <span>0</span> 개)
                            </h4>
                            <div style="display: flex; justify-content: space-between;">
	                            <div class="btns-flex">
	                              <button class="store-btn select-delete" style="padding: 8px" >선택 삭제</button>
	                              <span style="line-height: 32px;">|</span>
	                              <select id="productStatus" style="font-size: 12px">
								      <option selected>판매변경</option>
								      <option>판매중</option>
								      <option>품절</option>
								      <option>판매중지</option>
								  </select>
	                              <span style="line-height: 32px;">|</span>
	                              <button id="changeSalesPeriodButton" class="store-btn">판매기간 변경</button>
								  <button id="changeStockQuantityButton" class="store-btn">재고수량 변경</button>
								  <button id="changePriceButton" class="store-btn">판매가 변경</button>
	                            </div>
	                           	<div>
	                           		<button class="store-btn" id="update-btn" style="padding: 8px">수정 변경</button>
	                           	</div>
                            </div>
                            <div style="width: 100%; overflow-x: auto; border: 1px solid #ccc; padding: 0;">
							    <div style="width: 2000px;">
							        <table border="1" style="width: 100%; table-layout: auto;">
							            <thead>
							                <tr style="font-size : 13px" >
							                    <th style="width: 30px; padding:7px 0px 0px;background:#f8f9fd"></th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">상품번호</th>
							                    <th style="width: 300px;padding-left: 8px;background:#f8f9fd">상품명</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">판매상태</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">옵션</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">재고수량</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">판매가</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">할인</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">기본 배송비</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">제조사명</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">브랜드명</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">판매 시작일</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">판매 종료일</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">상품 등록일</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">최종 수정일</th>
							                </tr>
							            </thead>
							        </table>
							        <div style="max-height: 400px; overflow-y: auto; height: 400px;color : #3d3d3d;font-size: 13px">
							            <table border="1" style="width: 100%; table-layout: fixed;" id="table_body">
							            </table>
							        </div>
							    </div>
							</div>


                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:/WEB-INF/views/inc/admin_footer.jsp -->
          <%@ include file="/WEB-INF/views/inc/admin_footer.jsp"%>
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
    <script src="${pageContext.request.contextPath}/resources/admin/vendors/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/dashboard.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>

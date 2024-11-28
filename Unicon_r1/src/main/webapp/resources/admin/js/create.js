let selectedCategory = null; // 이전에 선택된 카테고리를 추적하는 변수
    let selectedCategoryDetail = null; // 이전에 선택된 카테고리를 추적하는 변수
    const data = {};
    
    function category(value,type) {
    	// display 속성을 block으로 변경하여 보이게 함
        $('.selected-category-text').css('display', 'block');
    	 // 선택한 카테고리 출력
        $('.selected-category-text').html("선택한 카테고리 : " + type);
    	
        console.log(value, type);
     	// 기존 카테고리 값을 지우고 새로 선택된 카테고리 값을 저장
        data.category = type;
     	
        // 이전 선택된 카테고리가 있다면 색상 초기화
        if (selectedCategory) {
            $("#category" + selectedCategory).css('color', '#000000'); // 이전 카테고리 색상 변경
        }
    	if (selectedCategoryDetail) {
			$("#categoryDetail" + selectedCategoryDetail).css('color', '#000000'); // 해당 카테고리 span 색상 변경
    	}
    	 
		// 처음 선택한 카테고리의 span 색상 변경
		$("#category" + value).css('color', '#bf94e4'); // 해당 카테고리 span 색상 변경
		// 현재 선택한 카테고리 값을 저장
	    selectedCategory = value;
		
		
		// category-detail 안의 내용을 초기화
	    $('.category-detail').empty();
		
		
		$.ajax({
		    url: '/store/category/'+value, // 요청할 API URL
		    type: 'GET', // 요청 방식 (GET, POST, PUT, DELETE 등)
		    success: function(response) {
		        console.log('성공:', response);
		        // 응답 처리 로직
		        
		        
		        
		        // category_value를 콤마로 분리하여 배열로 변환
				const categories = response[0].category_value.split(',');
		        
				// 배열의 각 요소에 대해 버튼을 생성하고 append
				categories.forEach(function(category, index) {
				    // 버튼 HTML 생성 (따옴표 사용)
				    const button = '<button onclick="categoryDetail(\'' + category + '\', ' + index + ')">' +
				                   '<span id="categoryDetail' + index + '">' + category + '</span>' + // 인덱스를 사용하여 고유한 ID 생성
				                   '<i class="mdi mdi-chevron-right"></i>' +
				                   '</button>';
				    
				    // category-detail 클래스 안에 버튼 추가
				    $('.category-detail').append(button);
				});

		        
		    },
		    error: function(xhr, status, error) {
		        console.error('오류:', error);
		        // 오류 처리 로직
		    }
		});

    }
 	// categoryDetail 함수 정의
    function categoryDetail(category, index) {
		// 처음 선택한 카테고리의 span 색상 변경
		if (selectedCategoryDetail) {
			$("#categoryDetail" + selectedCategoryDetail).css('color', '#000000'); // 해당 카테고리 span 색상 변경
    	}
		selectedCategoryDetail = index;
		$("#categoryDetail" + index).css('color', '#bf94e4'); // 해당 카테고리 span 색상 변경
		
		// 기존 카테고리 값을 지우고 새로 선택된 카테고리 값을 저장
	    data.categoryDetail = category;
		
	    // 선택된 카테고리에 대한 정보를 출력할 HTML에 추가
	    $('.selected-category-text').html("선택한 카테고리 : " + data.category + ' <i class="mdi mdi-chevron-right"></i>'+category);
	}
 	
    function closeBox(value) {
        if ('category' == value) {
            // 요소의 현재 display 상태를 확인하고 토글
            const $Box = $('.closeBox-category');
            if ($Box.css('display') === 'none') {
                $Box.css('display', 'block'); // 숨겨져 있으면 보여줌
            } else {
                $Box.css('display', 'none'); // 보여져 있으면 숨김
            }
        } else if('productName' == value) {
        	// 요소의 현재 display 상태를 확인하고 토글
            const $Box = $('.closeBox-productName');
            if ($Box.css('display') === 'none') {
                $Box.css('display', 'block'); // 숨겨져 있으면 보여줌
            } else {
                $Box.css('display', 'none'); // 보여져 있으면 숨김
            }
        }
        
    }
    
    $(document).ready(function() {
        $('#textInput').focus(function() {
            $(this).closest('.input-container').addClass('focused'); // 포커스 시 클래스 추가
            $('#error-message').hide(); // 에러 메시지 숨김
        });

        $('#textInput').blur(function() {
            const inputVal = $(this).val().trim();
            const $inputContainer = $(this).closest('.input-container');

            if (inputVal === '') {
                $inputContainer.css('border-color', 'lightcoral'); // 비어 있을 때 테두리 색상 변경
                $('#error-message').show(); // 에러 메시지 표시
            } else {
                $inputContainer.removeClass('focused').css('border-color', '#ccc'); // 입력된 경우 원래 색상으로
            }
        });

        $('#textInput').on('input', function() {
            const textLength = $(this).val().length;
            $('#currentCount').text(textLength); // 변경되는 숫자만 업데이트

            // 전체 문자 수는 항상 /100으로 설정
            $('#charCount').text(textLength + '/100'); // 문자 수 전체 업데이트

            // 입력이 시작되면 에러 메시지 숨기기
            if ($(this).val().trim() !== '') {
                $('#error-message').hide();
                $(this).closest('.input-container').css('border-color', '#bf94e4'); // 원래 색상으로 변경

                // 입력된 값을 data 객체에 저장
                data.productName = $(this).val().trim(); // productName 키에 값 저장
            } else {
                $('#error-message').show(); // 입력이 없으면 에러 메시지 표시
                $(this).closest('.input-container').css('border-color', 'lightcoral'); // 경고 색상으로 변경

                // 입력이 없을 경우 data 객체에서 값 삭제
                delete data.productName; // productName 키 삭제
            }
            
            console.log(data.productName);
        });
        $('#price').on('input blur', function(event) {
            var value = $(this).val().replace(/,/g, ''); // 콤마 제거
            var $this = $(this);
            // 빈값 체크
            if (value.trim() === "") {
                $this.addClass('error-border'); // 빨간색 테두리 추가
            }else {
            	$this.removeClass('error-border'); // 빨간색 테두리 제거
            }
            if (parseInt(value) % 10 !== 0) {
            	 $('.price-error-messag').css({
                     display: 'block'
                 }); // 오류 메시지 숨김
            } else {
            	 $('.price-error-messag').css({
                     display: 'none'
                 }); // 오류 메시지 숨김
            }
            // 숫자가 아닐 경우 숫자가 아닌 문자 제거
            if (!/^\d*$/.test(value)) {
                $(this).val(value.replace(/[^0-9]/g, '')); // 숫자가 아닌 문자 제거
            } else {
                if (event.type === 'blur') {
                    // 콤마 추가
                    var formattedValue = formatNumber(value);
                    $(this).val(formattedValue);
                }
            }
        });
        function formatNumber(num) {
            return num.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        $('#discount').on('input', function() {
            var value = $(this).val();
            // 숫자가 아닐 경우 숫자가 아닌 문자 제거
            if (!/^\d*$/.test(value)) {
                $(this).val(value.replace(/[^0-9]/g, '')); // 숫자가 아닌 문자 제거
            }
            // 최대값 100 설정
            if (value > 100) {
                $(this).val(100); // 100 초과 시 100으로 설정
            }
        });

        $('#discount').on('blur', function() {
            var value = $(this).val();
            // 빈 값일 경우 0으로 설정
            if (value === "") {
                $(this).val(0);
            }
        });
        
        function toggleButtons(isSettingOn) {
            if (isSettingOn) {
                $('#set-on').addClass('setting-active').removeClass('setting-inactive');
                $('#set-off').removeClass('setting-active').addClass('setting-inactive');
            } else {
                $('#set-off').addClass('setting-active').removeClass('setting-inactive');
                $('#set-on').removeClass('setting-active').addClass('setting-inactive');
            }
        }

        $('#set-on').on('click', function() {
            toggleButtons(true); // 설정함 버튼 클릭
            // sales-period 클래스 속성을 flex로 변경
            $('.sales-period').css({
                display: 'flex'
            });
        });

        $('#set-off').on('click', function() {
            toggleButtons(false); // 설정안함 버튼 클릭
            // sales-period 클래스 속성을 flex로 변경
            $('.sales-period').css({
                display: 'none'
            });
        });
        function toggleButtons1(isSettingOn) {
        	if (isSettingOn) {
        		$('#discount-set-on').addClass('setting-active').removeClass('setting-inactive');
        		$('#discount-set-off').removeClass('setting-active').addClass('setting-inactive');
        	} else {
        		$('#discount-set-off').addClass('setting-active').removeClass('setting-inactive');
        		$('#discount-set-on').removeClass('setting-active').addClass('setting-inactive');
        	}
        }
        
        $('#discount-set-on').on('click', function() {
        	toggleButtons1(true); // 설정함 버튼 클릭
        	// sales-period 클래스 속성을 flex로 변경
        	$('.discount-box').css({
        		display: 'flex'
        	});
        	$('.price-discount').css({
        		display: 'block'
        	});
        	$('.custom-dropdown-divider').css({
        		display: 'block'
        	});
        });
        
        $('#discount-set-off').on('click', function() {
        	toggleButtons1(false); // 설정안함 버튼 클릭
        	// sales-period 클래스 속성을 flex로 변경
        	$('.discount-box').css({
        		display: 'none'
        	});
        	$('.price-discount').css({
        		display: 'none'
        	});
        	$('.custom-dropdown-divider').css({
        		display: 'none'
        	});
        });
     // 오늘 날짜 설정
        const today = new Date();
        
        // 날짜를 YYYY-MM-DD 형식으로 변환하는 함수
        function formatDate(date) {
            return date.toISOString().split('T')[0];
        }

        // Flatpickr 인스턴스 생성
        const picker = flatpickr(".date-picker", {
            mode: "range", // 범위 선택 모드
            dateFormat: "Y-m-d",
            locale: "ko",
            minDate: today,
            position: 'below', // 달력을 입력 박스 아래에 표시
            onChange: onDateChange // onChange 핸들러를 별도로 정의
        });

        function onDateChange(selectedDates) {
            // 선택된 날짜 범위를 입력 필드에 넣기
            const startDate = selectedDates[0] ? flatpickr.formatDate(selectedDates[0], "Y-m-d") : "";
            const endDate = selectedDates[1] ? flatpickr.formatDate(selectedDates[1], "Y-m-d") : "";

            // 시작일과 종료일을 입력 필드에 표시
            $(".date-input").val(startDate + (endDate ? " - " + endDate : ""));
        }

        // 날짜 범위를 설정하는 공통 함수
        function setDateRange(days) {
            const startDate = today; // 오늘 날짜 사용
            const endDate = new Date();
            endDate.setDate(endDate.getDate() + days); // 종료 날짜를 오늘 + days로 설정
            
            // 날짜 범위 설정
            picker.setDate([startDate, endDate]); // Flatpickr에 날짜 설정
            
            // onChange 이벤트 수동 호출
            onDateChange([startDate, endDate]); // 정의한 핸들러 호출
        }

        // 버튼 클릭 이벤트에 setDateRange 함수 연결
        $('#today').click(function() {
            setDateRange(0); // 오늘
        });

        $('#sevenDays').click(function() {
            setDateRange(7); // 7일
        });

        $('#thirtyDays').click(function() {
            setDateRange(30); // 30일
        });

        $('#sixtyDays').click(function() {
            setDateRange(60); // 60일
        });

        $('#oneHundredTwentyDays').click(function() {
            setDateRange(120); // 120일
        });
        function calculateDiscountPrice() {
            var price = parseFloat($('#price').val().replace(/,/g, '')); // 판매가
            var discountRate = parseFloat($('#discount').val()); // 할인율

            // 유효성 검사
            if (isNaN(price) || price < 0) {
                $('.price-error').text('올바른 판매가를 입력하세요.'); // 오류 메시지 업데이트
                $('.discount-price').text('0'); // 초기화
                return;
            }

            if (isNaN(discountRate) || discountRate < 0 || discountRate > 100) {
                $('.discount-error').text('올바른 할인율을 입력하세요.'); // 오류 메시지 업데이트
                $('.discount-price').text('0'); // 초기화
                return;
            }
            
            // 할인 가격 계산
            var discountPrice = price * (1 - discountRate / 100);
            var discountAmount = price - discountPrice; // 할인된 금액 계산
            
            $('.discount-price').text(discountPrice.toLocaleString()); // 원화 포맷팅
            $('.discount-amount').text(discountAmount.toLocaleString()); // 할인 금액 포맷팅

        }

        // 이벤트 리스너
        $('#price, #discount').on('input', function() {
            calculateDiscountPrice();
        });
        
        $(".i-tooltip").click(function(event) {
            event.stopPropagation(); // 클릭 이벤트 전파 방지
            $("#tooltip-info").toggle(); // 툴팁 보이기/숨기기
        });

        $(document).click(function() {
            $("#tooltip-info").hide(); // 전체 문서 클릭 시 툴팁 숨기기
        });
        
        let optionCount = 1; // 옵션 카운터 초기화

     // 옵션 추가
     $(document).on("click", ".option-add", function () {
         if (optionCount < 3) {
             optionCount++; // 옵션 카운터 증가
             const newOption =
                 '<div class="display-f" style="align-items: unset; margin: 0 0 1rem 0;">' +
                     '<div class="store-input-container start" style="flex-direction: column; gap: 1rem;">' +
                         '<label style="display: none;" for="option-name-' + optionCount + '">옵션명</label>' +
                         '<div id="option-name-wrapper" class="option-wrapper">' +
                             '<input style="width: 15rem;" id="option-name-' + optionCount + '" class="option-input" type="text" placeholder="예시:컬러" name="option-productNames">' +
                         '</div>' +
                     '</div>' +
                     '<div class="store-input-container start" style="flex-direction: column; gap: 1rem;">' +
                         '<label style="display: none;" for="option-value-' + optionCount + '">옵션값</label>' +
                         '<div id="option-value-wrapper" class="option-wrapper">' +
                             '<input style="width: 15rem;" id="option-value-' + optionCount + '" class="option-input" type="text" placeholder="예시:컬러" name="option-productValues">' +
                         '</div>' +
                     '</div>' +
                     '<div class="store-input-container start">' +
                         '<div>' +
                             '<button style="position: relative;top: -8px;" class="option-remove"><i class="mdi mdi-minus-box"></i></button>' +
                             '<button style="position: relative;top: -8px;" class="option-add"><i class="mdi mdi-plus-box"></i></button>' +
                         '</div>' +
                     '</div>' +
                 '</div>';
             
             $("#options-container").append(newOption);
         }
     });

     // 옵션 삭제
     $(document).on("click", ".option-remove", function () {
         const closestOption = $(this).closest(".display-f");
         closestOption.remove(); // 해당 옵션 삭제
         optionCount--; // 옵션 카운터 감소
         updateOptionIds(); // ID 업데이트 함수 호출

         // 버튼 보이기
         if (optionCount === 1) {
             $(".option-add").first().show(); // 1번 버튼 다시 보이기
         } else if (optionCount === 2) {
             $(".option-add").last().show(); // 2번 버튼 다시 보이기
         }
     });

     // ID 업데이트 함수
     function updateOptionIds() {
         $(".display-f").each(function (index) {
             const newIndex = index + 1; // 1부터 시작하는 인덱스
             $(this)
                 .find('input[id^="option-name-"]')
                 .attr("id", "option-name-" + newIndex);
             $(this)
                 .find('input[id^="option-value-"]')
                 .attr("id", "option-value-" + newIndex);
             $(this)
                 .find('label[for^="option-name-"]')
                 .attr("for", "option-name-" + newIndex);
             $(this)
                 .find('label[for^="option-value-"]')
                 .attr("for", "option-value-" + newIndex);
         });
     }
     // 2번 버튼의 + 클릭 시 3번 버튼의 - 버튼만 보이게 하기
     $(document).on("click", ".option-add", function () {
         if (optionCount === 2) {
        	 $(".option-add").first().hide(); // 1번 버튼 숨기기
             $(this).hide(); // 2번 버튼 숨기기
         }	else if (optionCount === 3) {
             $(".option-add").last().prev().hide(); // 2번 버튼 숨기기
         }
         
         // 1번 버튼 숨기기
         if (optionCount === 2) {
         } 
     });
     
     
     
     
     
     
     /*=============== 이미지 미리보기 ===============*/
		$('.image-input').on('change', function(e) {
			const file = e.target.files[0];
			const reader = new FileReader();
			
			const inputId = e.target.id;
			const previewId = '#image-preview' + inputId.charAt(inputId.length - 1);
			const plusIconId = '#plusIcon' + inputId.charAt(inputId.length - 1);
			
			const fileTypeFilter = /(\.jpg|\.jpeg|\.png|\.gif|\.bmp|\.tiff|\.webp|\.svg|\.heic|\.ico|\.raw)$/i;
			
			if (file) {
				if(fileTypeFilter.exec(file.name)) {
					reader.onload = function(e) {
						$(previewId).attr('src', e.target.result).show();
						$(plusIconId).hide();
					}
					reader.readAsDataURL(file);
				} else {
					$(this).val('');
				}
			} else {
				$(previewId).hide();
				$(plusIconId).show();
			}
		});
		/*=============== 이미지 미리보기 ===============*/
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     

    });
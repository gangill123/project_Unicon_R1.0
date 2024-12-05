	let selectedCategory = null; // 이전에 선택된 카테고리를 추적하는 변수
    let selectedCategoryDetail = null; // 이전에 선택된 카테고리를 추적하는 변수
    let data = {};
    
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
 	
    function closeBox(button,value) {
    	// 첫 번째 아이콘과 두 번째 아이콘을 선택
        var downIcon = $(button).find('.mdi-chevron-down');
        var upIcon = $(button).find('.mdi-chevron-up');
        
        console.log(button);
        console.log(downIcon);
        console.log(upIcon);

        // 아이콘을 토글
        downIcon.toggle();
        upIcon.toggle();

        // active 클래스 토글
        downIcon.toggleClass('active');
        upIcon.toggleClass('active');
    	
     // display 상태에 따라 박스 토글
        let $Box;
        switch (value) {
            case 'category':
                $Box = $('.closeBox-category');
                break;
            case 'productName':
                $Box = $('.closeBox-productName');
                break;
            case 'option':
                $Box = $('.closeBox-option');
                break;
            case 'price':
                $Box = $('.closeBox-price');
                break;
            case 'img':
                $Box = $('.closeBox-img');
                break;
            case 'stock':
            	$Box = $('.closeBox-stock');
            	break;
            case 'content':
                $Box = $('.closeBox-content');
                break;
            case 'detail':
                $Box = $('.closeBox-detail');
                break;
            default:
                return; // 알 수 없는 경우 함수 종료
        }

        // 요소의 현재 display 상태를 확인하고 토글
        if ($Box.css('display') === 'none') {
            $Box.css('display', 'block'); // 숨겨져 있으면 보여줌
        } else {
            $Box.css('display', 'none'); // 보여져 있으면 숨김
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
                data.price = value;
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
            
            data.discount = value;
            console.log(value);
        });

        $('#discount').on('blur', function() {
            var value = $(this).val();
            // 빈 값일 경우 0으로 설정
            if (value === "") {
                $(this).val(0);
            }
        });
        
        $('.input-stock').on('input', function() {
            var value = $(this).val();
            // 숫자가 아닐 경우 숫자가 아닌 문자 제거
            if (!/^\d*$/.test(value)) {
                $(this).val(value.replace(/[^0-9]/g, '')); // 숫자가 아닌 문자 제거
            }
            
            data.stock = value;
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
            
            
            delete data.endDate;
            
            
        });
        
        // 할인 버튼 제어
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
        // 할인 버튼 제어
        
        
        // 옵션 버튼 제어
        function toggleButtons2(isSettingOn) {
        	if (isSettingOn) {
        		$('#option-set-on').addClass('setting-active').removeClass('setting-inactive');
        		$('#option-set-off').removeClass('setting-active').addClass('setting-inactive');
        	} else {
        		$('#option-set-off').addClass('setting-active').removeClass('setting-inactive');
        		$('#option-set-on').removeClass('setting-active').addClass('setting-inactive');
        	}
        }
        
        $('#option-set-on').on('click', function() {
        	
        	
        	toggleButtons2(true); // 설정안함 버튼 클릭
        	$('.option-box').css({
        		display: 'block'
        	});
        });
        
        $('#option-set-off').on('click', function() {
        	toggleButtons2(false); // 설정안함 버튼 클릭
        	$('.option-box').css({
        		display: 'none'
        	});
        });
        // 옵션 버튼 제어
        
        
        // 메인이미지 버튼 제어
        $('#option-set-on').on('click', function() {
        	$('.option-box').css({
        		display: 'block'
        	});
        });
        // 메인이미지 버튼 제어
        
        // 메인이미지 버튼 제어
        $('#option-set-off').on('click', function() {
        	$('.option-box').css({
        		display: 'none'
        	});
        });
        // 메인이미지 버튼 제어
        
        
        
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
             
             data.startDate = startDate;
             data.endDate = endDate;
            
            
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

        $('#set-on').click(function() {
        	setDateRange(0); // 오늘
        });
        
        
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
                $('.discount-price').text('0'); // 초기화
                return;
            }

            if (isNaN(discountRate) || discountRate < 0 || discountRate > 100) {
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
        $(".img-tooltip").click(function(event) {
        	event.stopPropagation(); // 클릭 이벤트 전파 방지
        	$("#img-tooltip-info").toggle(); // 툴팁 보이기/숨기기
        });

        $(document).click(function() {
            $("#tooltip-info").hide(); // 전체 문서 클릭 시 툴팁 숨기기
            $("#img-tooltip-info").hide(); // 전체 문서 클릭 시 툴팁 숨기기
        });
        
        let optionCount = 1; // 옵션 카운터 초기화

     // 버튼 가시성 업데이트 함수
        function updateButtonVisibility() {
            $(".option-add").show(); // 모든 추가 버튼을 보이도록 설정

            if (optionCount >= 2) {
                $(".option-add").hide(); // 2개 이상일 경우 첫 번째 버튼 숨기기
            }
        }

        // 옵션 추가
        $(document).on("click", ".option-add", function () {
            if (optionCount < 2) { // 최대 2개까지 추가 가능
                optionCount++; // 옵션 카운터 증가
                addOption();
                updateButtonVisibility(); // 버튼 가시성 업데이트
            }
            updateApplyButtonState(); // 버튼 활성화 상태 업데이트
            updateSelectValue(); // select 박스 값 업데이트
        });

        // 옵션 삭제
        $(document).on("click", ".option-remove", function () {
            $(this).closest(".display-f").remove(); // 해당 옵션 삭제
            optionCount--; // 옵션 카운터 감소
            updateButtonVisibility(); // 버튼 가시성 업데이트
            updateApplyButtonState(); // 버튼 활성화 상태 업데이트
            updateSelectValue(); // select 박스 값 업데이트
        });

        // 옵션 추가 함수
        function addOption() {
            const newOption =
                '<div class="display-f" style="align-items: unset; margin: 0 0 1rem 0;">' +
                    '<div class="store-input-container start" style="flex-direction: column; gap: 1rem;">' +
                        '<label  style="display: none;" for="option-name-' + optionCount + '">옵션명</label>' +
                        '<div id="option-name-wrapper" class="option-wrapper">' +
                            '<input style="width: 15rem;" id="option-name-' + optionCount + '" class="option-input" type="text" placeholder="예시:사이즈" name="option-productNames">' +
                        '</div>' +
                    '</div>' +
                    '<div class="store-input-container start" style="flex-direction: column; gap: 1rem;">' +
                        '<label  style="display: none;" for="option-value-' + optionCount + '">옵션값</label>' +
                        '<div  id="option-value-wrapper" class="option-wrapper">' +
                            '<input style="width: 15rem;" id="option-value-' + optionCount + '" class="option-input" type="text" placeholder="예시: S,M,L,XL,2XL" name="option-productValues">' +
                        '</div>' +
                    '</div>' +
                    '<div class="store-input-container start">' +
                        '<div>' +
                            '<button  style="position: relative;top: -8px;" class="option-remove"><i class="mdi mdi-minus-box"></i></button>' +
                            '<button  style="position: relative;top: -8px;" class="option-add"><i class="mdi mdi-plus-box"></i></button>' +
                        '</div>' +
                    '</div>' +
                '</div>';

            $("#options-container").append(newOption); // 새로운 옵션 추가
        }

        // select 박스 값 업데이트 함수
        function updateSelectValue() {
            $("select").val(optionCount); // 옵션 개수로 select 박스 값 설정
        }

        // 초기 상태에서 버튼 가시성 설정
        $(document).ready(function() {
            updateButtonVisibility(); // 초기 버튼 가시성 설정
            updateApplyButtonState();
            setDateRange(0);
        });

        // select-option 클릭 이벤트
        $(document).on("change", ".select-option", function () {
            const selectedValue = parseInt($(this).val()); // 클릭된 옵션의 값을 가져오기
            manageOptions(selectedValue);
            updateApplyButtonState();
            
        });
        
        // select-delivery-company의 change 이벤트
        $(document).on("change", ".select-delivery-company", function () {
            const selectedValue = $(this).val(); // 선택된 옵션의 값을 가져오기
            if('select' == selectedValue) {
            	alert("다른 택배사를 선택하세요.");
            }else  {
            	data.delivery_company = selectedValue;
            }
            
            console.log("선택된 택배사 : " + selectedValue);
        });
        
        

        // 옵션 관리 함수
        function manageOptions(selectedValue) {
            let currentOptions = $("#options-container .display-f").length; // 현재 옵션 수

            while (currentOptions < selectedValue) {
                optionCount++;
                addOption();
                currentOptions++; // 옵션 수 증가
            }

            while (currentOptions > selectedValue) {
                removeOption();
                currentOptions--; // 옵션 수 감소
            }

            updateSelectValue(); // select 박스 값 업데이트
            updateButtonVisibility(); // 버튼 가시성 업데이트
            console.log("옵션 셀렉트 박스");
            updateApplyButtonState();
        }
        // 옵션 제거 함수
        function removeOption() {
            // 마지막 옵션 제거 (가장 최근에 추가된 옵션)
            $("#options-container .display-f").last().remove(); 
            optionCount--; // 옵션 카운터 감소
            updateSelectValue(); // select 박스 값 업데이트
            updateApplyButtonState(); // 초기 상태에서 버튼 활성화 설정
        }

        // 입력 필드 변경 이벤트
        $(document).on("input", ".option-input", function() {
            updateApplyButtonState(); // 입력값이 변경될 때마다 상태 업데이트
        });
        

        // 모든 입력 필드가 채워졌는지 확인하고 .option-list-apply 버튼 상태 업데이트
        function updateApplyButtonState() {
            let allFilled = true; // 모든 필드가 채워졌는지 확인하는 플래그

            $("#options-container .display-f").each(function() {
                const optionName = $(this).find('input[id^="option-name-"]').val(); // 옵션명
                const optionValue = $(this).find('input[id^="option-value-"]').val(); // 옵션값
                
                // 옵션명 또는 옵션값이 비어있으면
                // 옵션명 또는 옵션값이 비어있거나 undefined일 경우
                if (!optionName || !optionValue || !optionName.trim() || !optionValue.trim()) {
                    allFilled = false; // 하나라도 비어있으면 false로 설정
                }
            });

            // .option-list-apply 버튼 상태 업데이트
            $(".option-list-apply").prop("disabled", !allFilled).toggleClass('disabled', !allFilled);
        };
        
       
        $('.option-list-apply').on('click', function() {
            let optionData = { options: [] };
            
            $("#options-container .display-f").each(function() {
                const optionName = $(this).find('input[id^="option-name-"]').val(); // 옵션명
                const optionValue = $(this).find('input[id^="option-value-"]').val(); // 옵션값
                
                console.log(optionName);
                console.log(optionValue);
                
                // 비어 있지 않은 경우에만 데이터 추가
                if (optionName.trim() && optionValue.trim()) {
                    optionData.options.push({ name: optionName, value: optionValue }); // 배열에 객체 추가
                }
            });
            
            // .option-list-header 초기화 후 길이가 1일 경우 추가
            $('.option-list-header').html(''); // 기존 내용 초기화
            $('.option-list-body').html(''); // .option-list-body 초기화
            
            // 라디오 버튼 체크 상태 확인
            if ($('#single').is(':checked')) {
            	// 단독형일때 + 길이 1
            	if (optionData.options.length == 1) {
                    var headerHtml = 
                    	 '<div style="width: 3.9%; padding: 0.7em 0;"><input type="checkbox"></div>' +
                    	 '<div style="border-right: 1px solid; height: 86px;"></div>' +
                         '<div style=" width:48%; display: flex; flex-direction: column;" class="option-list-header">' +
                         '    <div style="	position: relative; top: 0px; padding: 10px 0;">' +
                         '        <span style="color:#000000">옵션명</span>' +
                         '    </div>' +
                         '</div>' +
                         '<div style="position: relative;left: -1px;border-right: 1px solid; height: 86px;"></div>' +
                         '<div style="width: 43%; padding: 0.7em 0; display: flex; align-items: center; justify-content: center; color:#000000;">옵션값</div>' +
                         '<div style="position: relative;left: -1px;border-right: 1px solid; height: 86px;"></div>' +
                         '<div style="width: 7%; padding: 0.7em 0; display: flex; align-items: center; justify-content: center; color:#000000;">삭제</div>';
                     
                     // 새로운 HTML 추가
                     $('.option-list-header').html(headerHtml);
                    
                    // optionValue를 ,를 기준으로 분리하여 추가
                    var optionValue = optionData.options[0].value; // 첫 번째 옵션의 값 가져오기
                    var values = optionValue.split(','); // 값을 ,로 분리
                    
                    values.forEach(function(value) {
                    	 var bodyHtml = 
                             '<div class="option-list" style="border-bottom: 1px solid #a7afb7;width: 100%; text-align: center; display: flex; align-items: center; justify-content: center; background-color: #fff; color: #000000;">' +
                             '    <div style="width: 4.12%;"><input type="checkbox"></div>' +
                             '    <div style="border-right: 1px solid; height: 30px; position: relative; color:#a7afb7"></div>' +
                             '    <div style="width: 50%;">' +
                             '        <div class="option-item-name">' + optionData.options[0].name +  
                             '		  </div>' + 
                             '    </div>' +
                             '    <div style="border-right: 1px solid; height: 30px; position: relative; right: -6px; color:#a7afb7"></div>' +
                             '    <div class="option-item-value" style="width: 46%;">'+ value.trim() +
                             '    </div>' +
                             '    <div style="border-right: 1px solid; height: 30px; position: relative; right: 1px; color:#a7afb7"></div>' +
                             '    <div style="width: 6%; display: flex; align-items: center; justify-content: center;">' +
                             '        <button  class="option-list-remove" style="border: none; background-color: transparent;">' +
                             '            <i class="mdi mdi-close"></i>' +
                             '        </button>' +
                             '    </div>' +
                             '</div>';
                         
                         // .option-list-body에 추가
                    	 
                         $('.option-list-body').append(bodyHtml);
                    });
                }else {
                	// 단독형 + 2줄
                	var headerHtml = 
                		'<div style="width: 3.9%; padding: 0.7em 0;"><input type="checkbox"></div>' +
                   	 '<div style="border-right: 1px solid; height: 86px;"></div>' +
                        '<div style=" width:48%; display: flex; flex-direction: column;" class="option-list-header">' +
                        '    <div style="	position: relative; top: 0px; padding: 10px 0;">' +
                        '        <span style="color:#000000">옵션명</span>' +
                        '    </div>' +
                        '</div>' +
                        '<div style="position: relative;left: -1px;border-right: 1px solid; height: 86px;"></div>' +
                        '<div style="width: 43%; padding: 0.7em 0; display: flex; align-items: center; justify-content: center; color:#000000;">옵션값</div>' +
                        '<div style="position: relative;left: -1px;border-right: 1px solid; height: 86px;"></div>' +
                        '<div style="width: 7%; padding: 0.7em 0; display: flex; align-items: center; justify-content: center; color:#000000;">삭제</div>';

                    // 새로운 HTML 추가
                    $('.option-list-header').html(headerHtml);
                    
                    // options 배열 순회
                    optionData.options.forEach(function(option) {
                        var optionValue = option.value; // 각 옵션의 값 가져오기
                        var values = optionValue.split(','); // 값을 ,로 분리
                        
                        values.forEach(function(value) {
                            var bodyHtml = 
                                '<div class="option-list" style="border-bottom: 1px solid #a7afb7; width: 100%; text-align: center; display: flex; align-items: center; justify-content: center; background-color: #fff; color: #000000;">' +
                                '    <div style="width: 4%;"><input type="checkbox"></div>' +
                                '    <div style="border-right: 1px solid; height: 30px; position: relative; color:#a7afb7;left: 1px;"></div>' +
                                '    <div style="width: 50%;">' +
                                '        <div class="option-item-name">' + option.name + '</div>' + // 옵션명과 값을 조합
                                '    </div>' +
                                '    <div style="border-right: 1px solid; height: 30px; position: relative; right: -7px; color:#a7afb7"></div>' +
                                '    <div class="editable-field option-item-value" style="width: 46%;">' + value.trim()  + '</div>' + //  옵션 값 추가
                                '    <div style="border-right: 1px solid; height: 30px; position: relative; right: 2px; color:#a7afb7"></div>' +
                                '    <div style="width: 6%; display: flex; align-items: center; justify-content: center;">' +
                                '        <button  class="option-list-remove" style="border: none; background-color: transparent;">' +
                                '            <i class="mdi mdi-close"></i>' +
                                '        </button>' +
                                '    </div>' +
                                '</div>';
                            
                            // .option-list-body에 추가
                            $('.option-list-body').append(bodyHtml);
                        });
                    });
                    removeOption();
                }
            } else {
            	// 조합형 + 길이 1
            	if (optionData.options.length == 1) {
            		const option = optionData.options[0];
                    const optionValue = option.value; // 각 옵션의 값 가져오기
                    const values = optionValue.split(','); // 값을 ,로 분리
            		console.log("조합형");
                    var headerHtml = 
                    	'<div style="width: 4.5%; padding: 0.7em 0;"><input type="checkbox"></div>' +
                        '<div style="border-right: 1px solid; border-left: 1px solid; width: 30%; display: flex; flex-direction: column;">' +
                        '    <div style="border-bottom: 1px solid; position: relative; top: 0px; padding: 10px 0;">' +
                        '        <span style="color:#000000">옵션명</span>' +
                        '    </div>' +
                        '    <div style="padding: 10px 0; color:#000000; height: 44px;" class="option-item-name">' +
                        '        ' + option.name + // 옵션명 추가
                        '    </div>' +
                        '</div>' +
                        '<div style="width: 29.9%; padding: 0.7em 0; display: flex; align-items: center; justify-content: center; color:#000000;">옵션가</div>' +
                        '<div style="border-right: 1px solid; height: 86px;position: relative;left: -0.5px;"></div>' +
                        '<div style="width: 30%; padding: 0.7em 0; display: flex; align-items: center; justify-content: center; color:#000000;">재고수량</div>' +
                        '<div style="border-right: 1px solid; height: 86px;"></div>' +
                        '<div style="width: 6.7%; padding: 0.7em 0; display: flex; align-items: center; justify-content: center; color:#000000;">삭제</div>';

                    // 헤더 추가
                    $('.option-list-header').append(headerHtml);
                    
                    // optionValue를 ,를 기준으로 분리하여 추가
                    
                    
                    
                    values.forEach(function(value) {
                    	 var bodyHtml = 
                    		 '<div class="option-list" style="border-bottom: 1px solid #a7afb7;width: 100%; text-align: center; display: flex; align-items: center; justify-content: center; background-color: #fff; color: #000000;">' +
                             '    <div style="width: 4%;"><input type="checkbox"></div>' +
                             '    <div style="border-right: 1px solid; height: 30px; position: relative; right: -1px; color:#a7afb7"></div>' +
                             '    <div style="width: 30%;">' +
                             '        <div class="option-item-value">' + value.trim() + '</div>' + // 옵션명 및 값
                             '    </div>' +
                             '    <div style="border-right: 1px solid; height: 30px; position: relative; right: 1px; color:#a7afb7"></div>' +
                             '    <div class="editable-field option-item-price" style="width: 30%; cursor: pointer;font-size: 14px;height: 30px;line-height: 28px;">0</div>' + // 기본 텍스트 설정
                             '    <div style="border-right: 1px solid; height: 30px; position: relative; right: 3px; color:#a7afb7"></div>' +
                             '    <div class="editable-field option-item-stock" style="width: 30%; cursor: pointer;font-size: 14px;height: 30px;line-height: 28px;">0</div>' + // 기본 텍스트 설정
                             '    <div style="border-right: 1px solid; height: 30px; position: relative; right: 2px; color:#a7afb7"></div>' +
                             '    <div style="width: 5%; display: flex; align-items: center; justify-content: center;">' +
                             '        <button  class="option-list-remove" style="border: none; background-color: transparent;">' +
                             '            <i class="mdi mdi-close"></i>' +
                             '        </button>' +
                             '    </div>' +
                             '</div>';
                         
                         // .option-list-body에 추가
                         $('.option-list-body').append(bodyHtml);
                    });
                }else {
                	// 조합형 + 2줄
                	var headerHtml = 
                		'<div style="width: 4%;padding: 0.7em 0 0.7em;"><input type="checkbox"></div>' +
                		'<div style="border-right: 1px solid; border-left: 1px solid;width: 40%;display: flex;flex-direction: column;" >' +
                		'    <div style="border-bottom: 1px solid;position: relative;top: 0px;padding: 10px 0;">' +
                		'        <span style="color:#000000">옵션명</span>' +
                		'    </div>' +
                		'    <div style="color:#000000;height: 44px; display: flex;align-items: center;">' +
                		'        <div style="width: 50%" class="option-item-name1">' + optionData.options[0].name + '</div>' +  // 첫 번째 옵션 이름
                		'        <div style="border-right: 1px solid;height:46px;color: #a7afb7;"></div>' +
                		'        <div style="width: 50%" class="option-item-name2">' + optionData.options[1].name + '</div>' +  // 두 번째 옵션 이름
                		'    </div>' +
                		'</div>' +
                		'<div style="width: 25%;padding: 0.7em 0 0.7em;display: flex;align-items: center;justify-content: center;color:#000000;">옵션가</div>' +
                		'<div style="border-right: 1px solid;height: 90px;"></div>' +
                		'<div style="width: 25%;padding: 0.7em 17px 0.7em 0;display: flex;align-items: center;justify-content: center;color:#000000;">재고수량</div>' +
                		'<div style="border-right: 1px solid;height: 90px;position: relative;left: -15px;"></div>' +
                		'<div style="width: 5%;padding:0.7em 0 0.7em 4px;display: flex;align-items: center;color:#000000;">삭제</div>';


                    // 새로운 HTML 추가
                    $('.option-list-header').html(headerHtml);
                    
                    
                    
                    let optionValue1 = optionData.options[0].value;
                    let optionValue2 = optionData.options[1].value;
                    let values1 = optionValue1.split(','); // 값을 ,로 분리
                    let values2 = optionValue2.split(','); // 값을 ,로 분리
                    
                   
                    // 모든 조합 생성
                    values1.forEach(function(value1) {
                        values2.forEach(function(value2) {
                            var bodyHtml = 
                            	'<div class="option-list" style="border-bottom: 1px solid #a7afb7;width: 100%; text-align: center; display: flex; align-items: center; justify-content: center; background-color: #fff; color: #000000;font-size: 14px;">' +
                                '    <div style="width: 4%;"><input type="checkbox"></div>' +
                                '    <div style="border-right: 1px solid; height: 30px; position: relative; right: -1px; color: #a7afb7;"></div>' +
                                '    <div style="width: 40%;">' +
                                '        <div style="display: flex; align-items: center;">' +
                                '            <div style="width: 50%" class="option-item-value1">' + value1 + '</div>' + // 첫 번째 값
                                '            <div style="border-right: 1px solid; height: 30px; color: #a7afb7;position: relative;left: 3px;"></div>' +
                                '            <div style="width: 50%;" class="option-item-value2">' + value2 + '</div>' + // 두 번째 값
                                '        </div>' +
                                '    </div>' +
                                '    <div style="border-right: 1px solid; height: 30px; position: relative; right: -6px; color: #a7afb7;"></div>' +
                                '    <div class="editable-field option-item-price" style="width: 25%; cursor: pointer;height: 30px;line-height: 28px;">0</div>' + // 기본 텍스트 설정
                                '    <div style="border-right: 1px solid; height: 30px; position: relative; right: -10.5px; color: #a7afb7;"></div>' +
                                '    <div class="editable-field option-item-stock" style="width: 25%; cursor: pointer;height: 30px;line-height: 28px;">0</div>' + // 기본 텍스트 설정
                                '    <div style="border-right: 1px solid; height: 30px; position: relative; right: 1px; color: #a7afb7;"></div>' +
                                '    <div style="width: 5%; display: flex; align-items: center; justify-content: center;">' +
                                '        <button class="option-list-remove" style="border: none; background-color: transparent;">' +
                                '            <i class="mdi mdi-close"></i>' +
                                '        </button>' +
                                '    </div>' +
                                '</div>';

                            // .option-list-body에 추가
                            $('.option-list-body').append(bodyHtml);
                        });
                    });
                    removeOption();
                }
            }
            
    		 // input 박스 값 초기화
           $("#options-container .display-f").find('input[id^="option-name-"]').val(""); // 옵션명
           $("#options-container .display-f").find('input[id^="option-value-"]').val(""); // 옵션값
           updateApplyButtonState();
            console.log(optionData);
        });
        
        
        // 클릭 시 입력 필드로 변경
        $(document).on('click', '.editable-field', function() {
            console.log("클릭됨");
            var currentText = $(this).text(); // 현재 텍스트 가져오기
            $(this).html('<input type="text" value="' + currentText + '" style="height: 30px; width: 95%; position: relative; left: 7px; top: -0px; border: 1px solid" />'); // 입력 필드로 변경

            // 입력 필드에서 포커스를 주고, 블러 이벤트로 텍스트 영역을 다시 변경
            $(this).find('input').focus().on('blur', function() {
                var newValue = $(this).val(); // 새 값 가져오기
                
                // 입력값이 비어있는 경우 0으로 설정
                if (newValue.trim() === '') {
                    newValue = '0'; // 빈 값일 경우 0으로 설정
                }
                
                $(this).parent().html(newValue); // 새로운 값으로 텍스트 변경
            });
        });
        

        $(document).on('click', '.option-list-remove', function() {
            // this를 사용하여 클릭한 버튼의 부모 요소인 option-list를 찾고 삭제
            $(this).closest('.option-list').remove();
        });
        
        // 클릭해서 input 아무값도 입력 하지 않으면 0으로 되게 해보자.       
        
        
        function optionCheck() {
        	data.option = {type : '', list : []};
        	/*data = { option: { type: '', list: [] } }; // 데이터 구조 초기화*/
        	if ($('#single').is(':checked')) {
            	// 각 .option-list 요소를 반복
                $(".option-list").each(function() {
                    // 현재 .option-list 요소에서 옵션명 가져오기
                    var optionName = $(this).find('.option-item-name').text().trim(); // 옵션명
                    var optionValue = $(this).find('.option-item-value').text().trim(); // 옵션값

                 // 객체 생성 후 data 객체에 추가
                    data.option.list.push({
                        option_name: optionName,
                        option_value: optionValue
                    });
                });
                data.option.type = '단독형';
                
                
            } else {
            	var optionName1 = $('.option-list-header').find('.option-item-name1').text().trim(); // 첫 번째 옵션명
            	console.log(optionName1);
            	
            	// 객체 생성 후 data 객체에 추가
                data.option.type = '조합형'; // 조합형으로 설정
            	
            	if (!optionName1) {
            		// 조합형 + 길이 1
                	
            		var optionName = $('.option-list-header').find('.option-item-name').text().trim(); // 첫 번째 옵션명
            		
            		
                    
                    
                	$(".option-list").each(function() {
                        // 현재 .option-list 요소에서 옵션명 가져오기
                        var optionValue = $(this).find('.option-item-value').text().trim(); // 옵션값
                        var optionPrice = $(this).find('.option-item-price').text().trim(); // 옵션값
                        var optionStock = $(this).find('.option-item-stock').text().trim(); // 옵션값

                        // 객체 생성 후 배열에 추가
                        data.option.list.push({
                            option_name: optionName,
                            option_value: optionValue,
                            option_price: optionPrice,
                            option_stock: optionStock
                        });
                    });
                }else {
                	// 조합형 + 길이 2
                	var optionName1 = $('.option-list-header').find('.option-item-name1').text().trim(); // 옵션명
                	var optionName2 = $('.option-list-header').find('.option-item-name2').text().trim(); // 옵션명
                	
                	$(".option-list").each(function() {
                        // 현재 .option-list 요소에서 옵션명 가져오기
                        var optionValue1 = $(this).find('.option-item-value1').text().trim(); // 옵션값
                        var optionValue2 = $(this).find('.option-item-value2').text().trim(); // 옵션값
                        var optionPrice = $(this).find('.option-item-price').text().trim(); // 옵션값
                        var optionStock = $(this).find('.option-item-stock').text().trim(); // 옵션값

                        // 객체 생성 후 배열에 추가
                        data.option.list.push({
                            option_name1: optionName1,
                            option_value1: optionValue1,
                            option_name2: optionName2,
                            option_value2: optionValue2,
                            option_price: optionPrice,
                            option_stock: optionStock
                        });
                    });
                }
            }
        	
            // 결과 출력
            console.log("옵션 리스트:", data.option.list);
        }
     
        /*=============== 이미지 미리보기 && 이미지 빈칸 제어 ===============*/
		$('.image-input').on('change', function(e) {
			const file = e.target.files[0];
			const reader = new FileReader();
			const inputId = e.target.id;
			const idNoNum = inputId.replace(/\d+/g, '');
			const idNum = inputId.charAt(inputId.length - 1);
			const previewId = '#image-preview' + idNum;
			const plusIconId = '#plusIcon' + idNum;
			const fileTypeFilter = /(\.jpg|\.jpeg|\.png|\.gif|\.bmp|\.tiff|\.webp|\.svg|\.heic|\.ico|\.raw)$/i;
			
			if (file) {
				 if(fileTypeFilter.exec(file.name)) {
					 switch(idNum) {
					 	case '1': {
					 		reader.readAsDataURL(file);
							reader.onload = function(e) {
								$(previewId).attr('src', e.target.result).show();
								$(plusIconId).hide();
							}
							break;
					 	}
						case '2': {
							if($('#' + idNoNum + (idNum - 1)).val() == '') {
								// 객체에 파일을 저장함. 데이터를 옮기기 위해서
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								
								// image-input2 value 값을 지움.
								$('#' + idNoNum + idNum).val('');
								
								// image-preview src 지우는 동작
								$('#image-preview' + idNum).removeAttr('src');
								
								// 옮길 데이터를 image-input1 value에 files에 데이터 옮김.					
								$('#' + idNoNum + (idNum - 1))[0].files = adataTransfer.files;
								
								// image-input1 이벤트를 수동으로 동작시킴(반복)
								$('#' + idNoNum + (idNum - 1))[0].dispatchEvent(new Event('change'));
							} else {
								// 이전의 값이 비어있지 않으면 그대로 미리보기 됨.
								reader.readAsDataURL(file);
								reader.onload = function(e) {
									$(previewId).attr('src', e.target.result).show();
									$(plusIconId).hide();
								}
							}
							break;
						}
						case '3': {
							if($('#' + idNoNum + (idNum - 2)).val() == '' 
									&& $('#' + idNoNum + (idNum - 1)).val() == '') {
								const adataTransfer = new DataTransfer();
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								$('#' + idNoNum + idNum).val('');
								$('#image-preview' + idNum).removeAttr('src');
								$('#' + idNoNum + (idNum - 2))[0].files = adataTransfer.files;
								$('#' + idNoNum + (idNum - 2))[0].dispatchEvent(new Event('change'));
							} else if($('#' + idNoNum + (idNum - 1)).val() == '') {
								const adataTransfer = new DataTransfer();
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								$('#' + idNoNum + idNum).val('');
								$('#image-preview' + idNum).removeAttr('src');
								$('#' + idNoNum + (idNum - 1))[0].files = adataTransfer.files;
								$('#' + idNoNum + (idNum - 1))[0].dispatchEvent(new Event('change'));
							} else {
								reader.readAsDataURL(file);
								reader.onload = function(e) {
									$(previewId).attr('src', e.target.result).show();
									$(plusIconId).hide();
								}
							}
							break;
						}
						case '4': {
							if($('#' + idNoNum + (idNum - 3)).val() == '' 
									&& $('#' + idNoNum + (idNum - 2)).val() == '' 
										&& $('#' + idNoNum + (idNum - 1)).val() == '') {
								const adataTransfer = new DataTransfer();
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								$('#' + idNoNum + idNum).val('');
								$('#image-preview' + idNum).removeAttr('src');
								$('#' + idNoNum + (idNum - 3))[0].files = adataTransfer.files;
								$('#' + idNoNum + (idNum - 3))[0].dispatchEvent(new Event('change'));
							} else if($('#' + idNoNum + (idNum - 2)).val() == '' 
									&& $('#' + idNoNum + (idNum - 1)).val() == '') {
								const adataTransfer = new DataTransfer();
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								$('#' + idNoNum + idNum).val('');
								$('#image-preview' + idNum).removeAttr('src');
								$('#' + idNoNum + (idNum - 2))[0].files = adataTransfer.files;
								$('#' + idNoNum + (idNum - 2))[0].dispatchEvent(new Event('change'));
							} else if($('#' + idNoNum + (idNum - 1)).val() == '') {
								const adataTransfer = new DataTransfer();
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								$('#' + idNoNum + idNum).val('');
								$('#image-preview' + idNum).removeAttr('src');
								$('#' + idNoNum + (idNum - 1))[0].files = adataTransfer.files;
								$('#' + idNoNum + (idNum - 1))[0].dispatchEvent(new Event('change'));
							} else {
								reader.readAsDataURL(file);
								reader.onload = function(e) {
									$(previewId).attr('src', e.target.result).show();
									$(plusIconId).hide();
								}
							}
							break;
						}
						default: {
							console.error("잘못된 번호");
							break;
						}
					}
				} else {
					alert('허용되지 않는 파일 형식이 포함되어 있습니다.');
					$(this).val('');
				}
			} else {
				if(idNum < 4) {
					$(previewId).hide();
					$(plusIconId).show();
					for(let i = parseInt(idNum, 10); i <= 4; i++) {
						if(i == idNum) {
							continue;
						} else if($('#' + idNoNum + i).val() != '') {
							const adataTransfer = new DataTransfer();
							adataTransfer.items.add($('#' + idNoNum + i)[0].files[0]);
							$('#' + idNoNum + i).val('');
							$('#image-preview'+i).hide();
							$('#image-preview'+i).removeAttr('src');
							$('#plusIcon'+i).show();
							$('#' + idNoNum + (i - 1))[0].files = adataTransfer.files;
							$('#' + idNoNum + (i - 1))[0].dispatchEvent(new Event('change'));
						}
					}
				} else {
					$(previewId).hide();
					$(previewId).removeAttr('src');
					$(plusIconId).show();
				}
			}
		});
		$('.store-btn').click(function() {
	        // 모든 버튼에서 btn-active 클래스 제거
	        $('.store-btn').removeClass('btn-active');
	        
	        // 클릭한 버튼에 btn-active 클래스 추가
	        $(this).addClass('btn-active');
	    });
		/*=============== 이미지 미리보기 && 이미지 빈칸 제어 ===============*/
		// 클릭 시 입력 필드로 변경
		/*=============== 제출 ===============*/
        $(document).on('click', '#submit', function() {
            console.log("클릭됨");
            
            // 판매기간 설정 안했을때 날짜 받아오기.
            if ($('#set-off').hasClass('setting-active')) {
            	data.endDate = '2099-12-31';
            }
            
            
            // 할인율 설정하고 입력을 안했을때.
            if($('#discount-set-on').hasClass('setting-active')) {
            	let discount = $('#discount').val();
            	// 할인율
            	if(discount == '') {
            		alert("할인율을 입력하세요.");
            		return;
            	}
            }
            if($('#discount-set-off').hasClass('setting-active')) {
            	data.discount = 0;
            }
            if($('#option-set-off').hasClass('setting-active')) {
            	data.option = {};
            	data.option.type = '설정안함';
            }
            if($('#option-set-on').hasClass('setting-active')) {
            	optionCheck();
	    		// 옵션 재고 확인
            	if(data.option.list.length === 0) {
            		 alert('옵션 리스트가 비어 있습니다.');
            		 return;
            	}
            	if(data.option.type == '조합형') {
            		for (let i = 0; i < data.option.list.length; i++) {
            			if (data.option.list[i].option_stock <= 0) { // 재고가 0 이하일 경우
            				alert("입력되지 않은 재고가 있는 옵션이 있습니다.");
            			}
            		}
            		delete data.stock;
            	}
            }
            
            /*var temp = $('#brand').val();
            data.brand = temp;
            temp = $('#manufacturer').val();
            data.manufacturer = temp;
            temp = $('#product_origin').val();
            data.product_origin = temp;
            temp = $('#product_expiry').val();
            data.product_expiry = temp;
            if($('#btn-delivery-on').hasClass('setting-active')) {
            	data.delivery = '배송';
            } else {
            	data.delivery = '배송안함';
            }
            
            temp = $('#delivery_price').val();
            data.delivery_price = temp;*/
            
            // 입력 필드에서 값 가져오기 및 배송 가격 설정
            const fields = ['brand', 'manufacturer', 'product_origin', 'product_expiry', 'delivery_price'];
            fields.forEach(field => {
                data[field] = $(`#${field}`).val(); // 각 필드의 값을 data 객체에 할당
            });

            // 배송 정보 설정
            data.delivery = $('#btn-delivery-on').hasClass('setting-active') ? '배송' : '배송안함';
            
            
            
            // FormData 객체 생성
            var formData = new FormData();

            // data 객체의 각 속성을 FormData에 추가
            for (let key in data) {
                if (key === 'option') {
                    // 옵션 리스트가 있을 경우
                    data.option.list.forEach((option, index) => {
                        for (let optionKey in option) {
                            formData.append(`option[${index}][${optionKey}]`, option[optionKey]);
                        }
                    });
                } else {
                    formData.append(key, data[key]);
                }
            }

            // FormData 사용 예시 (AJAX 요청 등)
            console.log(...formData); // FormData의 내용을 확인하고 싶다면 콘솔에 출력
            
            
            console.log(data);
        });
		
        // 재고수량 받아오기.
        let stock = $('.input-stock').val();
        // 재고수량 받아오기.
        
        
        
		
		
		
		
	    

    });
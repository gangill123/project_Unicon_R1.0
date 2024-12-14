/**
 *  입양글 페이지 자바스크립트 파일
 */

/*=============== 입양글 페이지 페이징 ===============*/
	function adptpagePaging(adptFilter) {
		
		//최초 로딩(페이지 로딩시)
		fetchData(adptFilter);
		
		//페이징 처리
		allData = []; // ajax로 받아온 데이터 저장할 배열 초기화
		let currentPage = 1;
		let totalItems;
		const itemsPerPage = 8; // 페이지당 카드 개수
		const maxVisiblePages = 5;
		let startPage = Math.floor((currentPage - 1) / maxVisiblePages) * maxVisiblePages + 1;
		
		// 데이터 가져오기
		function fetchData(adptFilter) {
			
			$.ajax({
				url: '/adpt/getAdpt/'+ adptFilter, // 데이터를 가져올 API URL
				type: 'GET',
				success: function (response) {
					allData = response; // 데이터를 저장
					console.log(allData);
					renderPage(currentPage); // 첫 페이지 렌더링
					totalItems = allData.length;
				},
				error: function (err) {
					console.error('데이터 로드 실패:', err);
				}
			});
		}
	
		// 페이지 데이터 렌더링
		function renderPage(page) {
			const startIndex = (page - 1) * itemsPerPage;
			const endIndex = startIndex + itemsPerPage;
			const pageData = allData.slice(startIndex, endIndex); // 현재 페이지 데이터
			
			// 그리드에 데이터 렌더링
			const $grid = $('#adpt-grid');
			$grid.empty(); // 기존 데이터 삭제
				pageData.forEach(item => {
					
					let statusColor = '';
					let statusText = '';
					
					switch (item.animal_status) {
					  case 2:
						statusColor = 'warning';
					    statusText = '모집중';
					    break;
					  case 3:
					    statusColor = 'danger';
					    statusText = '상담중';
					    break;
					  case 4:
						statusColor = 'success';
						statusText = '입양완료';
						break;
					}
					
				let card = `
					<div class="col-lg-3 col-md-6 mt-3">
                        <div class="project-grid">
                            <div class="project-grid-img">
                            <div class="label-offer bg-${statusColor}">${statusText}</div>`
					card += `
                            <img alt="..." src="${item.animal_images[0].image_src }" onerror="this.onerror=null; this.src='/uploads/defaultAdpt.jpg';">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!" data-adpt="${item.adptVO.adpt_id }" id="newViewTag" data-bs-toggle="modal" data-bs-target="#exampleModal3">${item.animal_name }</a></h4>
                                    <p>${item.adptVO.adpt_id }</p>
                                </div>
                            </div>
                        </div>
                    </div>
					`;
				$grid.append(card);
			});
			
			renderPagination();
		}
		
		// 페이지네이션 렌더링
		function renderPagination() {
			const totalPages = Math.ceil(allData.length / itemsPerPage);
			const $pagination = $('#pagination');
			$pagination.empty(); // 기존 페이지 버튼 삭제
			
			// Prev 버튼 추가
			$pagination.append(
					`<li class="${startPage === 1 ? 'disabled' : ''}">
					<a href="#!" class="prev-page">
					<i class="fas fa-long-arrow-alt-left me-1"></i> Prev
					</a>
					</li>`	   
			);
			
			// 페이지 번호 추가
			const endPage = Math.min(startPage + maxVisiblePages - 1, totalPages);
			for (let i = startPage; i <= endPage; i++) {
				$pagination.append(`
						<li class="${i === currentPage ? 'active' : ''}">
						<a href="#!" class="page-number">${i}</a>
						</li>
				`);
			}
			
			// Next 버튼 추가
			$pagination.append(
					`<li class="${startPage + maxVisiblePages - 1 >= totalPages ? 'disabled' : ''}">
					<a href="#!" class="next-page">
					Next <i class="fas fa-long-arrow-alt-right ms-1"></i>
					</a>
					</li>`
			);
			
		}
		
		// 이벤트 바인딩 - 페이지 버튼클릭
		$('#pagination').on('click', '.page-number', function () {
			const selectedPage = parseInt($(this).text(), 10);
			currentPage = selectedPage;
			renderPage(currentPage);
		});
		
		// 이벤트 바인딩 - 이전 버튼클릭
		$('#pagination').on('click', '.prev-page', function () {
			if (startPage > 1) {
				startPage -= maxVisiblePages;
				currentPage = startPage + (maxVisiblePages -1);
				renderPage(currentPage);
			}
		});
		
		// 이벤트 바인딩 - 다음 버튼클릭
		$('#pagination').on('click', '.next-page', function () {
			const totalPages = Math.ceil(totalItems / itemsPerPage);
			if (startPage + maxVisiblePages - 1 < totalPages) {
				startPage += maxVisiblePages;
				currentPage = startPage;
				renderPage(currentPage);
			}
		});
		
	}
/*=============== 입양글 페이지 페이징 ===============*/



/*=============== 입양글 모달 페이지 처리 ===============*/
	function adptModalProcess(adptId) {
		
		//현재날짜 
		const today = new Date();
		
		// map메서드 반환값으로 새로운 배열을 생성
		const adptIds = allData.map(function(item) {
			return item.adptVO.adpt_id;
		});
		// $.inArray(value, array) value가 array에 존재하면 존재하고있는 index 반환
		const index = $.inArray(adptId, adptIds);
		
		let animal_image_src = allData[index].animal_images[0].image_src;
		let animal_status = allData[index].animal_status;
		let news_subject = allData[index].news_subject;
		let news_ins = allData[index].news_ins;
		let news_att = allData[index].news_att;
		let news_content = allData[index].news_content;
		let news_place = allData[index].news_place;
		let news_startdate = allData[index].news_startdate;
		let news_enddate = allData[index].news_enddate;
		
		let news_src_next = index < allData.length - 1 ? allData[index+1].animal_image_src : allData[0].animal_image_src;
		let news_subject_next = index < allData.length - 1 ? allData[index+1].news_subject : allData[0].news_subject;
		let news_content_next = index < allData.length - 1 ? allData[index+1].news_content : allData[0].news_content;
		let news_place_next = index < allData.length - 1 ? allData[index+1].news_place : allData[0].news_place;
		let news_startdate_next = index < allData.length - 1 ? allData[index+1].news_startdate : allData[0].news_startdate;
		
		let news_startdate_date = new Date(news_startdate);
		let news_enddate_date = new Date(news_enddate);
		let news_startdate_next_date = new Date(news_startdate_next);
		const days = ["일","월","화","수","목","금","토"];
		let news_startdate_dayName = days[news_startdate_date.getDay()];
		let news_enddate_dayName = days[news_enddate_date.getDay()];
		let news_startdate_next_dayName = days[news_startdate_next_date.getDay()];
		//console.log(news_startdate_dayName);
		
		
		
		if(news_content_next.length > 80){
			news_content_next = news_content_next.substring(0, 80) + "...";
		}
		
		let statusColor = '';
		let statusText = '';
		
		let startDate = new Date(news_startdate);
		let endDate = new Date(news_enddate); 
		let diffInMilliseconds = startDate - today;
		let diffInDays = Math.floor(diffInMilliseconds / (1000 * 60 * 60 * 24));
		
		switch (animal_status) {
		  case 2:
			statusColor = 'warning';
		    statusText = '모집중';
		    break;
		  case 3:
		    statusColor = 'danger';
		    statusText = '상담중';
		    break;
		  case 4:
			statusColor = 'success';
			statusText = '입양완료';
			break;
		}
		
		const $modalBody = $('.modal-body');
		$modalBody.empty(); // 기존 데이터 삭제
		
		let modalContext = `
		<div class="row mb-6 mb-sm-7 mb-md-8 mb-lg-9" style="margin-bottom: 0;">
	        <div class="col-lg-5 text-center text-lg-start mb-1-9 mb-lg-0">
	            <!-- product left start -->
	            <div>
	                <img class="mb-1" id="adpt_image" src="${animal_image_src}" >
	            </div>
	            <!-- product left end -->
	        </div>
	        <div class="col-lg-7 ps-lg-2-3">
	            <div class="product-detail">
	                <h3 class="mb-2">${news_subject}<span class="label-sale bg-${statusColor} 
	                text-white text-uppercase display-30">${statusText}</span>`
	                
			modalContext += `</h3><div class="bg-primary separator-line-horrizontal-full mb-4"></div>
	                <p class="rating-text"><span>주관 :</span> <span class="text-primary">${news_ins}</span
	                ><span>  /  참여대상 :</span> <span class="text-primary">${news_att}</span></p>
	                <div style="min-height:240px; max-height:240px; overflow-y: auto;">
	                	<p style="white-space: pre-line;">${news_content}</p>
	                </div>
					<div class="row" style="margin-top: 30px;">
	                    <div class="col-lg-6 text-center">
	                        <h6 style="font-size: 1.3rem;"><i class="fa-solid fa-map-location-dot"></i> 행사장소</h6>
	                        <p class="mb-0">${news_place}</p>
	                    </div>
	                    <div class="col-lg-6 text-center">
	                        <h6 style="font-size: 1.3rem;"><i class="fa-solid fa-calendar-days"></i> 행사일</h6>`
			
			if(news_startdate == news_enddate){
				modalContext += `
					<p class="mb-0">${news_startdate}(${news_startdate_dayName})</p>`
			} else{
				modalContext += `
					<p class="mb-0">${news_startdate}(${news_startdate_dayName}) ~ ${news_enddate}(${news_enddate_dayName})</p>`
			}
		
			modalContext += `
	                    </div>
	                </div>
	                
	                <div class="row" style="margin-top: 40px;">
	                    <div class="col-12">
	                        <div class="inner-title">
	                            <h6 style="margin-bottom: 10px;">다음 소식 알아보기</h6>
	                        </div>
	                    </div>
	                    <!-- start feature box item -->
	                    <div class="col-lg-12">
	                        <div class="row">
	                            <div class="col-sm-4 mb-4 mb-md-0">
	                                <img class="rounded" style="height: 100%; aspect-ratio: 1/1;"
	                                src="${news_src_next}" alt="...">
	                            </div>
	                            <div class="col-sm-8">
	                                <h5 class="h6 font-weight-600 mb-2">${news_subject_next}</h5>
	                                <div style="min-height: 150px; max-height: 150px; overflow: hidden;">
	                               		<p>행사일 : ${news_startdate_next}(${news_startdate_next_dayName})
	                               		<br>장소 : ${news_place_next}
	                               		<br>${news_content_next}</p>
	                                </div>
	                                <a href="#!" class="readmore" data-nextid="${index < allData.length - 1 ? allData[index+1].news_id : allData[0].news_id}"><span>다음 소식 보기</span></a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>`
			
		$modalBody.append(modalContext);
	}
	
	//// 주문 상세페이지 로직 처리 ////
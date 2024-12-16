/**
 *  입양글 페이지 자바스크립트 파일
 */

/*=============== 입양글 페이지 페이징 ===============*/
	function adptPaging(adptFilters) {
		
		//최초 로딩(페이지 로딩시)
		fetchData(adptFilters);
		
		//페이징 처리
		allData = []; // ajax로 받아온 데이터 저장할 배열 초기화
		let currentPage = 1;
		let totalItems;
		const itemsPerPage = 8; // 페이지당 카드 개수
		const maxVisiblePages = 5;
		let startPage = Math.floor((currentPage - 1) / maxVisiblePages) * maxVisiblePages + 1;
		
		// 데이터 가져오기
		function fetchData(adptFilters) {
			
			$.ajax({
				url: '/adpt/getAdpt',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify({ 
					adptFilter: adptFilters.adptFilter, 
					category_code: adptFilters.category_code || '',
					dateOption: adptFilters.dateOption || '',
					location: adptFilters.location || '',
					location_detail: adptFilters.location_detail || '',
					searchWord: adptFilters.searchWord || ''
				}),
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
		let animal_image_src0 = allData[index].animal_images[0].image_src;
		let animal_image_src1;
		let animal_image_src2;
		let animal_image_src3;
		if (allData[index].animal_images[1] && allData[index].animal_images[1].image_src) {
			animal_image_src1 = allData[index].animal_images[1].image_src;
		} else {
			animal_image_src1 = '/uploads/defaultAdpt.jpg';
		}
		if (allData[index].animal_images[2] && allData[index].animal_images[2].image_src) {
			animal_image_src2 = allData[index].animal_images[2].image_src;
		} else {
			animal_image_src2 = '/uploads/defaultAdpt.jpg';
		}
		if (allData[index].animal_images[1] && allData[index].animal_images[3].image_src) {
			animal_image_src3 = allData[index].animal_images[3].image_src;
		} else {
			animal_image_src3 = '/uploads/defaultAdpt.jpg';
		}
		let animal_status = allData[index].animal_status;
		let animal_name = allData[index].animal_name;
		let member_name = allData[index].memberVO.member_name;
		let adpt_id = allData[index].adptVO.adpt_id;
		let adpt_intro = allData[index].adptVO.adpt_intro;
		let adpt_etc = allData[index].adptVO.adpt_etc;
		let animal_act = allData[index].animal_act;
		let animal_social = allData[index].animal_social;
		let animal_id = allData[index].animal_id;
		let animal_vaccine0 = allData[index].animal_vaccines[0].vaccine;
		let animal_vaccine1 = allData[index].animal_vaccines[1].vaccine;
		let animal_vaccine2 = allData[index].animal_vaccines[2].vaccine;
		let animal_vaccine3 = allData[index].animal_vaccines[3].vaccine;
		let animal_vaccine_check0 = allData[index].animal_vaccines[0].vaccine_check;
		let animal_vaccine_check1 = allData[index].animal_vaccines[1].vaccine_check;
		let animal_vaccine_check2 = allData[index].animal_vaccines[2].vaccine_check;
		let animal_vaccine_check3 = allData[index].animal_vaccines[3].vaccine_check;
		let animal_health0 = allData[index].animal_healths[0].health;
		let animal_health1 = allData[index].animal_healths[1].health;
		let animal_health2 = allData[index].animal_healths[2].health;
		let animal_health3 = allData[index].animal_healths[3].health;
		let animal_health4 = allData[index].animal_healths[4].health;
		let animal_health_check0 = allData[index].animal_healths[0].health_check;
		let animal_health_check1 = allData[index].animal_healths[1].health_check;
		let animal_health_check2 = allData[index].animal_healths[2].health_check;
		let animal_health_check3 = allData[index].animal_healths[3].health_check;
		let animal_health_check4 = allData[index].animal_healths[4].health_check;

		
		let adpt_id_next = index < allData.length - 1 ? allData[index+1].adptVO.adpt_id : allData[0].adptVO.adpt_id;
		let adpt_intro_next = index < allData.length - 1 ? allData[index+1].adptVO.adpt_intro : allData[0].adptVO.adpt_intro;
		let animal_image_src0_next = index < allData.length - 1 ? allData[index+1].animal_images[0].image_src : allData[0].animal_images[0].image_src;
		let animal_name_next = index < allData.length - 1 ? allData[index+1].animal_name : allData[0].animal_name;
		let member_name_next = index < allData.length - 1 ? allData[index+1].memberVO.member_name : allData[0].memberVO.member_name;
		
		if(adpt_intro_next.length > 80){
			adpt_intro_next = adpt_intro_next.substring(0, 80) + "...";
		}
		
		let statusColor = '';
		let statusText = '';
		
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
	                <img class="mb-1" id="adpt_image0" src="${animal_image_src0}" onerror="this.onerror=null; this.src='/uploads/defaultAdpt.jpg';" >
	            </div>
	            <div class="d-flex justify-content-center">
	            	<img class="adpt_image_sub mx-1" id="adpt_image1" onerror="this.onerror=null; this.src='/uploads/defaultAdpt.jpg';"
	            		src="${animal_image_src1}" >
					<img class="adpt_image_sub mx-1" id="adpt_image2" onerror="this.onerror=null; this.src='/uploads/defaultAdpt.jpg';"
						src="${animal_image_src2}" >
					<img class="adpt_image_sub mx-1" id="adpt_image3" onerror="this.onerror=null; this.src='/uploads/defaultAdpt.jpg';"
						src="${animal_image_src3}" >
	            </div>
	            <div class="d-flex justify-content-center mt-5">
	            	<button type="button" id="adptCounselbtn" class="butn-style3 white-hover col-8">입양 상담 신청</button>
	            </div>
	            <!-- product left end -->
	        </div>
	        <div class="col-lg-7 ps-lg-2-3">
	            <div class="product-detail">
	            <input id="animal_id" type="hidden" value="${animal_id}" />
	                <h4 class="mb-2">${adpt_id}<span class="label-sale bg-${statusColor} 
	                text-white text-uppercase display-30">${statusText}</span>`
	                
			modalContext += `</h4><div class="bg-primary separator-line-horrizontal-full mb-4"></div>
	                <p class="rating-text"><span>이름 :</span> <span class="text-primary">${animal_name}</span
	                ><span>  /  보호소 :</span> <span class="text-primary">${member_name}</span></p>
	                <div class="row">
	                	<div class="col-6">
                    		<h6>소개</h6>
                    	</div>
                        <div class="col-12 scroll-hide" style="min-height:120px; max-height:120px; overflow-y: auto;">
                        	<span>${adpt_intro}</span>
                        	<br/>
							<h6 class="mt-2">기타사항</h6>
							<span>${adpt_etc}</span>
                        </div>
	                </div>
					<div class="row mt-3">
	                    <div class="col-xl-5 col-lg-12 d-flex">
							<h6 class="col-3">활동성</h6>
							<div class="actGauge col-7">
								<div class="empty"></div>
								<div class="empty"></div>
								<div class="empty"></div>
								<div class="empty"></div>
								<div class="empty"></div>
							</div>
							<div class="col-2 text-center"><h6 style="color:#86bc42;">${animal_act == 0 ? '' : animal_act}</h6></div>
						</div>
						<div class="col-xl-5 col-lg-12 d-flex">
							<h6 class="col-3">사회성</h6>
							<div class="socialGauge col-7">
								<div class="empty"></div>
								<div class="empty"></div>
								<div class="empty"></div>
								<div class="empty"></div>
								<div class="empty"></div>
							</div>
							<div class="col-2 text-center"><h6 style="color:#86bc42;">${animal_social == 0 ? '' : animal_social}</h6></div>`
			modalContext += `
	                    </div>
	                </div>
	                <div class="row">
	                	<div class="col-xl-11 col-lg-12 mt-1">
							<table class="table table-bordered text-center mb-0">
								<thead>
									<tr>
										<th>${animal_vaccine0}</th>
										<th>${animal_vaccine1}</th>
										<th>${animal_vaccine2}</th>
										<th>${animal_vaccine3}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${animal_vaccine_check0}</td>
										<td>${animal_vaccine_check1}</td>
										<td>${animal_vaccine_check2}</td>
										<td>${animal_vaccine_check3}</td>
									</tr>
								</tbody>
							</table>
	                	</div>
						<div class="col-xl-11 col-lg-12 mt-1">
							<table class="table table-bordered text-center mb-0">
								<thead>
									<tr>
										<th>${animal_health0}</th>
										<th>${animal_health1}</th>
										<th>${animal_health2}</th>
										<th>${animal_health3}</th>
										<th>${animal_health4}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${animal_health_check0}</td>
										<td>${animal_health_check1}</td>
										<td>${animal_health_check2}</td>
										<td>${animal_health_check3}</td>
										<td>${animal_health_check4}</td>
									</tr>
								</tbody>
							</table>
						</div>
	                </div>
	                <div class="row mt-2">
	                    <div class="col-12">
	                        <div class="inner-title">
	                            <h6 style="margin-bottom: 10px;">다음 글 알아보기</h6>
	                        </div>
	                    </div>
	                    <!-- start feature box item -->
	                    <div class="col-lg-12">
	                        <div class="row">
	                            <div class="col-sm-4 mb-4 mb-md-0">
	                                <img class="rounded" style="height: 100%; aspect-ratio: 1/1;"
	                                src="${animal_image_src0_next}" alt="..." onerror="this.onerror=null; this.src='/uploads/defaultAdpt.jpg';">
	                            </div>
	                            <div class="col-sm-8">
	                                <h5 class="h6 font-weight-600 mb-2">${adpt_id_next}</h5>
	                                <div style="min-height: 150px; max-height: 150px; overflow: hidden;">
	                               		<p>이름 : ${animal_name_next}
	                               		<br>보호소 : ${member_name_next}
	                               		<br>${adpt_intro_next}</p>
	                                </div>
	                                ${index > 0 ? `<a href="#!" class="readpre" data-next-adpt-id="${allData[index-1].adptVO.adpt_id}"><span>이전 글 보기</span></a>` : ''}
	                                <a href="#!" class="readmore" style="float: right;" data-next-adpt-id="${index < allData.length - 1 ? allData[index+1].adptVO.adpt_id : allData[0].adptVO.adpt_id}"><span>다음 글 보기</span></a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>`
			
		$modalBody.append(modalContext);
		
		
		const actGaugeDivs = document.querySelectorAll('.actGauge div');
		
		if(animal_act != 0) {
			for (let i = 0; i < actGaugeDivs.length; i++) {
				if (i < animal_act) {
					actGaugeDivs[i].classList.add('filled');
					actGaugeDivs[i].classList.remove('empty');
				} else {
					actGaugeDivs[i].classList.add('empty');
					actGaugeDivs[i].classList.remove('filled');
				}
			}
		}
		
		const socialGaugeDivs = document.querySelectorAll('.socialGauge div');
		
		if(animal_social != 0) {
			for (let i = 0; i < socialGaugeDivs.length; i++) {
				if (i < animal_social) {
					socialGaugeDivs[i].classList.add('filled');
					socialGaugeDivs[i].classList.remove('empty');
				} else {
					socialGaugeDivs[i].classList.add('empty');
					socialGaugeDivs[i].classList.remove('filled');
				}
			}
		}
		
	}
	
/*=============== 입양글 모달 페이지 처리 ===============*/

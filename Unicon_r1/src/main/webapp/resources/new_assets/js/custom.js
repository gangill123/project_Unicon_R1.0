
	/////관리자 소식 페이징 처리 및 삭제처리/////
	function newsPaging(resion, currentPage, filter){
		
		//현재날짜 
		const today = new Date(); 
		
		//최초 로딩(페이지 로딩시)
		fetchData(resion, currentPage, filter);
		
		//페이징 처리
		let allData = []; // 전체 데이터를 저장
		//let currentPage = 1; // 현재 페이지
		let totalItems;
		const itemsPerPage = 8; // 페이지당 카드 개수
		const maxVisiblePages = 5;
		let startPage = Math.floor((currentPage - 1) / maxVisiblePages) * maxVisiblePages + 1;
		
		// 데이터 가져오기
		function fetchData(resion, currentPage, filter) {
			let url;
			
			if(resion == '전국'){
				url = '/admin/news_filter/all'
			} else {
				url = '/admin/news_filter/'+resion
			}
			
			$.ajax({
				url: url, // 데이터를 가져올 API URL
				type: 'GET',
				data: {
			        filter: filter // filter 변수를 전달
			    },
				success: function (response) {
					allData = response; // 데이터를 저장
					//console.log(allData);
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
			const $grid = $('#data-grid');
			$grid.empty(); // 기존 데이터 삭제
			pageData.forEach(item => {
				
				let endDate = new Date(item.news_enddate); 
				
				const card = `
				<div class="col-xl-3 col-sm-6">
					<div class="product-details">
						<div class="product-img">
							<div class="label-offer bg-${today > endDate ? 'red' : 'primary'}">
							${today > endDate ? '개시종료' : '개시중'}</div>
							<img src="${item.news_src }" alt="..." class="image rounded-3">
							<div class="product-cart">
								<a href="/admin/news_view/${item.news_id }?resion=${resion}&currentPage=${currentPage}&filter=${filter}" style="width: 50px; height: 50px;">
									<i class="fa-regular fa-pen-to-square"></i></a>
								<a class="deleteNews" data-id=${item.news_id } style="width: 50px; height: 50px;">
									<i class="fa-solid fa-trash-can"></i></a>
							</div>
						</div>
						<div class="product-info" style="padding: 0;">
							<a href="/admin/news_view/${item.news_id }">${item.news_subject }</a>
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
		
		// 삭제하기
		$('#data-grid').on('click', '.deleteNews', function () {
			Swal.fire({
				  title: '소식을 삭제하시겠습니까?',
				  text: "삭제 후에는 소식정보를 복구할 수 없습니다.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소',
				  customClass: {
				        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
				  }
				}).then((result) => {
					if (result.isConfirmed) {
						$.ajax({
							url: '/admin/news_delete/'+$(this).data('id'),
							type: 'DELETE',
							success: function(){
								Swal.fire({
					  	  			  title: '삭제가 완료되었습니다!',
					  	  			  text: "신규등록을 통해 재등록이 가능합니다.",
					  	  			  icon: 'success',
					  	  			  customClass: {
					  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
					 			 	  }
					  				}).then(function() {
					  					fetchData(resion, currentPage, filter);
			                        });
							},
							error: function(){
								Swal.fire({
				  	  			  title: '에러!',
				  	  			  icon: 'error',
				  	  			  customClass: {
				  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
				 			 	  }
				  				});
							}
						});
					}
				});
		});
	}
	/////소식 페이징 처리 및 삭제처리/////
	
	
	
	/////슬라이드 페이징 처리 및 삭제처리/////
	function slidePaging(currentPage){
		
		//현재날짜 
		const today = new Date(); 
		
		//최초 로딩(페이지 로딩시)
		fetchData(currentPage);
		
		//페이징 처리
		let allData = []; // 전체 데이터를 저장
		//let currentPage = 1; // 현재 페이지
		let totalItems;
		const itemsPerPage = 4; // 페이지당 카드 개수
		const maxVisiblePages = 5;
		let startPage = Math.floor((currentPage - 1) / maxVisiblePages) * maxVisiblePages + 1;
		
		// 데이터 가져오기
		function fetchData(currentPage) {
			
			$.ajax({
				url: '/admin/slide_filter/all', // 데이터를 가져올 API URL
				type: 'GET',
				success: function (response) {
					allData = response; // 데이터를 저장
					//console.log(allData);
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
			const $grid = $('#data-grid');
			$grid.empty(); // 기존 데이터 삭제
			pageData.forEach(item => {
				
				let startDate = new Date(item.ms_startdate);
				let endDate = new Date(item.ms_enddate);
				let statusColor;
				let statusText;
				
				switch (true) {
				  case today > endDate:
					statusColor = 'secondary';
				    statusText = '개시종료';
				    break;
				  case today < startDate:
				    statusColor = 'success';
				    statusText = '개시준비중';
				    break;
				  default:
					statusColor = 'info';
				    statusText = '개시중';
				    break;
				}
				
				const card = `
					<div class="col-xl-6 col-sm-6">
						<div class="product-details">
						<div class="product-img"><div class="label-offer bg-${statusColor}">${statusText}</div>
						<img src="${item.ms_src }" alt="..." class="image rounded-3">
						<div class="product-cart">
						<a href="/admin/slide_view/${item.ms_id }?currentPage=${currentPage}" style="width: 50px; height: 50px;">
						<i class="fa-regular fa-pen-to-square"></i></a>
						<a class="deleteSlide" data-id=${item.ms_id } style="width: 50px; height: 50px;">
						<i class="fa-solid fa-trash-can"></i></a>
						</div>
						</div>
						<div class="product-info" style="padding: 0;">
						<a href="/admin/slide_view/${item.ms_id }?currentPage=${currentPage}">${item.ms_name }</a>
						</div>
						</div>
					</div>`;
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
		
		// 삭제하기
		$('#data-grid').on('click', '.deleteSlide', function () {
			Swal.fire({
				title: '슬라이드를 삭제하시겠습니까?',
				text: "삭제 후에는 복구할 수 없습니다.",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '삭제',
				cancelButtonText: '취소',
				customClass: {
					popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
				}
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url: '/admin/slide_delete/'+$(this).data('id'),
						type: 'DELETE',
						success: function(){
							Swal.fire({
								title: '삭제가 완료되었습니다!',
								text: "신규등록을 통해 재등록이 가능합니다.",
								icon: 'success',
								customClass: {
									popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
								}
							}).then(function() {
								fetchData(currentPage);
							});
						},
						error: function(){
							Swal.fire({
								title: '에러!',
								icon: 'error',
								customClass: {
									popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
								}
							});
						}
					});
				}
			});
		});
	}
	/////페이징 처리 및 삭제처리/////
	
	
	////슬라이드 미리보기////
	function createImagePreview(e, previewSelector) {
	    const imgTag = 
	    	`<div class="row slider-fade-shop" style="margin-left: 0; margin-right: 0;">
			            <div class="text-start item bg-img cover-background" id="silde_bg" data-src="${e.target.result}"
			             style="background-image: url('${e.target.result}'); height: 350px;">
			                <div class="caption">
			                    <div class="container">
			                        <div id="slide_textField" class="overflow-hidden w-md-85 w-lg-75">
			                            <h1 class="main-font" style="color:white;">상단문구</h1>
			                            <div class="subheading" style="font-size: 30px; display:flex; justify-content: flex-start;">
			                            <div id="left_btm">좌측하단</div><strong>강조</strong><div id="right_btm">우측하단</div></div>
								    	<a href="#!" class="butn primary">
								    		<span id="btnText" class="alt-font">버튼</span>
								    	</a>
							    	</div>
			                    </div>
			                </div>
			            </div>
			    </div>
	    	`;
	    
	    // 해당 셀렉터에 HTML 삽입
	    $(previewSelector).html(imgTag);
	}
	
	
	/////마이페이지 페이징 처리/////
	function mypagePaging(id){
		
		//최초 로딩(페이지 로딩시)
		fetchData(id);
		
		//페이징 처리
		let allData = []; // 전체 데이터를 저장
		let currentPage = 1; // 현재 페이지
		let totalItems;
		const itemsPerPage = 4; // 페이지당 카드 개수
		const maxVisiblePages = 5;
		let startPage = Math.floor((currentPage - 1) / maxVisiblePages) * maxVisiblePages + 1;
		
		// 데이터 가져오기
		function fetchData(id) {
			
			//console.log(id);
			// id값에 따른 url 설정
			let url
			if(id === 'myUni'){
				url = '/mypage/pet_filter/all';
			} else{
				url = '/mypage/pet_filter/all2';
			}
			
			$.ajax({
				url: url, // 데이터를 가져올 API URL
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
			const $grid = $('.product-grid');
			$grid.empty(); // 기존 데이터 삭제
			
			let card
			
			if(id === 'myUni'){
				card = `
				<div class="col-lg-12" style="text-align: end; margin-top: 0;">
	             	<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/mypage/pet_create'">유니콘 등록</button>
	            </div>`;
				$grid.append(card);
				pageData.forEach(item => {
				card = `
					<div class="col-sm-6 col-md-4 col-lg-3">
	                        <a href="mypage/pet_view/${item.pet_id}"><div class="product-details">
	                            <div class="product-img" style="padding: 10px;">
	                                <img src="${item.pet_src }" alt="...">
	                            </div>
	                            <div class="product-info" style="padding: 0;">
	                                <a href="mypage/pet_view/${item.pet_id}">${item.pet_name }</a>
	                                <p class="price text-center m-0">
	                                </p>
	                            </div>
	                        </div></a>
	                    </div>
					`;
				$grid.append(card);
			});
			
			}
			
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
	/////페이징 처리 및 삭제처리/////
	
	
	/////소식페이지 페이징 처리/////
	function newspagePaging(id){
		
		//최초 로딩(페이지 로딩시)
		fetchData(id);
		
		//페이징 처리
		allData = []; // 데이터 리셋
		let currentPage = 1; // 현재 페이지
		let totalItems;
		const itemsPerPage = 8; // 페이지당 카드 개수
		const maxVisiblePages = 5;
		let startPage = Math.floor((currentPage - 1) / maxVisiblePages) * maxVisiblePages + 1;
		
		//현재날짜 
		const today = new Date();
		
		// 데이터 가져오기
		function fetchData(id) {
			
			//console.log(id);
			
			$.ajax({
				url: '/news/getNews/'+id, // 데이터를 가져올 API URL
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
			const $grid = $('#news-grid');
			$grid.empty(); // 기존 데이터 삭제
				pageData.forEach(item => {
					
					let statusColor = '';
					let statusText = '';
					
					let startDate = new Date(item.news_startdate);
					let endDate = new Date(item.news_enddate); 
					let diffInMilliseconds = startDate - today;
					let diffInDays = Math.floor(diffInMilliseconds / (1000 * 60 * 60 * 24));
					
					//console.log(diffInDays);
					
					switch (true) {
					  case today > endDate:
						statusColor = 'secondary';
					    statusText = '종료';
					    break;
					  case today < startDate:
					    statusColor = 'success';
					    statusText = '준비중';
					    break;
					  default:
						statusColor = 'info';
					    statusText = '진행중';
					    break;
					}
					
				let card = `
					<div class="col-lg-3 col-md-6 mt-3">
                        <div class="project-grid">
                            <div class="project-grid-img">
                            <div class="label-offer bg-${statusColor}">${statusText}</div>`
					if(statusText === '준비중'){
						card += `
							<div class="label-offer2 bg-red">Day - ${diffInDays}</div>`
					} else if(statusText === '진행중'){
						card += `
							<div class="label-offer2 bg-red">"D-day"</div>`
					}
						card += `
                            <img alt="..." src="${item.news_src }">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!" data-news="${item.news_id }" id="newViewTag" data-bs-toggle="modal" data-bs-target="#exampleModal3">${item.news_subject }</a></h4>
                                    <p>${item.news_ins }</p>
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
	/////소식페이지 페이징 처리/////
	
	
	
	//////// 소식 모달페이지 처리///////
	function newsModalProcess(newsId){
		
		//현재날짜 
		const today = new Date();
		
		const newsIds = allData.map(function(item){
			return item.news_id;
		});
		
		console.log("newsIds :"+newsIds);

		const index = $.inArray(newsId, newsIds);
		
		let news_src = allData[index].news_src;
		let news_subject = allData[index].news_subject;
		let news_ins = allData[index].news_ins;
		let news_att = allData[index].news_att;
		let news_content = allData[index].news_content;
		let news_place = allData[index].news_place;
		let news_startdate = allData[index].news_startdate;
		let news_enddate = allData[index].news_enddate;
		
		let news_src_next = index < allData.length - 1 ? allData[index+1].news_src : allData[0].news_src;
		let news_subject_next = index < allData.length - 1 ? allData[index+1].news_subject : allData[0].news_subject;
		let news_content_next = index < allData.length - 1 ? allData[index+1].news_content : allData[0].news_content;
		let news_place_next = index < allData.length - 1 ? allData[index+1].news_place : allData[0].news_place;
		let news_startdate_next = index < allData.length - 1 ? allData[index+1].news_startdate : allData[0].news_startdate;
		
		if(news_content_next.length > 80){
			news_content_next = news_content_next.substring(0, 80) + "...";
		}
		
		let statusColor = '';
		let statusText = '';
		
		let startDate = new Date(news_startdate);
		let endDate = new Date(news_enddate); 
		let diffInMilliseconds = startDate - today;
		let diffInDays = Math.floor(diffInMilliseconds / (1000 * 60 * 60 * 24));
		
		switch (true) {
		  case today > endDate:
			statusColor = 'secondary';
		    statusText = '종료';
		    break;
		  case today < startDate:
		    statusColor = 'success';
		    statusText = '준비중';
		    break;
		  default:
			statusColor = 'info';
		    statusText = '진행중';
		    break;
		}
		
		const $modalBody = $('.modal-body');
		$modalBody.empty(); // 기존 데이터 삭제
		
		let modalContext = `
		<div class="row mb-6 mb-sm-7 mb-md-8 mb-lg-9" style="margin-bottom: 0;">
	        <div class="col-lg-5 text-center text-lg-start mb-1-9 mb-lg-0">
	            <!-- product left start -->
	            <div>
	                <img class="mb-1" id="news_image" src="${news_src}" >
	            </div>
	            <!-- product left end -->
	        </div>
	        <div class="col-lg-7 ps-lg-2-3">
	            <div class="product-detail">
	                <h3 class="mb-2">${news_subject}<span class="label-sale bg-${statusColor} 
	                text-white text-uppercase display-30">${statusText}</span>`
	        if(statusText == '준비중'){
	        	modalContext += `<span class="label-sale bg-red 
	                text-white text-uppercase display-30">Day - ${diffInDays}</span>`
	        } else if(statusText == '진행중'){
	        	modalContext += `<span class="label-sale bg-red 
	                text-white text-uppercase display-30">"D-day"</span>`
	        }
	                
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
	                    <div class="col-lg-5 text-center">
	                        <h6 style="font-size: 1.3rem;"><i class="fa-solid fa-calendar-days"></i> 행사일</h6>`
			
			if(news_startdate == news_enddate){
				modalContext += `
					<p class="mb-0">${news_startdate}</p>`
			} else{
				modalContext += `
					<p class="mb-0">${news_startdate} ~ ${news_enddate}</p>`
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
	                               		<p>행사일 : ${news_startdate_next}
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
	
	// 옵션1 선택시 옵션2번 불러오기
	function getOption(product_id, option_value){
		//alert(product_id);
		
		$.ajax({
			url: '/shop/getOption/'+product_id,
			type: 'GET',
			data: {
				option_value: option_value
			},
			success: function(response){
				//console.log(data);
				
				$('#itemOption2').empty();
				let option = `<option value="${response[0].option_name2}" disabled selected>${response[0].option_name2}</option>`;
				
				response.forEach(function(item){
					option += `<option value="${item.option_value2}">${item.option_value2}`
						
					if(item.option_price != 0){
						option += ` ( +${item.option_price}원 )`
					}	
					option += `</option>`
				});
				
				$('#itemOption2').append(option);
			},
			error: function(){
				console.log("not");
			}
		});
	}
	
	
	
	
	
	
	////// 단독형 선택박스 생성
	function appendSoleSelectItems(product_id, option_name, option_value, product_price, discount_rate){
		
		// 옵션1 - 옵션2에 따른 가격 가져오기
		$.ajax({
			url: '/shop/getSoleOptionPrice/'+product_id,
			type: 'GET',
			data: {
				option_value: option_value
			},
			success: function(response) {
				
				console.log(response);
				
				let optionPrice = response;
				
				// 상품가격 + 옵션가격
				let totalPrice = Number(product_price) + optionPrice;
				
				// 총가격 천자리 쉼표
				let formattedTotalPrice = new Intl.NumberFormat().format(totalPrice);
				
				// 할인율 계산한 가격 (10원자리 버림)
				let DiscountPrice = Math.floor((totalPrice * (100 - Number(discount_rate)) / 100) / 100) * 100;
				
				// 할인가격 천자리 쉼표
				let formattedDiscountPrice = new Intl.NumberFormat().format(DiscountPrice);
				
				let selectItemValue = 
					`<div class="selectItem row g-0 align-items-center bg-light rounded p-3 mb-3">
			                <div class="col-12">
			                    <div class="mb-3">
			                        <label class="optionVal1" data-opt="${option_value}"
			                        data-opp="${optionPrice}">${option_name}: ${option_value}`
			                        
					if(optionPrice != 0){
						selectItemValue += ` ( +${optionPrice}원 )`
					}	
					
					selectItemValue += `</label>
			                        <button type="button" class="btn-close" aria-label="Close"></button>
			                    </div>
			                    <div class="row" style="align-items: end;">
			                        <div class="col-2">
			                            <div class="itemCntBox">
			                            	<span class="minusBtn itemCntSpan">-</span>
			                            	<span class="itemCnt">1</span>
			                            	<span class="plusBtn itemCntSpan">+</span>
			                            </div>
			                        </div>
			                        <div class="col-10" style="text-align: end;">`
						
							if(discount_rate != 0){
								selectItemValue += `<p class="mb-0 display-32 font-weight-600" style="color: rgb(240, 86, 86);"
								>${discount_rate}% 할인 적용</p>`
							}
						
							selectItemValue +=`<p class="mb-0">`
							
							if(discount_rate != 0){
								selectItemValue += `<span class="totalPrice display-30 me-2" style="text-decoration: line-through; color: #aaa;"
		                            data-price="${totalPrice}">${formattedTotalPrice}원</span>`
							}
								
								
								selectItemValue +=`<span class="discountPrice display-27 font-weight-600" data-price="${DiscountPrice}"
			                            >${formattedDiscountPrice}원</span></p>
			                        </div>
			                    </div>
			                </div>
			            </div>
					`
					$('#selectItems').append(selectItemValue);
					
					orderPriceCnt();
				
			},
			error: function(){
				consloe.log("error");
			}
		});
		
	}
	
	
	
	
	// 조합형 선택박스 생성
	function appendSelectItems(product_id, option_name, option_value, option_name2, option_value2,
			product_price, discount_rate){
		
		// 옵션1 - 옵션2에 따른 가격 가져오기
		$.ajax({
			url: '/shop/getOptionPrice/'+product_id,
			type: 'GET',
			data: {
				option_value: option_value,
				option_value2: option_value2
			},
			success: function(response) {
				let optionPrice = response;
				
				// 상품가격 + 옵션가격
				let totalPrice = Number(product_price) + optionPrice;
				
				// 총가격 천자리 쉼표
				let formattedTotalPrice = new Intl.NumberFormat().format(totalPrice);
				
				// 할인율 계산한 가격 (100원자리 버림)
				let DiscountPrice = Math.floor((totalPrice * (100 - Number(discount_rate)) / 100) / 100) * 100;
				
				// 할인가격 천자리 쉼표
				let formattedDiscountPrice = new Intl.NumberFormat().format(DiscountPrice);
				
				let selectItemValue = 
					`<div class="selectItem row g-0 align-items-center bg-light rounded p-3 mb-3">
			                <div class="col-12">
			                    <div class="mb-3">
			                        <label class="optionVal1" data-opt="${option_value}"
			                        data-opp="${optionPrice}">${option_name}: ${option_value} / </label>
			                        <label class="optionVal2" data-opt="${option_value2}"> ${option_name2}: ${option_value2}`
			                        
					if(optionPrice != 0){
						selectItemValue += ` ( +${optionPrice}원 )`
					}	
					
					selectItemValue += `</label>
			                        <button type="button" class="btn-close" aria-label="Close"></button>
			                    </div>
			                    <div class="row" style="align-items: end;">
			                        <div class="col-2">
			                            <div class="itemCntBox">
			                            	<span class="minusBtn itemCntSpan">-</span>
			                            	<span class="itemCnt">1</span>
			                            	<span class="plusBtn itemCntSpan">+</span>
			                            </div>
			                        </div>
			                        <div class="col-10" style="text-align: end;">`
						
                   if(discount_rate != 0){
                	   selectItemValue += `<p class="mb-0 display-32 font-weight-600" style="color: rgb(240, 86, 86);"
                	   >${discount_rate}% 할인 적용</p>`
                   }
			                      
					   selectItemValue +=` <p class="mb-0">`
						
				   if(discount_rate != 0){	
					   selectItemValue += `<span class="totalPrice display-30 me-2" style="text-decoration: line-through; color: #aaa;"
                           data-price="${totalPrice}">${formattedTotalPrice}원</span>`
				   }
						
					   selectItemValue +=`<span class="discountPrice display-27 font-weight-600" data-price="${DiscountPrice}"
			                            >${formattedDiscountPrice}원</span></p>
			                        </div>
			                    </div>
			                </div>
			            </div>
					`
					
					$('#selectItems').append(selectItemValue);
					
					orderPriceCnt();
				
			},
			error: function(){
				consloe.log("error");
			}
		});
		
	}
	
	function orderPriceCnt(){
		
		// 전체 합계를 저장할 변수
		let orderPrice = 0; 
		
		// 모든 .totalPrice 요소를 선택하고 반복
		$('.discountPrice').each(function() {
		    // 각 .totalPrice 요소의 텍스트에서 숫자 부분만 추출
		    let discountPriceText = $(this).text().trim();
		    let discountPrice = parseInt(discountPriceText.replace(/[^0-9]/g, ''));

		    // 합계에 누적
		    orderPrice += discountPrice;
		});
		
		let formattedorderPrice = orderPrice.toLocaleString() + "원";
		$('.orderPrice').text(formattedorderPrice);
		
		console.log(orderPrice);
	}
	
	function totalPriceCnt(){
		
		// 전체 합계를 저장할 변수
		let totalPrice = 0; 
		
		// 모든 .totalPrice 요소를 선택하고 반복
		$('.product-subtotal').each(function() {
			let subtotalPriceText = $(this).text().trim();
			let subtotalPrice = parseInt(subtotalPriceText.replace(/[^0-9]/g, ''));
			
			totalPrice += subtotalPrice;
		});
		
		let formattedtotalPrice = totalPrice.toLocaleString() + "원";
		$('.totalPrice').text(formattedtotalPrice);
		
		
		// 총 배송비 계산
		let totalDeliveryPrice = 0;
		$('.dprice').each(function() {
			let deliveryPrice = $(this).data('dprice');
			
			totalDeliveryPrice += deliveryPrice;
		});
		
		let formattedtotalDeliveryPrice = totalDeliveryPrice.toLocaleString() + "원";
		$('.totalDeliveryPrice').text(formattedtotalDeliveryPrice);
		
		
		// 결제금액 계산
		let payPrice = totalPrice + totalDeliveryPrice;
		let formattedpayPrice = payPrice.toLocaleString() + "원";
		$('.payPrice').text(formattedpayPrice);
		
		
	}
	
	/// 장바구니 클릭 시 디비 저장
	function shopToCart(option_name, option_name2){
		let selectItemsLength = $('.selectItem').length;
		let selectItems = $('.selectItem');
		
		if(selectItemsLength < 1){
			alert("상품을 선택해주세요");
		} else {
			
			selectItems.each(function(index){
				
				//option_name
			    let optionNameInput = $('<input>')
			        .attr('type', 'hidden') // hidden 타입 설정
			        .attr('name', `cart_list[${index}].option_name`) // 유니크한 name 설정
			        .val(option_name); // input 값 설정
			    
			  //option_name2
			    let optionName2Input = $('<input>')
			        .attr('type', 'hidden') // hidden 타입 설정
			        .attr('name', `cart_list[${index}].option_name2`) // 유니크한 name 설정
			        .val(option_name2); // input 값 설정
			    
				//option_value
				let option_value = $(this).find('.optionVal1').data('opt');
			    let optionValueInput = $('<input>')
			        .attr('type', 'hidden') // hidden 타입 설정
			        .attr('name', `cart_list[${index}].option_value`) // 유니크한 name 설정
			        .val(option_value); // input 값 설정
			    
			    //option_value2
			    let option_value2 = $(this).find('.optionVal2').data('opt');
			    let optionValue2Input = $('<input>')
		        .attr('type', 'hidden') // hidden 타입 설정
		        .attr('name', `cart_list[${index}].option_value2`) // 유니크한 name 설정
		        .val(option_value2); // input 값 설정
			    
			    //quantity
			    let quantity = $(this).find('.itemCnt').text();
			    let quantityInput = $('<input>')
			    .attr('type', 'hidden') // hidden 타입 설정
			    .attr('name', `cart_list[${index}].quantity`) // 유니크한 name 설정
			    .val(quantity); // input 값 설정
			    
			    //option_price
			    let option_price = $(this).find('.optionVal1').data('opp');
			    let optionPriceInput = $('<input>')
			    .attr('type', 'hidden') // hidden 타입 설정
			    .attr('name', `cart_list[${index}].option_price`) // 유니크한 name 설정
			    .val(option_price); // input 값 설정
			    
			   // console.log(option_price);
			    
			    
			    // input 태그를 폼에 추가하거나 원하는 위치에 삽입
			    $('#ShopToCartFormInput').append(optionNameInput, optionName2Input,
			    		optionValueInput, optionValue2Input, quantityInput, optionPriceInput);
			});
			
			// FormData 객체 생성
	        let formData = new FormData($('#ShopToCartForm')[0]);
			
			console.log(formData);
			
	     	// AJAX 요청
	        $.ajax({
	            url: '/shop/shopToCart', // 서버의 URL
	            type: 'POST',
	            data: formData,
	            processData: false, // FormData 사용 시 false 설정
	            contentType: false, // FormData 사용 시 false 설정
	            success: function (response) {
	                $('#ShopToCartFormInput').empty();
	            },
	            error: function (xhr, status, error) {
	                console.error("Error:", error);
	            }
	        });
		}
	}
	
	// 장바구니에서 수량 조절 시 ajax 구현(디비 실시간 반영)
	function quantityChange(cart_detail_id, num){
		
		$.ajax({
			url: '/shop/quantityChange/'+num,
			type: 'POST',
			data: {
				cart_detail_id:cart_detail_id
			},
			success: function(){
				console.log("ok");
			},
			error: function(){
				console.log("no");
			}
		});
		
	}
	
	// 옵션 삭제 눌렀을 경우 ajax구현(디비 실시간 반영)
	function removeOption(cart_detail_id){
		$.ajax({
			url: '/shop/removeOption/'+cart_detail_id,
			type: 'POST',
			success: function(){
				console.log("ok");
			},
			error: function(){
				console.log("no");
			}
		});
	}
	
	// 상품 삭제 눌렀을 경우 ajax구현(디비 실시간 반영)
	function removeProduct(cart_id){
		$.ajax({
			url: '/shop/removeProduct/'+cart_id,
			type: 'POST',
			success: function(){
				console.log("ok");
			},
			error: function(){
				console.log("no");
			}
		});
	}
	
	// 장바구니 비우기 클릭 시 ajax구현(디비 실시간 반영)
	function emptyCart(){
		$.ajax({
			url: '/shop/emptyCart',
			type: 'POST',
			success: function(){
				console.log("ok");
			},
			error: function(){
				console.log("no");
			}
		});
	}
	
	


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
	
	
	
	

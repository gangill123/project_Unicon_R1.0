
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
				  confirmButtonColor: '#86bc42',
				  cancelButtonColor: '#aaa',
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
					  	  			  confirmButtonColor: '#86bc42',
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
				title: '정말 삭제하시겠습니까?',
				text: "삭제 후에는 복구할 수 없습니다.",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#86bc42',
				cancelButtonColor: '#aaa',
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
								confirmButtonColor: '#86bc42',
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
		const itemsPerPage = 8; // 페이지당 카드 개수
		const maxVisiblePages = 5;
		let startPage = Math.floor((currentPage - 1) / maxVisiblePages) * maxVisiblePages + 1;
		
		// 데이터 가져오기
		function fetchData(id) {
			
			//console.log(id);
			// id값에 따른 url 설정
			let url;
			if(id === 'myUni'){
				url = '/mypage/pet_filter/all';
			} else if(id === 'inUni'){
				url = '/mypage/pet_filter/all2';
			} else {
				url = '/mypage/getInterest';
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
			
			if(id === 'myUni'){
				
				let card = `
				<div class="col-lg-12" style="text-align: end; margin-top: 0;">
	             	<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/mypage/pet_create'">유니콘 등록</button>
	            </div>`;
				$grid.append(card);
				pageData.forEach(item => {
				card = `
					<div class="col-sm-6 col-md-4 col-lg-3">
	                        <a href="mypage/pet_view/${item.pet_id}">
	                        	<div class="product-details">
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
			
			} else if(id === 'inUni'){
				
			} else {
				pageData.forEach(item => {
				let card = `
					<div class="col-sm-6 col-md-4 col-lg-3">
	                        	<div class="product-details">
	                            <div class="product-img" style="padding: 10px;">
	                                <img src="${item.shopVO.product_images[0].image_src }" alt="...">
	                                <div class="product-cart">
                                        <a class="delInItem" data-id="${item.interest_id}" href="#!">
                                        <i class="fa-regular fa-trash-can"></i></a>
                                    </div>
	                            </div>
	                            <div class="product-info" style="padding: 0;">
	                                <a href="/shop/shop_detail/${item.product_id}">${item.shopVO.product_name }</a>
	                            </div>
	                        </div>
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
							<div class="label-offer2 bg-red">Day - ${diffInDays + 1}</div>`
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
		
		//console.log("newsIds :"+newsIds);

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
		let selectItems = $('.selectItem');
		
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
	
	
	// 배송지 모달 오픈 시 배송지 정보 출력
	function addrModalOpen(){
		
		$.ajax({
			url: '/orders/getAddrInfo',
			type: 'GET',
			success: function(response){
				
				$('.choiceContentBody').empty();
				
				response.forEach(function(item){
					
					let formattedPhone = (item.recipient_phone).replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					
					let modalContents = `
					<div class="addrInfo rounded mb-4" style="padding: 20px; background: white;">
                    	<div>
                		<h5 style="display:inline;">${item.address_name}</h5>`
                	if(item.is_default_address == 'true'){
                		modalContents += ` <span class="label-sale text-white rounded px-1 ms-1" style="background:#86bc42;">기본배송지</span>`
                	}	
                		
					modalContents += `</div>
                	<div class="row">
                		<div class="col-sm-12">${item.road_address} ${item.extra_address}, ${item.detail_address}</div>
                	</div>
                	<div class="row">
                		<div class="col-sm-6 display-30 mb-2">
                     		<p class="pe-2" style="color: #aaa; display: inline;">${item.recipient}</p>
                     		<p class="ps-2" style="color: #aaa; display: inline;">${formattedPhone}</p>
                 		</div>
                	</div>
                	<div class="row">
                		<div class="col-sm-6 display-30 mb-2">
                    		<button type="button" class="addrUbtn btn btn-outline-secondary" data-id="${item.address_id}">수정</button>
                    		<button type="button" class="addrDbtn btn btn-outline-secondary" data-id="${item.address_id}">삭제</button>
                		</div>
                		<div class="col-sm-6 display-30 mb-2" style="text-align: end;">
                    		<button class="addrSbtn butn primary small rounded" data-id="${item.address_id}"><span>선택</span></button>
                		</div>
                	</div>
                </div>`
					
					$('.choiceContentBody').append(modalContents);
					
				});
			},
			error: function(){
			}
		});
	}
	
	
	// 배송지 수정 버튼 시 로직
	function addrUBtn(address_id){
		
		$.ajax({
			url: '/orders/getAddrToId/'+address_id,
			type: 'POST',
			success: function(response){
				//console.log(response);
				
				$('#addressInputLabel').text('배송지 수정');
				$('.saveBtnText').text('수정하기');
				$('input[name="address_name"]').val(response.address_name);
				$('input[name="recipient"]').val(response.recipient);
				$('input[name="recipient_phone"]').val(response.recipient_phone);
				$('input[name="postal_code"]').val(response.postal_code);
				$('input[name="road_address"]').val(response.road_address);
				$('input[name="detail_address"]').val(response.detail_address);
				$('input[name="extra_address"]').val(response.extra_address);
				
				if(response.is_default_address == 'true'){
					$('input[name="is_default_address"]').prop('checked', true);
				} else {
					$('input[name="is_default_address"]').prop('checked', false);
				}
				
				$("#saveAddrForm").attr("id", "updateAddrForm");
				$("#updateAddrForm").attr("data-addrid", address_id);
				
			},
			error: function(){
				
			}
		});
	}
	
	// 배송지 선택 시 정보 화면으로 이동 출력
	function SelectAddrInfo(address_id){
		
		$.ajax({
			url: '/orders/getAddrToId/'+address_id,
			type: 'POST',
			success: function(response){
				//alert("ok");
				
				$('#addrName').text(response.address_name);
				let totalAddr = `<span id="address">${response.road_address}${response.extra_address}</span>
	                          		, <span id="detail_address">${response.detail_address}</span>`;
				$('#totalAddr').html(totalAddr)
				$('#recipient').text(response.recipient);
				let formattedPhone = (response.recipient_phone).replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
				$('#recipient_phone').text(formattedPhone);
				$('#postCode').val(response.postal_code);
				
				if(response.is_default_address == 'true'){
					$('.isDefault').show();
				} else{
					$('.isDefault').hide();
				}
				
				$('.addrModal').modal('hide');
				
			},
			error: function(){
				
			}
		});
	}
	
	// 상품구매하기 시 주문테이블에 저장
	function CartToCheckout(){
		
		//total_product_price
		let totalPriceText = $('.totalPrice').text().trim();
		let totalPrice = parseInt(totalPriceText.replace(/,/g, '').replace(/[^0-9]/g, ''), 10);
		let totalPriceInput = $('<input>')
        .attr('type', 'hidden') // hidden 타입 설정
        .attr('name', `total_product_price`) // 유니크한 name 설정
        .val(totalPrice); // input 값 설정
		
		//total_delivery_price
		let totalDeliveryPriceText = $('.totalDeliveryPrice').text().trim();
		let totalDeliveryPrice = parseInt(totalDeliveryPriceText.replace(/,/g, '').replace(/[^0-9]/g, ''), 10);
		let totalDeliveryPriceInput = $('<input>')
		.attr('type', 'hidden') // hidden 타입 설정
		.attr('name', `total_delivery_price`) // 유니크한 name 설정
		.val(totalDeliveryPrice); // input 값 설정
		
		//total_price
		let payPriceText = $('.payPrice').text().trim();
		let payPrice = parseInt(payPriceText.replace(/,/g, '').replace(/[^0-9]/g, ''), 10);
		let payPriceInput = $('<input>')
		.attr('type', 'hidden') // hidden 타입 설정
		.attr('name', `total_price`) // 유니크한 name 설정
		.val(payPrice); // input 값 설정
		
		$('#CartToCheckoutFormInput').append(totalPriceInput, totalDeliveryPriceInput, payPriceInput);
		
		
		products = $('.product');
		
		products.each(function(index){
			
			//product_id
			let productId = $(this).data('prodid');
		    let productIdInput = $('<input>')
		        .attr('type', 'hidden') // hidden 타입 설정
		        .attr('name', `ordersDetails[${index}].product_id`) // 유니크한 name 설정
		        .val(productId); // input 값 설정
		    
		    //delivery_price
		    let deliveryPrice = $(this).find('.dprice').data('dprice');
		    let deliveryPriceInput = $('<input>')
		        .attr('type', 'hidden') // hidden 타입 설정
		        .attr('name', `ordersDetails[${index}].delivery_price`) // 유니크한 name 설정
		        .val(deliveryPrice); // input 값 설정
		    
		    	
		    let productSubprice = 0;
		    
		    	//옵션 반복(orders_detail_option)
		    	let productOptions = $('.productOption'+index);
		    	productOptions.each(function(index2){
		    		
		    		//product_option
		    		let option = $(this).find('.option').text();
		    		let optionInput = $('<input>')
			        .attr('type', 'hidden') // hidden 타입 설정
			        .attr('name', `ordersDetails[${index}].ordersDetailOptions[${index2}].product_option`) // 유니크한 name 설정
			        .val(option); // input 값 설정
		    		
		    		//option_price
		    		let optionPriceText = $(this).find('.subPrice').text();
		    		let optionPrice = parseInt(optionPriceText.replace(/,/g, '').replace(/[^0-9]/g, ''), 10);
		    		let optionPriceInput = $('<input>')
			        .attr('type', 'hidden') // hidden 타입 설정
			        .attr('name', `ordersDetails[${index}].ordersDetailOptions[${index2}].option_price`) // 유니크한 name 설정
			        .val(optionPrice); // input 값 설정
		    		
		    		// 상품별 가격합
		    		productSubprice += optionPrice;
		    		
		    		//quantity
		    		let quantity = $(this).find('.itemCnt').text();
		    		let quantityInput = $('<input>')
			        .attr('type', 'hidden') // hidden 타입 설정
			        .attr('name', `ordersDetails[${index}].ordersDetailOptions[${index2}].quantity`) // 유니크한 name 설정
			        .val(quantity); // input 값 설정
		    		
		    		$('#CartToCheckoutFormInput').append(optionInput, optionPriceInput, quantityInput);
		    		
		    	});
		    
		    	
	    	//product_subprice
		    let productSubpriceInput = $('<input>')
		        .attr('type', 'hidden') // hidden 타입 설정
		        .attr('name', `ordersDetails[${index}].product_subprice`) // 유니크한 name 설정
		        .val(productSubprice); // input 값 설정	
		    	
		    
		    // input 태그를 폼에 추가하거나 원하는 위치에 삽입
		    $('#CartToCheckoutFormInput').append(productIdInput, deliveryPriceInput, productSubpriceInput);
		});
		
		// FormData 객체 생성
        let formData = new FormData($('#CartToCheckoutForm')[0]);
		
     	// AJAX 요청
        $.ajax({
            url: '/shop/cartToCheckout', // 서버의 URL
            type: 'POST',
            data: formData,
            processData: false, // FormData 사용 시 false 설정
            contentType: false, // FormData 사용 시 false 설정
            success: function (response) {
                $('#CartToCheckoutFormInput').empty();
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
            }
        });
	}
	
	
	// 주문결제 페이지에서 결제하기 버튼 클릭 시 로직(결제 성공 시)
	function Checkout(order_id, pay_method, imp_uid){
		
		//address
		let address = $('#address').text();
		let addressInput = $('<input>')
        .attr('type', 'hidden') // hidden 타입 설정
        .attr('name', `address`) // 유니크한 name 설정
        .val(address); // input 값 설정
		
		//detail_address
		let detailAddress = $('#detail_address').text();
		let detailAddressInput = $('<input>')
		.attr('type', 'hidden') // hidden 타입 설정
		.attr('name', `detail_address`) // 유니크한 name 설정
		.val(detailAddress); // input 값 설정
		
		//recipient
		let recipient = $('#recipient').text();
		let recipientInput = $('<input>')
		.attr('type', 'hidden') // hidden 타입 설정
		.attr('name', `recipient`) // 유니크한 name 설정
		.val(recipient); // input 값 설정
		
		//recipient_phone
		let recipientPhone = $('#recipient_phone').text();
		let recipientPhoneInput = $('<input>')
		.attr('type', 'hidden') // hidden 타입 설정
		.attr('name', `recipient_phone`) // 유니크한 name 설정
		.val(recipientPhone); // input 값 설정
		
		//pay_method
		let payMethodInput = $('<input>')
		.attr('type', 'hidden') // hidden 타입 설정
		.attr('name', `pay_method`) // 유니크한 name 설정
		.val(pay_method); // input 값 설정
		
		//imp_uid
		let impUidInput = $('<input>')
		.attr('type', 'hidden') // hidden 타입 설정
		.attr('name', `imp_uid`) // 유니크한 name 설정
		.val(imp_uid); // input 값 설정
		
		$('#addrInfoFormInput').append(addressInput, detailAddressInput, recipientInput, recipientPhoneInput, 
				payMethodInput, impUidInput);
		
		// FormData 객체 생성
        let formData = new FormData($('#addrInfoForm')[0]);
		
     	// AJAX 요청
        $.ajax({
            url: '/orders/saveAddr/'+order_id, // 서버의 URL
            type: 'POST',
            data: formData,
            processData: false, // FormData 사용 시 false 설정
            contentType: false, // FormData 사용 시 false 설정
            success: function (response) {
            	Swal.fire({
  	  			  title: '결제가 완료되었습니다!',
  	  			  text: "주문확인 페이지로 이동합니다.",
  	  			  icon: 'success',
  	  			  confirmButtonColor: '#86bc42',
  	  			  customClass: {
  	  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
  	  			  }
  	 			}).then((result) => {
  	 			    if (result.isConfirmed) { 
  	 			        window.location.href = `/orders/ordersCheck/${order_id}`; // 이동할 URL
  	 			    }
  	 			});
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
            }
        });
		
		
	}
	
	
	// 쇼핑몰 대분류 클릭 시 소분류 만들기
	function makeCategoryValue(categoryType, categoryValue, checkCnt){
		
		console.log(checkCnt);
		
		$.ajax({
			url: 'shop/makeCategoryValue/'+categoryType,
			type: 'GET',
			success: function(response){
				let items = response.category_value.split(",");
				console.log(items);
				$('#categoryValueSelector').empty();
				$('#categoryValueSelector').append(`<option disabled selected>소분류를 선택하세요</option>`);
				$.each(items, function(index, item){
					$('#categoryValueSelector').append(`<option value="${item}">${item}</option>`);
				});
				
				
				if(categoryValue != '' && checkCnt == 0){
					$('#categoryValueSelector').val(categoryValue);
				}
				
				
			},
			error: function(){
				alert("error");
			}
		});
		
	}
	
	
	
	///// 상품페이지 페이징 처리/////
	function productPaging(categoryType, categoryValue, currentPage){
		
		//최초 로딩(페이지 로딩시)
		fetchData(categoryType, categoryValue, currentPage);
		
		//페이징 처리
		let allData = []; // 전체 데이터를 저장
		//let currentPage = 1; // 현재 페이지
		let totalItems;
		const itemsPerPage = 8; // 페이지당 카드 개수
		const maxVisiblePages = 5;
		let startPage = Math.floor((currentPage - 1) / maxVisiblePages) * maxVisiblePages + 1;
		
		// 데이터 가져오기
		function fetchData(categoryType, categoryValue, currentPage) {
			let url;
			
			$.ajax({
				url: '/shop/shop_paging', // 데이터를 가져올 API URL
				type: 'GET',
				data: {
					categoryType: categoryType,
					categoryValue: categoryValue
				},
				success: function (response) {
					//alert("ok");
					allData = response; // 데이터를 저장
					console.log(allData);
					renderPage(currentPage);
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
				
				let formattedProductPrice = addCommas(item.product_price);
				let discountedPrice = Math.floor((item.product_price*(100-item.discount_rate)/100)/100)*100;
				
				let card = `
				<div class="col-xl-3 col-sm-6">
                    <div class="product-details">
                        <div class="product-img">`
					
					if(item.discount_rate != 0){
						card +=`<div class="label-offer bg-red">Sale</div>`
					}
				
					if(item.product_status == '품절'){
						card +=`<div class="label-offer2 bg-dark-gray">품절</div>`
					}
                        
				card += `<img src="${item.product_images[0].image_src}" alt="...">
                            <div class="product-cart">
                                <a class="checkedTrue" href="/shop/shop_detail/${item.product_id }?categoryType=${categoryType}&categoryValue=${categoryValue}&currentPage=${currentPage}">
                                <i class="fa-solid fa-magnifying-glass"></i></a>
                                <a class="interest" data-id="${item.product_id }" href="#!"><i class="fas fa-heart"></i></a>
                            </div>
                        </div>
                        <div class="product-info">
                            <a class="checkedTrue" href="/shop/shop_detail/${item.product_id }?categoryType=${categoryType}&categoryValue=${categoryValue}&currentPage=${currentPage}" 
                            style="margin-bottom: 0;">${item.product_name}</a>
                            <p class="price text-center m-0">`
					
					if(item.discount_rate != 0){
						card +=	`<span class="line-through me-2" style="font-size: 15px;">
                		${formattedProductPrice}</span>
                    	<span class="red">`+addCommas(discountedPrice)+`원</span>`
					} else {
						card += `<span>`+addCommas(item.product_price)+`원</span>`
					}
						
				card +=  `</p>
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
	/////쇼핑몰 페이징 처리 및 삭제처리/////
	
	
	
	// 마이페이지 주문관리 주문상태에 따른 주문정보 가져오기
	function getOrdersInfoToStatus(status, monthVal){
		
		$.ajax({
			url: '/mypage/getOrdersInfoToStatus/'+status,
			data: {
				monthVal:monthVal
			},
			type: 'GET',
			success: function(response){
				//console.log(response);
				let orderItemsContent = $('#orderItemsContent');
				
				orderItemsContent.empty();
				
				$.each(response, function(index, orders){
					
					let content = `
					<div class="orderItems[${index}]" style="margin-bottom: 50px;">
                    <h5 style="display: inline;">${orders.formatted_paydate }</h5>
                    <p style="display: inline; color: #aaa;">(주문번호 : ${orders.order_id })</p>`
						
					$.each(orders.ordersDetails, function(index, ordersDetail){
						
						let ordersDetailOptionsSize = ordersDetail.ordersDetailOptions.length - 1;
						
						content += `
						<div class="border rounded ps-3 pe-4 py-3 orderItem mb-1">
                          <div class="row">
                              <div class="col-sm-12 mb-4 mb-md-0" style="display: flex; justify-content: space-between;">
                              	  <h5 class="h6 font-weight-600 mb-4">${ordersDetail.orders_detail_status}</h5>`
							
						if(ordersDetail.orders_detail_status == '배송중' || 
							ordersDetail.orders_detail_status == '배송완료'||
							ordersDetail.orders_detail_status == '구매확정'){
							content += `
							<a href="/orders/orders_detail/${ordersDetail.order_detail_id }" class="readmore">
							<span>배송조회</span></a>`	
						}	
						
						content += `
							</div>
                              <div class="col-sm-2 mb-4 mb-md-0">
                              	<div class="orderImage">
                                  <img class="rounded" src="${ordersDetail.shopVO.product_images[0].image_src }" alt="...">
                              	</div>
                              </div>
                              <div class="col-sm-10">
                                  <p class="mb-0">주문일 : ${orders.formatted_paydate }</p>
                                  <a href="/shop/shop_detail/${ordersDetail.shopVO.product_id}">
                                  <p class="mb-0 font-weight-600">${ordersDetail.shopVO.product_name }</p></a>
                                  <p class="mb-0" style="color: #aaa;">${ordersDetail.ordersDetailOptions[0].product_option }
                                   외 ${ordersDetailOptionsSize}건</p>
                                  <div style="display:flex; justify-content: space-between; align-items: end;">
                                  	<div>
	                                  <h5 class="mb-2">`+addCommas(ordersDetail.product_subprice + ordersDetail.delivery_price)+`원</h5>
	                                  <a href="/mypage/orders_detail/${ordersDetail.order_detail_id }" class="readmore"><span>상세보기</span></a>
                                  	</div>
                                  	<div>
	                                  <button class="btn btn-outline-secondary me-2" style="min-width: 150px;"
	                                  onclick="location.href='/mypage/orders_detail/${ordersDetail.order_detail_id }';">문의하기</button>`
	                                 
	               if(ordersDetail.orders_detail_status == '구매확정'){
	            	   content += `<button class="btn btn-outline-success" style="min-width: 150px;"
	            	   onclick="location.href='/mypage/orders_detail/${ordersDetail.order_detail_id }';">리뷰쓰기</button>`
	               }
					if(ordersDetail.orders_detail_status == '결제완료'){
						content += `<button class="btn btn-outline-danger" style="min-width: 150px;"
						onclick="location.href='/mypage/orders_detail/${ordersDetail.order_detail_id }';">취소신청</button>`
					}
	                                  
						content += `</div>
                                  </div>
                              </div>
                          </div>
                      </div>
						`	
					});
					content += `</div>`
					orderItemsContent.append(content);
				});
			},
			error: function(){
				alert("no");
			}
		});
	}
	
	// 마이페이지 상단 탭(관심상품) 클릭 시 상품관련 정보 가져오기 + 페이징
	function interestPage(){
		
		$.ajax({
			url: '/mypage/getInterest',
			type: 'GET',
			success: function(response){
				console.log(response);
				
				let orderItemsContent = $('#orderItemsContent');
				orderItemsContent.empty();
				
				
				
			},
			error: function(){
				
			}
		});
	}
	
	
	//  마이페이지 리뷰작성 시 모달 로직
	function reviewModal(order_detail_option_id){
		$.ajax({
			url:'/mypage/ordersDetailForReview/'+order_detail_option_id,
			type: 'GET',
			success: function(response){
				console.log(response);
				
				let reviewModalContent = $('#reviewModalContent');
				reviewModalContent.empty();
				
				let reviewModalContentBody = `
				<div class="common-block" style="padding: 20px;">
                         <div class="line-title" style="margin-bottom: 20px;">
                             <h4 class="mb-0">리뷰 작성</h4>
                             <p class="mb-0">솔직하고 자세한 리뷰 부탁드립니다.</p>
                         </div>	
                         
                         <div class="row">
                              <div class="col-sm-2" style="margin-bottom: 20px;">
                              	<div class="orderImage">
                                  <img class="rounded" src="${response.shopVO.product_images[0].image_src}" alt="...">
                              	</div>
                              </div>
                              <div class="col-sm-10" >
                                  <p class="mb-0 display-30" style="color: #aaa;">${response.shopVO.memberVO.member_name}</p>
                                  <p class="mb-0 font-weight-600">${response.shopVO.product_name}</p>
                                  <p class="mb-0" style="color: #aaa;">${response.ordersDetailOptions[0].product_option}</p>
                              </div>
                         </div>
                         
                             <div class="row">
                                 <div class="col-sm-12">
                                     <div class="form-group">
                                         <select class="form-control form-select" name="review_rate">
                                             <option selected disabled>평점</option>
                                             <option value="5">5 점</option>
                                             <option value="4">4 점</option>
                                             <option value="3">3 점</option>
                                             <option value="2">2 점</option>
                                             <option value="1">1 점</option>
                                         </select>
                                     </div>
                                 </div>

                                 <div class="col-sm-12">
                                     <div class="form-group">
                                         <textarea id="message" class="form-control" name="review_content" rows="4" 
                                         placeholder="솔직한 리뷰 부탁드려요"></textarea>
                                     </div>
                                 </div>
                             </div>
							 <input type="hidden" name="product_id" value="${response.shopVO.product_id }">
							 <input type="hidden" name="order_detail_id" value="${response.order_detail_id }">
							 <input type="hidden" name="order_detail_option_id" 
							 value="${response.ordersDetailOptions[0].order_detail_option_id}">
                             <button type="submit" class="butn primary w-100"><span>완료</span></button>
                     </div>
                     `
					reviewModalContent.append(reviewModalContentBody);
					$('.reviewModal').modal('show');
				
			},
			error: function(){
				alert("no");
			}
		});
	}//reviewModal()
	
	// 리뷰 등록 시 알람창
	function reviewAlert(){
		Swal.fire({
			  title: '리뷰를 등록하시겠습니까?',
			  text: "등록 전 다시 한번 확인하시기 바랍니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#86bc42',
			  cancelButtonColor: '#aaa',
			  confirmButtonText: '등록',
			  cancelButtonText: '취소',
			  customClass: {
			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			  }
			}).then((result) => {
				if (result.isConfirmed) {
					Swal.fire({
	  	  			  title: '등록을 완료하였습니다!',
	  	  			  icon: 'success',
	  	  			  confirmButtonColor: '#86bc42',
	  	  			  customClass: {
	  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
	 			 	  }
	  				}).then(function(){
	  					$('#reviewCreateForm').off('submit').submit();
	  				});
				}
			});
	}
	
	// 취소신청 클릭 시 알람창
	function cancelAlert(order_detail_id, order_detail_option_id){
		Swal.fire({
			  title: '정말 취소하시겠습니까?',
			  text: "취소할 상품과 옵션을 확인하시기 바랍니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#86bc42',
			  cancelButtonColor: '#aaa',
			  confirmButtonText: '취소',
			  cancelButtonText: '닫기',
			  customClass: {
			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			  }
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url: '/mypage/ordersCancel/'+order_detail_option_id,
						type: 'POST',
						success: function(){
							//alert("ok");
							Swal.fire({
			  	  			  title: '취소를 완료하였습니다!',
			  	  			  icon: 'success',
			  	  			  confirmButtonColor: '#86bc42',
			  	  			  customClass: {
			  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			 			 	  }
			  				}).then(function(){
			  					window.location.href = "/mypage/orders_detail/"+order_detail_id; // 이동할 URL
			  				});
						},
						error: function(){
							alert("no");
						}
					});
	  				
				}
			});
	}
	
	
	
	//  마이페이지 문의작성 시 모달 로직
	function inquiryModal(order_detail_option_id){
		$.ajax({
			url:'/mypage/ordersDetailForReview/'+order_detail_option_id,
			type: 'GET',
			success: function(response){
				console.log(response);
				
				let inquiryModalContent = $('#inquiryModalContent');
				inquiryModalContent.empty();
				
				let inquiryModalContentBody = `
				<div class="common-block" style="padding: 20px;">
                         <div class="line-title" style="margin-bottom: 20px;">
                             <h4 class="mb-0">문의하기</h4>
                             <p class="mb-0">문의 사항을 상세하게 작성 부탁드립니다.</p>
                         </div>	
                         
                         <div class="row">
                              <div class="col-sm-2" style="margin-bottom: 20px;">
                              	<div class="orderImage">
                                  <img class="rounded" src="${response.shopVO.product_images[0].image_src}" alt="...">
                              	</div>
                              </div>
                              <div class="col-sm-10" >
                                  <p class="mb-0 display-30" style="color: #aaa;">${response.shopVO.memberVO.member_name}</p>
                                  <p class="mb-0 font-weight-600">${response.shopVO.product_name}</p>
                                  <p class="mb-0" style="color: #aaa;">${response.ordersDetailOptions[0].product_option}</p>
                              </div>
                         </div>
                         
                             <div class="row">
                                 <div class="col-sm-12">
                                     <div class="form-group">
                                         <select class="form-control form-select" name="inquiry_type">
                                             <option selected disabled>문의유형</option>
                                             <option value="상품">상품</option>
                                             <option value="배송">배송</option>
                                             <option value="교환">교환</option>
                                             <option value="환불">환불</option>
                                             <option value="기타">기타</option>
                                         </select>
                                     </div>
                                 </div>

                                 <div class="col-sm-12">
                                     <div class="form-group">
                                         <textarea id="message" class="form-control" name="inquiry_content" rows="4" 
                                         ></textarea>
                                     </div>
                                 </div>
                             </div>
							 <input type="hidden" name="product_id" value="${response.shopVO.product_id }">
							 <input type="hidden" name="order_detail_id" value="${response.order_detail_id }">
							 <input type="hidden" name="order_detail_option_id" 
							 value="${response.ordersDetailOptions[0].order_detail_option_id}">
                             <button type="submit" class="butn primary w-100"><span>문의 등록</span></button>
                     </div>
                     `
					inquiryModalContent.append(inquiryModalContentBody);
					$('.inquiryModal').modal('show');
				
			},
			error: function(){
				alert("no");
			}
		});
	}//reviewModal()
	
	
	// 문의하기 등록 시 알람창
	function inquiryAlert(){
		Swal.fire({
			  title: '문의를 등록하시겠습니까?',
			  text: "문의유형과 문의내용을 확인하시기 바랍니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#86bc42',
			  cancelButtonColor: '#aaa',
			  confirmButtonText: '등록',
			  cancelButtonText: '취소',
			  customClass: {
			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			  }
			}).then((result) => {
				if (result.isConfirmed) {
					Swal.fire({
	  	  			  title: '등록을 완료하였습니다!',
	  	  			  icon: 'success',
	  	  			  confirmButtonColor: '#86bc42',
	  	  			  customClass: {
	  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
	 			 	  }
	  				}).then(function(){
	  					$('#inquiryCreateForm').off('submit').submit();
	  				});
				}
			});
	}
	
	
	// 주문확인페이지에서 문의하기 클릭 시 마이페이지 주문상세로 이동
	function inquiryCheck(order_detail_id){
		Swal.fire({
			  title: '마이페이지로 이동합니다.',
			  text: "마이페이지 주문상세에서 문의 가능합니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#86bc42',
			  cancelButtonColor: '#aaa',
			  confirmButtonText: '이동',
			  cancelButtonText: '취소',
			  customClass: {
			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			  }
			}).then((result) => {
				if (result.isConfirmed) {
					window.location.href = "/mypage/orders_detail/"+order_detail_id; // 이동할 URL
				}
			});
	}
	
	
	

	// 정규식을 이용해 숫자 포맷팅
	function addCommas(number) {
	    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
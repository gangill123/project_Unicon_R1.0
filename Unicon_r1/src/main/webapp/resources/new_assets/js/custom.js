
	/////소식 페이징 처리 및 삭제처리/////
	function newsPaging(resion, currentPage){
		
		//현재날짜 
		const today = new Date(); 
		
		//최초 로딩(페이지 로딩시)
		fetchData(resion, currentPage);
		
		//페이징 처리
		let allData = []; // 전체 데이터를 저장
		//let currentPage = 1; // 현재 페이지
		let totalItems;
		const itemsPerPage = 8; // 페이지당 카드 개수
		const maxVisiblePages = 5;
		let startPage = Math.floor((currentPage - 1) / maxVisiblePages) * maxVisiblePages + 1;
		
		// 데이터 가져오기
		function fetchData(resion, currentPage) {
			let url;
			
			if(resion == '전국'){
				url = '/admin/news_filter/all'
			} else {
				url = '/admin/news_filter/'+resion
			}
			
			$.ajax({
				url: url, // 데이터를 가져올 API URL
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
				
				let endDate = new Date(item.news_enddate); 
				
				const card = `
				<div class="col-xl-3 col-sm-6">
					<div class="product-details">
						<div class="product-img">
							<div class="label-offer bg-${today > endDate ? 'red' : 'primary'}">
							${today > endDate ? '개시마감' : '개시중'}</div>
							<img src="${item.news_src }" alt="..." class="image rounded-3">
							<div class="product-cart">
								<a href="/admin/news_view/${item.news_id }?resion=${resion}&currentPage=${currentPage}" style="width: 50px; height: 50px;">
									<i class="fa-regular fa-pen-to-square"></i></a>
								<a class="deleteNews" data-id=${item.news_id } style="width: 50px; height: 50px;">
									<i class="fa-solid fa-trash-can"></i></a>
							</div>
						</div>
						<div class="product-info" style="padding: 0;">
							<a href="/admin/news_view/${item.news_id }">${item.news_subject }</a>
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
					  					fetchData(resion, currentPage);
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
				
				let endDate = new Date(item.ms_enddate); 
				
				const card = `
					<div class="col-xl-6 col-sm-6">
						<div class="product-details">
						<div class="product-img">
						<div class="label-offer bg-${today > endDate ? 'red' : 'primary'}">
						${today > endDate ? '개시종료' : '개시중'}</div>
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
			                            <h1 class="main-font">상단문구</h1>
			                            <div class="subheading" style="font-size: 30px; display:flex; justify-content: flex-start;">
			                            <div id="left_btm">좌측하단</div><strong>강조</strong><div id="right_btm">우측하단</div></div>
								    	<a href="#!" class="butn primary">
								    		<span class="alt-font">버튼</span>
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
	
	
	////마이페이지에서 선택에 따른 div변경
	function myPageForPropile(productDiv){
		let MyUniDiv;
		
		console.log("123");
		if(productDiv === 'myUni'){
			
			MyUniDiv = `
				<div class="col-lg-12" style="text-align: end; margin-top: 0;">
				<button type="button" class="btn btn-secondary btn-sm">유니콘 등록</button>
				</div>
				<div class="col-sm-6 col-md-4 col-lg-3">
				<div class="product-details">
				<div class="product-img">
				<img src="/resources/new_assets/img/shop/product-01.jpg" alt="...">
				</div>
				<div class="product-info">
				<a href="#!">Sneakers Shoe</a>
				<p class="price text-center m-0">
				</p>
				</div>
				</div>
				</div>
				`
		}
		
		 // 해당 div에 삽입
	    $('.product-grid').append(MyUniDiv);
	}
	

	
	
	
	
	
	

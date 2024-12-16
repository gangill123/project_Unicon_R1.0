/**
 * 
 */

function readPostType(postType) {
    $('.communityType').empty(); // 기존 게시물 삭제
    $('#loadMoreOngoing').show(); // 더보기 버튼 다시 보이도록 설정

    $.ajax({
        url: '/community/readPostType/' + postType,
        type: 'GET',
        success: function(data) {
            console.log(data);

            // 게시물 추가
            data.forEach(function(p, index) {
                let selectedImageSrc = ''; // 선택된 이미지의 src

                // post_images에서 image_sequence가 0인 이미지를 찾음
                if (p.post_images && p.post_images.length > 0) {
                    let primaryImage = p.post_images.find(img => img.image_sequence === 0);
                    selectedImageSrc = primaryImage.image_src;
                } else {
                    selectedImageSrc = `${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg`;
                }

                // HTML 템플릿
                let postCard = `
                    <div class="col-lg-3 col-md-6 items finance mt-3 post-item ${index >= 8 ? 'd-none' : ''}" 
                         data-src="${selectedImageSrc}" 
                         data-sub-html="<h4 class='text-white'>Investment Project #01</h4><p>Finance Plan</p>">
                        <div class="project-grid" style="display: flex; flex-wrap: wrap;">
                            <div class="project-grid-img" style="width: 306px; height: 306px; overflow: hidden;">
                                <img style="width: 100%; height: 100%; object-fit: fill;" alt="..." src="${selectedImageSrc}">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!" class="open-modal" data-post-id="${p.post_id}" data-bs-toggle="modal" data-bs-target="#jjjModal">게시물 보기</a></h4>
                                    <p>${p.memberVO.member_nickname}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                `;

                // communityType 클래스에 추가
                $('.communityType').append(postCard);
            });
            
            // 더보기 버튼을 추가할 부분
            if (data.length > 8) {
                let loadMoreButton = `
                    <div class="text-center mt-4">
                        <button class="btn btn-outline-success" id="loadMoreOngoing">더보기</button>
                    </div>
                `;
                $('.communityType').append(loadMoreButton);
            }
            

            // 더보기 버튼 클릭 이벤트
            $('#loadMoreOngoing').on('click', function() {
                const hiddenItems = $('#postListList .post-item.d-none');
                const itemsToShow = hiddenItems.slice(0, 8);

                itemsToShow.removeClass('d-none');

                // 숨겨진 항목이 더 이상 없으면 버튼 숨기기
                if (hiddenItems.length <= 8) {
                    $(this).hide();
                }
            });
        },
        error: function(data) {
            alert('실패');
        }
    });
} // function readPostType(postType)

function readPostType02(postType, resionFilter, animalFilter) {
    $('.communityType').empty(); // 기존 게시물 삭제
    $('#loadMoreOngoing').show(); // 더보기 버튼 다시 보이도록 설정

    $.ajax({
        url: '/community/readPostType02/' + postType,
        type: 'GET',
        data : {
        	resionFilter:resionFilter,
        	animalFilter:animalFilter
//        	sortFilter:sortFilter,
        },
        success: function(data) {
            console.log(data);

            // 게시물 추가
            data.forEach(function(p, index) {
                let selectedImageSrc = ''; // 선택된 이미지의 src

                // post_images에서 image_sequence가 0인 이미지를 찾음
                if (p.post_images && p.post_images.length > 0) {
                    let primaryImage = p.post_images.find(img => img.image_sequence === 0);
                    selectedImageSrc = primaryImage.image_src;
                } else {
                    selectedImageSrc = `${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg`;
                }

                // HTML 템플릿
                let postCard = `
                    <div class="col-lg-3 col-md-6 items finance mt-3 post-item ${index >= 8 ? 'd-none' : ''}" 
                         data-src="${selectedImageSrc}" 
                         data-sub-html="<h4 class='text-white'>Investment Project #01</h4><p>Finance Plan</p>">
                        <div class="project-grid" style="display: flex; flex-wrap: wrap;">
                            <div class="project-grid-img" style="width: 306px; height: 306px; overflow: hidden;">
                                <img style="width: 100%; height: 100%; object-fit: fill;" alt="..." src="${selectedImageSrc}">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!" class="open-modal" data-post-id="${p.post_id}" data-bs-toggle="modal" data-bs-target="#jjjModal">게시물 보기</a></h4>
                                    <p>${p.memberVO.member_nickname}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                `;

                // communityType 클래스에 추가
                $('.communityType').append(postCard);
            });
            
            // 더보기 버튼을 추가할 부분
            if (data.length > 8) {
                let loadMoreButton = `
                    <div class="text-center mt-4">
                        <button class="btn btn-outline-success" id="loadMoreOngoing">더보기</button>
                    </div>
                `;
                $('.communityType').append(loadMoreButton);
            }
            

            // 더보기 버튼 클릭 이벤트
            $('#loadMoreOngoing').on('click', function() {
                const hiddenItems = $('#postListList .post-item.d-none');
                const itemsToShow = hiddenItems.slice(0, 8);

                itemsToShow.removeClass('d-none');

                // 숨겨진 항목이 더 이상 없으면 버튼 숨기기
                if (hiddenItems.length <= 8) {
                    $(this).hide();
                }
            });
        },
        error: function(data) {
            alert('실패');
        }
    });
} // function readPostType02(postType)

function readProfilePostType(postType, profileId) {
    $('.communityType').empty(); // 기존 게시물 삭제
    $('#loadMoreOngoing').show(); // 더보기 버튼 다시 보이도록 설정

    $.ajax({
        url: '/community/readProfilePostType/' + postType,
        type: 'GET',
        data: {
        	profileId:profileId
        },
        success: function(data) {
            console.log(data);

            // 게시물 추가
            data.forEach(function(p, index) {
                let selectedImageSrc = ''; // 선택된 이미지의 src

                // post_images에서 image_sequence가 0인 이미지를 찾음
                if (p.post_images && p.post_images.length > 0) {
                    let primaryImage = p.post_images.find(img => img.image_sequence === 0);
                    selectedImageSrc = primaryImage.image_src;
                } else {
                    selectedImageSrc = `${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg`;
                }

                // HTML 템플릿
                let postCard = `
                    <div class="col-lg-3 col-md-6 items finance mt-3 post-item ${index >= 8 ? 'd-none' : ''}" 
                         data-src="${selectedImageSrc}" 
                         data-sub-html="<h4 class='text-white'>Investment Project #01</h4><p>Finance Plan</p>">
                        <div class="project-grid" style="display: flex; flex-wrap: wrap;">
                            <div class="project-grid-img" style="width: 306px; height: 306px; overflow: hidden;">
                                <img style="width: 100%; height: 100%; object-fit: fill;" alt="..." src="${selectedImageSrc}">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!" class="open-modal" data-post-id="${p.post_id}" data-bs-toggle="modal" data-bs-target="#jjjModal">게시물 보기</a></h4>
                                    <p>${p.memberVO.member_nickname}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                `;

                // communityType 클래스에 추가
                $('.communityType').append(postCard);
            });
            
            // 더보기 버튼을 추가할 부분
            if (data.length > 8) {
                let loadMoreButton = `
                    <div class="text-center mt-4">
                        <button class="btn btn-outline-success" id="loadMoreOngoing">더보기</button>
                    </div>
                `;
                $('.communityType').append(loadMoreButton);
            }
            

            // 더보기 버튼 클릭 이벤트
            $('#loadMoreOngoing').on('click', function() {
                const hiddenItems = $('#postListList .post-item.d-none');
                const itemsToShow = hiddenItems.slice(0, 8);

                itemsToShow.removeClass('d-none');

                // 숨겨진 항목이 더 이상 없으면 버튼 숨기기
                if (hiddenItems.length <= 8) {
                    $(this).hide();
                }
            });
        },
        error: function(data) {
            alert('실패');
        }
    });
} // function readPostType(postType)

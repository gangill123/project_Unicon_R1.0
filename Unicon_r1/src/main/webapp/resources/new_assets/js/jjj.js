/**
 * 
 */

function readPostType(postType){
	
	$('.communityType').empty();
	
	$.ajax({
		url : '/community/readPostType/' + postType,
		type : 'GET',
		success : function(data){
			alert('성공');
			console.log(data);
			
			$.each(data, function(index, p){
				let postCard = `<div class="col-lg-3 col-md-6 items finance mt-3" data-src="/resources/new_assets/img/projects/pro-2.jpg" data-sub-html="<h4 class='text-white'>Investment Project #01</h4><p>Finance Plan</p>">
	               <div class="project-grid" style="display: flex; flex-wrap: wrap;">
	                   <div class="project-grid-img" style="width: 306px; height: 306px; overflow: hidden;"><img style="width: 100%; height: 100%; object-fit: fill;" alt="..." src="${p.post_images[0].image_src}">
	                   </div>
	                   <div class="project-grid-overlay">
	                       <div class="w-100 px-3">
	                           <h4><a href="#!" class="open-modal" data-post-id="${p.post_id }" data-bs-toggle="modal" data-bs-target="#jjjModal">상세 보기</a></h4>
	                           <p>${p.jypMemberVO.member_nickname }</p>
	                       </div>
	                   </div>
	               </div>
	           </div>`
					
					$('.communityType').append(postCard);
			});
			
			
	            
	           
			
			
			
			
			
			
		},
		error : function(data){
			alert('실패');
		}
		
	});
}
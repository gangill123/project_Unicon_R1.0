<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %>
<!-- topHeader / jquery 추가 -->
<!-- 추가 템플릿 css/js 작성란 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dc432479314390de8962dfc3739f2f5"></script>
</head>
<%@ include file="../inc/new_header.jsp" %>
<!-- header --> 

<!--====================================작성부=====================================-->
<section>
    <div class="container">
        <div class="row">
            <!-- 목록 부분 -->
            <div class="col-md-4">
                <input type="text" id="searchInput" class="form-control mb-3" placeholder="검색어를 입력하세요">
                <div class="list-group" id="locationList">
                    <a href="#" class="list-group-item list-group-item-action" data-lat="37.5665" data-lng="126.9780">
                        <strong>서울 동물입양센터</strong>
                        <small class="d-block text-muted">서울특별시 마포구 매봉산로 15</small>
                        <small class="d-block text-muted">02-2124-2839</small>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action" data-lat="37.8451" data-lng="127.0647">
                        <strong>한국동물구조관리협회</strong>
                        <small class="d-block text-muted">경기도 양주시 남면 감악산로 63-37</small>
                        <small class="d-block text-muted">031-867-9119</small>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action" data-lat="37.4845" data-lng="127.1026">
                        <strong>동물보호센터</strong>
                        <small class="d-block text-muted">서울특별시 강남구 광평로 지하 270</small>
                        <small class="d-block text-muted">02-3423-7711</small>
                    </a>
                </div>
            </div>
            <!-- 지도 부분 -->
            <div class="col-md-8">
                <div id="map" style="width:100%;height:600px;"></div>
            </div>
        </div>
    </div>
</section>
<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->
<script>
document.addEventListener("DOMContentLoaded", function() {
    kakao.maps.load(function() {
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(37.5665, 126.9780),
            level: 7
        };

        var map = new kakao.maps.Map(container, options);
        var currentMarker = null;
        var locations = [];

        // 위치 데이터 저장
        document.querySelectorAll('.list-group-item').forEach(function(item) {
            locations.push({
                element: item,
                name: item.querySelector('strong').textContent,
                address: item.querySelector('small:first-of-type').textContent,
                lat: parseFloat(item.getAttribute('data-lat')),
                lng: parseFloat(item.getAttribute('data-lng'))
            });
        });

        // 검색 기능 구현
        document.getElementById('searchInput').addEventListener('input', function(e) {
            var searchTerm = e.target.value.toLowerCase();
            locations.forEach(function(location) {
                if (location.name.toLowerCase().includes(searchTerm) || 
                    location.address.toLowerCase().includes(searchTerm)) {
                    location.element.style.display = '';
                } else {
                    location.element.style.display = 'none';
                }
            });
        });

        // 클릭 이벤트 리스너
        document.querySelectorAll('.list-group-item').forEach(function(item) {
            item.addEventListener('click', function(e) {
                e.preventDefault();
                
                var lat = parseFloat(this.getAttribute('data-lat'));
                var lng = parseFloat(this.getAttribute('data-lng'));
                var position = new kakao.maps.LatLng(lat, lng);
                
                if (currentMarker) {
                    currentMarker.setMap(null);
                }
                
                currentMarker = new kakao.maps.Marker({
                    position: position,
                    map: map
                });
                
                map.panTo(position);
                
                document.querySelectorAll('.list-group-item').forEach(function(el) {
                    el.classList.remove('active');
                });
                this.classList.add('active');
            });
        });
    });
});
</script>
<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %>
<!-- footer -->
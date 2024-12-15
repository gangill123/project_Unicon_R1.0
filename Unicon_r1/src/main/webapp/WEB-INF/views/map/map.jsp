<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %>
<%@ page import="com.Unicon.domain.MapVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Map</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dc432479314390de8962dfc3739f2f5&libraries=services"></script>
    <script type="text/javascript">
        var map, geocoder;
        var markers = [];
        var sigunguData = {
            "서울": ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"],
            "서울": ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"],
            "부산": ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"],
            "대구": ["남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구", "군위군"],
            "인천": ["강화군", "계양구", "남동구", "동구", "미추홀구", "부평구", "서구", "연수구", "옹진군", "중구"],
            "광주": ["광산구", "남구", "동구", "북구", "서구"],
            "대전": ["대덕구", "동구", "서구", "유성구", "중구"],
            "울산": ["남구", "동구", "북구", "중구", "울주군"],
            "세종특별자치시": [],
            "경기": ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"],
            "강원특별자치도": ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"],
            "충북": ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "진천군", "청주시", "충주시", "증평군"],
            "충남": ["계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시", "청양군", "태안군", "홍성군"],
            "전북특별자치도": ["고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"],
            "전남": ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"],
            "경북": ["경산시", "경주시", "고령군", "구미시", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"],
            "경남": ["거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"],
            "제주특별자치도": ["서귀포시", "제주시"]

        };

        function initMap() {
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(35.9078, 127.7669),
                level: 13
            };
            map = new kakao.maps.Map(container, options);
            geocoder = new kakao.maps.services.Geocoder();

            var southwestCoord = new kakao.maps.LatLng(33.0041, 125.0668);
            var northeastCoord = new kakao.maps.LatLng(38.6340, 131.8661);
            var bounds = new kakao.maps.LatLngBounds(southwestCoord, northeastCoord);
            map.setBounds(bounds);

            createAllMarkers();

            document.getElementById('sidoSelect').addEventListener('change', updateSigungu);
            document.getElementById('sigunguSelect').addEventListener('change', filterAddresses);
            document.getElementById('searchInput').addEventListener('input', filterAddresses);
        }

        function createAllMarkers() {
            document.querySelectorAll('.list-group-item').forEach(function(item) {
                var address = item.querySelector('strong').textContent;
                createMarker(address);
            });

            document.querySelectorAll('.list-group-item').forEach(function(item) {
                item.addEventListener('click', function(e) {
                    e.preventDefault();
                    var address = this.querySelector('strong').textContent;
                    moveToMarker(address);
                    document.querySelectorAll('.list-group-item').forEach(function(el) {
                        el.classList.remove('active');
                    });
                    this.classList.add('active');
                });
            });
        }

        function createMarker(address) {
            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    markers.push({address: address, marker: marker});
                    console.log('마커 생성:', address);
                } else {
                    console.error('주소 지오코딩 실패:', address);
                }
            });
        }

        function moveToMarker(address) {
            var markerObj = markers.find(m => m.address === address);
            if (markerObj) {
                map.setCenter(markerObj.marker.getPosition());
                map.setLevel(3);
                console.log('마커로 이동:', address);
            } else {
                console.error('마커를 찾을 수 없습니다:', address);
            }
        }

        function updateSigungu() {
            var sido = document.getElementById('sidoSelect').value;
            var sigunguSelect = document.getElementById('sigunguSelect');
            sigunguSelect.innerHTML = '<option value="">시/군/구 선택</option>';
            if (sido && sigunguData[sido]) {
                sigunguData[sido].forEach(function(sigungu) {
                    var option = document.createElement('option');
                    option.value = sigungu;
                    option.textContent = sigungu;
                    sigunguSelect.appendChild(option);
                });
                sigunguSelect.disabled = false;
            } else {
                sigunguSelect.disabled = true;
            }
            filterAddresses();
        }

        function filterAddresses() {
        	  var sido = document.getElementById('sidoSelect').value;
        	  var sigungu = document.getElementById('sigunguSelect').value;
        	  var searchTerm = document.getElementById('searchInput').value.toLowerCase();

        	  $.ajax({
        	    url: '/searchAddresses',
        	    method: 'GET',
        	    data: {
        	      sido: sido,
        	      sigungu: sigungu,
        	      term: searchTerm
        	    },
        	    success: function(filteredAddresses) {
        	      console.log('필터링된 주소:', filteredAddresses);
        	      updateAddressList(filteredAddresses);
        	      updateMarkers(filteredAddresses);
        	    },
        	    error: function(xhr, status, error) {
        	      console.error("Error occurred: " + error);
        	    }
        	  });
        	}


        function updateAddressList(addresses) {
            var locationList = document.getElementById('locationList');
            locationList.innerHTML = '';
            addresses.forEach(function(address) {
                var item = document.createElement('a');
                item.href = '#';
                item.className = 'list-group-item list-group-item-action';
                item.innerHTML = '<strong>' + address.road_address + '</strong>';
                item.addEventListener('click', function(e) {
                    e.preventDefault();
                    moveToMarker(address.road_address);
                });
                locationList.appendChild(item);
            });
        }

        function updateMarkers(filteredAddresses) {
        	  markers.forEach(function(markerObj) {
        	    var shouldDisplay = filteredAddresses.some(function(address) {
        	      return address.road_address.toLowerCase().includes(markerObj.address.toLowerCase());
        	    });
        	    markerObj.marker.setMap(shouldDisplay ? map : null);
        	  });
        	}


        document.addEventListener('DOMContentLoaded', function() {
            console.log('DOM 완전히 로드됨');
            initMap();
        });
    </script>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        .map-container {
            position: relative;
            height: calc(100vh - 56px);
        }
        #map {
            width: 100%;
            height: 100%;
        }
        .search-container {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 300px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            z-index: 1000;
            max-height: calc(100% - 40px);
            overflow-y: auto;
        }
        .location-list {
            max-height: 400px;
            overflow-y: auto;
        }
        .list-group-item:hover {
            background-color: #f8f9fa;
            cursor: pointer;
        }
        .pagination .page-item.active .page-link {
		    background-color: #1abc9c;
		    border-color: #1abc9c;
		    color: white;
		}
		
		.pagination .page-link {
		    color: #1abc9c;
		}
		
		.pagination .page-link:hover {
		    background-color: #f8f9fa;
		    color: #1abc9c;
		    border-color: #dee2e6;
		}
		
		.pagination .page-item.disabled .page-link {
		    color: #6c757d;
		}
        
    </style>
</head>
<body>
    <%@ include file="../inc/new_header.jsp" %>
    <div class="map-container">
        <div id="map"></div>
        <div class="search-container">
            <select id="sidoSelect" class="form-control mb-3">
                <option value="">시/도 선택</option>
                 <option value="서울">서울</option>
		            <option value="부산">부산</option>
		            <option value="대구">대구</option>
		            <option value="인천">인천</option>
		            <option value="광주">광주</option>
		            <option value="대전">대전</option>
		            <option value="울산">울산</option>
		            <option value="세종특별자치시">세종특별자치시</option>
		            <option value="경기">경기</option>
		            <option value="강원특별자치도">강원특별자치도</option>
		            <option value="충북">충북</option>
		            <option value="충남">충남</option>
		            <option value="전북특별자치도">전북특별자치도</option>
		            <option value="전남">전남</option>
		            <option value="경북">경북</option>
		            <option value="경남">경남</option>
		            <option value="제주특별자치도">제주특별자치도</option>
            </select>
            <select id="sigunguSelect" class="form-control mb-3" disabled>
                <option value="">시/군/구 선택</option>
            </select>
            <input type="text" id="searchInput" class="form-control mb-3" placeholder="검색어를 입력하세요">
            <div class="list-group" id="locationList">
                <% 
                List<MapVO> addresses = (List<MapVO>) request.getAttribute("addresses");
                int currentPage = (Integer) request.getAttribute("currentPage");
                int totalPages = (Integer) request.getAttribute("totalPages");
                if (addresses != null && !addresses.isEmpty()) {
                    for (MapVO address : addresses) {
                %>
                    <a href="#" class="list-group-item list-group-item-action">
                        <strong><%= address.getRoad_address() %></strong>
                    </a>
                <% 
                    }
                } else {
                    out.println("주소 정보가 없습니다.");
                }
                %>
            </div>
            <nav aria-label="Page navigation" class="mt-3">
                <ul class="pagination justify-content-center">
                    <li class="page-item <%= (currentPage == 1) ? "disabled" : "" %>">
                        <a class="page-link" href="?page=<%= currentPage - 1 %>" <%= (currentPage == 1) ? "tabindex='-1' aria-disabled='true'" : "" %>>이전</a>
                    </li>
                    <% for (int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                        <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                    </li>
                    <% } %>
                    <li class="page-item <%= (currentPage == totalPages) ? "disabled" : "" %>">
                        <a class="page-link" href="?page=<%= currentPage + 1 %>" <%= (currentPage == totalPages) ? "tabindex='-1' aria-disabled='true'" : "" %>>다음</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <%@ include file="../inc/new_footer.jsp" %>
</body>
</html>

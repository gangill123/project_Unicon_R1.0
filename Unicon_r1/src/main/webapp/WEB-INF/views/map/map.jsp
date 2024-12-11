<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %>
<%@ page import="com.Unicon.domain.MapVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Map</title>
    <script type="text/javascript">
        var map, geocoder;

        function loadKakaoMap() {
            var mapContainer = document.getElementById('map');
            if (mapContainer) {
                var script = document.createElement('script');
                script.src = 'https://dapi.kakao.com/v2/maps/sdk.js?appkey=7dc432479314390de8962dfc3739f2f5&libraries=services&autoload=false';
                script.onload = initMap;
                document.head.appendChild(script);
            } else {
                console.error('Map container not found. Retrying in 1 second...');
                setTimeout(loadKakaoMap, 1000);
            }
        }

        function initMap() {
            kakao.maps.load(function() {
                var container = document.getElementById('map');
                if (container) {
                    var options = {
                        center: new kakao.maps.LatLng(37.5665, 126.9780),
                        level: 7
                    };
                    map = new kakao.maps.Map(container, options);
                    geocoder = new kakao.maps.services.Geocoder();

                    document.querySelectorAll('.list-group-item').forEach(function(item) {
                        item.addEventListener('click', function(e) {
                            e.preventDefault();
                            var address = this.querySelector('strong').textContent;
                            searchAddressAndAddMarker(address);

                            document.querySelectorAll('.list-group-item').forEach(function(el) {
                                el.classList.remove('active');
                            });
                            this.classList.add('active');
                        });
                    });

                    document.getElementById('searchInput').addEventListener('input', function(e) {
                        var searchTerm = e.target.value.toLowerCase();
                        document.querySelectorAll('.list-group-item').forEach(function(item) {
                            var address = item.querySelector('strong').textContent.toLowerCase();
                            item.style.display = address.includes(searchTerm) ? '' : 'none';
                        });
                    });
                } else {
                    console.error('Map container not found after Kakao Maps SDK load');
                }
            });
        }

        function searchAddressAndAddMarker(address) {
            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    map.setCenter(coords);
                } else {
                    console.error('Failed to geocode address:', address);
                }
            });
        }

        document.addEventListener('DOMContentLoaded', function() {
            console.log('DOM fully loaded');
            loadKakaoMap();
        });
    </script>
    <style>
        .search-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .location-list {
            height: 600px;
            overflow-y: auto;
        }
        .list-group-item:hover {
            background-color: #f8f9fa;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file="../inc/new_header.jsp" %>

<section>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="search-container">
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
            <div class="col-md-8">
                <h4 class="mb-3">센터 위치</h4>
                <div id="map" style="width:100%;height:850px;"></div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../inc/new_footer.jsp" %>

</body>
</html>

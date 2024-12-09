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
                    var map = new kakao.maps.Map(container, options);
                    
                    var currentMarker = null;
                    var geocoder = new kakao.maps.services.Geocoder();
                    var locations = [];

                    function addMarker(coords) {
                        var marker = new kakao.maps.Marker({
                            position: coords,
                            map: map
                        });
                        kakao.maps.event.addListener(marker, 'click', function() {
                            map.panTo(coords);
                        });
                        return marker;
                    }

                    function searchAddress(address, callback) {
                        geocoder.addressSearch(address, function(result, status) {
                            if (status === kakao.maps.services.Status.OK) {
                                callback(new kakao.maps.LatLng(result[0].y, result[0].x));
                            } else {
                                console.error('Failed to geocode address:', address);
                            }
                        });
                    }

                    document.querySelectorAll('.list-group-item').forEach(function(item) {
                        var address = item.querySelector('small:first-of-type').textContent;
                        searchAddress(address, function(coords) {
                            locations.push({
                                element: item,
                                name: item.querySelector('strong').textContent,
                                address: address,
                                coords: coords
                            });
                            addMarker(coords);
                        });
                    });

                    document.getElementById('searchInput').addEventListener('input', function(e) {
                        var searchTerm = e.target.value.toLowerCase();
                        locations.forEach(function(location) {
                            location.element.style.display =
                                location.name.toLowerCase().includes(searchTerm) ||
                                location.address.toLowerCase().includes(searchTerm) ? '' : 'none';
                        });
                    });

                    document.querySelectorAll('.list-group-item').forEach(function(item) {
                        item.addEventListener('click', function(e) {
                            e.preventDefault();
                            var address = this.querySelector('small:first-of-type').textContent;

                            searchAddress(address, function(coords) {
                                map.panTo(coords);
                                if (currentMarker) currentMarker.setMap(null);
                                currentMarker = addMarker(coords);
                            });

                            document.querySelectorAll('.list-group-item').forEach(function(el) {
                                el.classList.remove('active');
                            });
                            this.classList.add('active');
                        });
                    });
                } else {
                    console.error('Map container not found after Kakao Maps SDK load');
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
                        if (addresses != null) {
                            for (MapVO address : addresses) { 
                        %>
                        <a href="#" class="list-group-item list-group-item-action">
                            <strong><%= address.getRoadAddress() %></strong> <!-- 도로명 주소 -->
                            <small class="d-block text-muted"><%= address.getJibunAddress() %></small> <!-- 지번 주소 -->
                        </a>
                        <%
                            }
                        } else {
                            out.println("주소 정보가 없습니다.");
                        }
                        %>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div id="map" style="width:100%;height:600px;"></div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../inc/new_footer.jsp" %>

</body>
</html>
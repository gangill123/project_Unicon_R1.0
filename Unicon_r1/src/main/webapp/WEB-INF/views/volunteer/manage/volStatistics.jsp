<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>봉사활동 통계</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
	
    <style>
        
		.stats-card {
	        background: #fff;
	        border-radius: 10px;
	        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	        margin-bottom: 30px;
	        width: 90%;  /* 카드 전체 너비 조절 */
	        margin: 0 auto;  /* 중앙 정렬 */
	    }
	
	    .stats-card .card-header {
	        background: #006e60;
	        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
	        padding: 15px 20px;  /* 패딩 축소 */
	        border-radius: 10px 10px 0 0;
	    }
	
	    .stats-card .card-title {
	        margin: 0;
	        color: #fff;
	        font-size: 1.2rem;  /* 제목 크기 축소 */
	        font-weight: 500;  /* 폰트 두께 조정 */
	    }
	
	    .stats-card .card-body {
	        padding: 15px;  /* 패딩 축소 */
	        position: relative;
	    }
	
	    .nav-tabs {
	        border: none;
	        margin-bottom: 0;
	        padding: 0 15px;
	    }
	
	    .nav-tabs .nav-link {
	        border: none;
	        color: #6c757d;
	        font-weight: 500;
	        padding: 8px 15px;  /* 패딩 축소 */
	        margin-right: 5px;
	        border-radius: 5px 5px 0 0;
	        transition: all 0.3s ease;
	        font-size: 0.9rem;  /* 탭 글자 크기 축소 */
	    }
	
	    /* 차트 컨테이너 크기 조절 */
	    .charts-wrapper {
	        position: relative;
	        background: #fff;
	        border-radius: 0 0 10px 10px;
	        height: 350px;  /* 높이 축소 */
	        width: 100%;
	        margin-top: 15px;
	        border-radius: 0;
	        margin-bottom: 0;
	    }
	
	    .chart-container {
	        position: absolute;
	        top: 0;
	        left: 0;
	        width: 100%;
	        height: 100%;
	        opacity: 0;
	        visibility: hidden;
	        transition: opacity 0.3s ease;
	        padding: 15px;
	        display: none;
	    }
	
	    .chart-container.active {
	        opacity: 1;
	        visibility: visible;
	        display: block;
	    }
	
	    .chart-container canvas {
	        width: 100% !important;
	        height: 100% !important;
	    }
	
	    .content-wrapper {
	        padding: 15px;  /* 패딩 축소 */
	        background: #f8f9fa;
	    }
	    
	    .footer {
		    background: #f8f9fa !important;
		}
		
	    /* 버튼 컨테이너 스타일 */
	    .card-footer {
	        padding: 15px 20px;
	        background-color: #fff;
	        border-top: 1px solid rgba(0, 0, 0, 0.1);
	        border-radius: 0 0 10px 10px;
	        text-align: right;
	    }
	
	    .list-button {
	        background-color: #424242;
	        color: #fff;
	        border: none;
	        padding: 8px 20px;
	        border-radius: 5px;
	        cursor: pointer;
	        font-size: 0.9rem;
	        font-weight: 500;
	        transition: all 0.3s ease;
	    }
	
	    .list-button:hover {
	        background-color: #383838;
	        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	    }
	
	    .list-button i {
	        margin-right: 5px;
	    }
	
    </style>
</head>
<body>
    <div class="container-scroller">
        <%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
        <div class="container-fluid page-body-wrapper">
            <%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="stats-card">
                        <div class="card-header">
                            <h3 class="card-title">봉사활동 통계 현황</h3>
                        </div>
                        <div class="card-body">
                            <!-- 탭 메뉴 -->
                            <ul class="nav nav-tabs" id="statsTabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-type="ageGroup">연령대별 통계</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-type="weekday">요일별 신청 통계</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-type="program">프로그램별 통계</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-type="monthly">월별 신청 추이</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-type="experience">반려동물 경험 통계</a>
                                </li>
                            </ul>

                            <!-- 차트 컨테이너 -->
                            <div class="charts-wrapper">
                                <div id="ageGroupChart" class="chart-container active">
                                    <canvas></canvas>
                                </div>
                                <div id="weekdayChart" class="chart-container">
                                    <canvas></canvas>
                                </div>
                                <div id="programChart" class="chart-container">
                                    <canvas></canvas>
                                </div>
                                <div id="monthlyChart" class="chart-container">
                                    <canvas></canvas>
                                </div>
                                <div id="experienceChart" class="chart-container">
                                    <canvas></canvas>
                                </div>
                            </div>
                        </div>
                	<div class="card-footer">
				        <button class="list-button" onclick="history.back()">
				            <i class="mdi mdi-format-list-bulleted"></i>목록으로
				        </button>
				    </div>
                    </div>
                </div>
                <%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
            </div>
        </div>
    </div>
    
<script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
<script src="/resources/admin/js/off-canvas.js"></script>
<script src="/resources/admin/js/hoverable-collapse.js"></script>
<script src="/resources/admin/js/misc.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
//1. 전역 변수와 설정
let charts = {};

const chartConfigs = {
    ageGroup: {
        type: 'bar',
        title: '연령대별 신청자 현황',
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { precision: 0 }
                }
            }
        }
    },
    weekday: {
        type: 'line',
        title: '요일별 신청 현황',
        formatData: (data) => {
            const weekdayMap = {
                'Sunday': '일요일',
                'Monday': '월요일',
                'Tuesday': '화요일',
                'Wednesday': '수요일',
                'Thursday': '목요일',
                'Friday': '금요일',
                'Saturday': '토요일'
            };
            return data.weekdayStats.map(item => ({
                weekday: weekdayMap[item.weekday] || item.weekday,
                count: item.count
            }));
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { precision: 0 }
                }
            }
        }
    },
    program: {
        type: 'bar',
        title: '프로그램별 신청자 현황',
        options: {
            scales: {
                x: {
                    ticks: {
                        maxRotation: 45,
                        minRotation: 45
                    }
                },
                y: {
                    beginAtZero: true,
                    ticks: { precision: 0 }
                }
            }
        }
    },
    monthly: {
        type: 'line',
        title: '월별 신청 추이',
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { precision: 0 }
                }
            }
        }
    },
    experience: {
        type: 'doughnut',
        title: '봉사 경험 여부',
        options: {
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    }
};

// 2. 유틸리티 함수
function getChartData(type, data) {
    try {
        switch (type) {
            case 'ageGroup':
                return {
                    labels: data.ageGroupStats.map(item => item.agegroup),
                    datasets: [{
                        label: '신청자 수',
                        data: data.ageGroupStats.map(item => item.count),
                        backgroundColor: '#4e73df'
                    }]
                };
            case 'weekday':
                const weekdayData = chartConfigs[type].formatData(data);
                return {
                    labels: weekdayData.map(item => item.weekday),
                    datasets: [{
                        label: '신청 건수',
                        data: weekdayData.map(item => item.count),
                        borderColor: '#1cc88a',
                        tension: 0.1,
                        fill: false
                    }]
                };
            case 'program':
                return {
                    labels: data.programStats.map(item => item.programname),
                    datasets: [{
                        label: '신청자 수',
                        data: data.programStats.map(item => item.applicantcount),
                        backgroundColor: '#f6c23e'
                    }]
                };
            case 'monthly':
                return {
                    labels: data.monthlyStats.map(item => item.month),
                    datasets: [{
                        label: '신청자 수',
                        data: data.monthlyStats.map(item => item.count),
                        borderColor: '#858796',
                        tension: 0.1,
                        fill: false
                    }]
                };
            case 'experience':
                return {
                    labels: ['경험 있음', '경험 없음'],
                    datasets: [{
                        data: [
                            parseInt(data.experienceStats?.experienced || 0),
                            parseInt(data.experienceStats?.inexperienced || 0)
                        ],
                        backgroundColor: ['#1cc88a', '#858796']
                    }]
                };
            default:
                console.error('Unknown chart type:', type);
                return null;
        }
    } catch (error) {
        console.error('Error creating chart data:', error);
        return null;
    }
}

// 3. 차트 관련 주요 함수들
function loadChartData(type) {
    console.log('Loading data for type:', type); 

    $.ajax({
        url: '/volunteer/manage/data',
        type: 'GET',
        contentType: 'application/json',
        success: function(data) {
            console.log('Data received:', data);
            console.log('Calling showChart with type:', type); 
            showChart(type, data);
        },
        error: function(xhr, status, error) {
            console.error('Error loading data:', error);
            console.log('Status:', status);
            console.log('Response:', xhr.responseText);
        }
    });
}

function showChart(type, data) {
    console.log('Starting showChart with type:', type);

    // 1. 모든 컨테이너를 비활성화
    document.querySelectorAll('.chart-container').forEach(container => {
        container.classList.remove('active');
    });

    // 2. 현재 차트의 컨테이너 찾기
    const containerSelector = '#' + type + 'Chart';
    const container = document.querySelector(containerSelector);

    if (!container) {
        console.error('Container not found: ' + containerSelector);
        return;
    }

    // 3. 이전 차트 제거
    if (charts[type]) {
        charts[type].destroy();
        charts[type] = null;
    }

    // 4. 새로운 캔버스 생성
    container.innerHTML = '<canvas></canvas>';
    const canvas = container.querySelector('canvas');
    const ctx = canvas.getContext('2d');

    // 5. 선택된 컨테이너 활성화
    container.classList.add('active');

    // 6. 새 차트 생성
    const chartData = getChartData(type, data);
    if (!chartData) {
        console.error('Failed to get chart data for type:', type);
        return;
    }

    charts[type] = new Chart(ctx, {
        type: chartConfigs[type].type,
        data: chartData,
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: chartConfigs[type].title,
                    font: { size: 16, weight: 'bold' }
                },
                legend: {
                    display: type === 'experience',
                    position: 'bottom'
                }
            },
            ...chartConfigs[type].options,
            animation: {
                duration: 500
            }
        }
    });
}

// 4. DOMContentLoaded 이벤트 리스너
document.addEventListener('DOMContentLoaded', function() {
	$('#statsTabs .nav-link').on('click', function(e) {
	    e.preventDefault();
	    const type = $(this).data('type');
	    console.log('Clicked tab type:', type);  // type 값 확인

	    $('#statsTabs .nav-link').removeClass('active');
	    $(this).addClass('active');

	    if (type) {  // type이 존재하는 경우에만 실행
	        loadChartData(type);
	    } else {
	        console.error('No type attribute found on clicked tab');
	    }
	});
    
    // 초기 차트 로드
    loadChartData('ageGroup');
});
    
</script>

</body>
</html>
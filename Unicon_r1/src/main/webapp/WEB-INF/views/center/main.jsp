<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>Unicon</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- SweetAlert2 CSS -->
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>

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
	    	position: relative;
	    }
	
	    .nav-tabs .nav-link:hover {
		    background-color: #e9ecef;
		    color: #495057;
		    border: none;
		}
		
		.nav-tabs .nav-link.active {
		    color: #006e60;
		    background-color: transparent;
		    border-bottom: 2px solid #006e60;
		}
		
		.nav-tabs .nav-link::after {
		    content: '';
		    position: absolute;
		    bottom: 0;
		    left: 0;
		    width: 100%;
		    height: 2px;
		    background-color: #006e60;
		    transform: scaleX(0);
		    transition: transform 0.3s ease;
		}
		
		.nav-tabs .nav-link:hover::after {
		    transform: scaleX(1);
		}
		
		.nav-tabs .nav-link.active::after {
		    transform: scaleX(1);
		}
		
		.nav-tabs .nav-item {
		    margin-bottom: -1px;
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
            <div class="d-xl-flex justify-content-between align-items-start">
            	<h2 class="text-dark font-weight-bold mb-2"> Overview dashboard </h2>
            </div>
            <div class="row">
              <div class="col-md-12">
                  <div class="d-md-block d-none">
                    <a href="#" class="text-light p-1"><i class="mdi mdi-view-dashboard"></i></a>
                    <a href="#" class="text-light p-1"><i class="mdi mdi-dots-vertical"></i></a>
                  </div>
                </div>
                <div class="tab-content tab-transparent-content">
                  <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
                    <div class="row">
                      <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body text-center">
                            <h5 class="mb-2 text-dark font-weight-normal">Orders</h5>
                            <h2 class="mb-4 text-dark font-weight-bold">932.00</h2>
                            <div class="dashboard-progress dashboard-progress-1 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-lightbulb icon-md absolute-center text-dark"></i></div>
                            <p class="mt-4 mb-0">Completed</p>
                            <h3 class="mb-0 font-weight-bold mt-2 text-dark">5443</h3>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body text-center">
                            <h5 class="mb-2 text-dark font-weight-normal">Unique Visitors</h5>
                            <h2 class="mb-4 text-dark font-weight-bold">756,00</h2>
                            <div class="dashboard-progress dashboard-progress-2 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-account-circle icon-md absolute-center text-dark"></i></div>
                            <p class="mt-4 mb-0">Increased since yesterday</p>
                            <h3 class="mb-0 font-weight-bold mt-2 text-dark">50%</h3>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3  col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body text-center">
                            <h5 class="mb-2 text-dark font-weight-normal">Impressions</h5>
                            <h2 class="mb-4 text-dark font-weight-bold">100,38</h2>
                            <div class="dashboard-progress dashboard-progress-3 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-eye icon-md absolute-center text-dark"></i></div>
                            <p class="mt-4 mb-0">Increased since yesterday</p>
                            <h3 class="mb-0 font-weight-bold mt-2 text-dark">35%</h3>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body text-center">
                            <h5 class="mb-2 text-dark font-weight-normal">Followers</h5>
                            <h2 class="mb-4 text-dark font-weight-bold">4250k</h2>
                            <div class="dashboard-progress dashboard-progress-4 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-cube icon-md absolute-center text-dark"></i></div>
                            <p class="mt-4 mb-0">Decreased since yesterday</p>
                            <h3 class="mb-0 font-weight-bold mt-2 text-dark">25%</h3>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-12 grid-margin">
                        
                        <div class="stats-card">
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
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
	<%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
    </div>
  </div>
</div>
<!-- Scripts -->
<script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
<script src="/resources/admin/js/off-canvas.js"></script>
<script src="/resources/admin/js/hoverable-collapse.js"></script>
<script src="/resources/admin/js/misc.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
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
	        },
	        plugins: {
	            legend: {
	                display: false
	            }
	        }
	    }
    },
    weekday: {
        type: 'line',
        title: '요일별 신청 현황',
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { 
                        precision: 0,
                        stepSize: 1
                    }
                }
            },
            plugins: {
                legend: {
                    display: false
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
                    ticks: { 
                        precision: 0,
                        stepSize: 1
                    }
                }
            },
            plugins: {
                legend: {
                    display: false
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
            // 연령대별 기본 데이터 생성
            var ageGroups = [
                { agegroup: '10', label: '10대', count: 0 },
                { agegroup: '20', label: '20대', count: 0 },
                { agegroup: '30', label: '30대', count: 0 },
                { agegroup: '40', label: '40대', count: 0 },
                { agegroup: '50', label: '50대', count: 0 },
                { agegroup: '60', label: '60대 이상', count: 0 }
            ];
            
            // DB에서 가져온 데이터로 해당 연령대의 count 업데이트
            data.ageGroupStats.forEach(function(stat) {
                var group = ageGroups.find(function(g) {
                    return g.agegroup === stat.agegroup;
                });
                if (group) {
                    group.count = Number(stat.count);
                }
            });

            return {
                labels: ageGroups.map(function(g) { return g.label; }),
                datasets: [{
                    label: '신청자 수',
                    data: ageGroups.map(function(g) { return g.count; }),
                    backgroundColor: '#4e73df'
                }]
            };
            case 'weekday':
                // 요일별 기본 데이터 생성 (1:일요일 ~ 7:토요일)
                var weekdays = [
                    { weekday: 1, name: '일요일', count: 0 },
                    { weekday: 2, name: '월요일', count: 0 },
                    { weekday: 3, name: '화요일', count: 0 },
                    { weekday: 4, name: '수요일', count: 0 },
                    { weekday: 5, name: '목요일', count: 0 },
                    { weekday: 6, name: '금요일', count: 0 },
                    { weekday: 7, name: '토요일', count: 0 }
                ];
                
                // DB에서 가져온 데이터로 해당 요일의 count 업데이트
                data.weekdayStats.forEach(function(stat) {
                    var idx = stat.weekday - 1;
                    if (idx >= 0 && idx < 7) {
                        weekdays[idx].count = Number(stat.count);
                    }
                });

                return {
                    labels: weekdays.map(function(d) { return d.name; }),
                    datasets: [{
                        label: '신청 건수',
                        data: weekdays.map(function(d) { return d.count; }),
                        borderColor: '#1cc88a',
                        backgroundColor: '#1cc88a',
                        tension: 0.1,
                        fill: false,
                        pointRadius: 5,
                        pointHoverRadius: 7
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
                // 1~12월 배열 생성
                var months = Array.from({length: 12}, function(_, i) {
                    return {
                        month: i + 1,
                        count: 0
                    };
                });
                
                // DB에서 가져온 데이터로 해당 월의 count 업데이트
                data.monthlyStats.forEach(function(stat) {
                    months[stat.month - 1].count = Number(stat.count);
                });
                
                return {
                    labels: months.map(function(m) { return m.month + '월'; }),
                    datasets: [{
                        label: '신청자 수',
                        data: months.map(function(m) { return m.count; }),
                        borderColor: '#858796',
                        backgroundColor: '#858796',
                        tension: 0.1,
                        fill: false,
                        pointRadius: 5,
                        pointHoverRadius: 7
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
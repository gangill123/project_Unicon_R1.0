<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>유니콘</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- plugins:css -->
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="preload" href="http://localhost:8088/resources/admin/fonts/Nunito/Nunito-Regular.woff2" as="font" type="font/woff2" crossorigin="anonymous">    
    <!-- endinject -->
    <!-- Plugin css for this page -->
	    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>  <!-- Chart.js 라이브러리 -->
    
    <style>

    
    </style>
    
    
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:navbar.jsp -->
      <%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:sidebar.jsp -->
        <%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">




	<div class="card">
		<div class="card-body">
			<h4 class="card-title">이번년도 문의 건수 차트</h4>
			<canvas id="barChart" style="height: 344px; display: block; width: 688px;" width="688" height="344" class="chartjs-render-monitor"></canvas>
		</div>
	</div>

<script>
$(document).ready(function() {
    // AJAX로 데이터를 가져옴
    $.ajax({
        url: '/api/statusCounts',  // API 호출
        method: 'GET',
        success: function(data) {
            // 데이터를 시각화
            renderChart(data);
        },
        error: function(error) {
            console.log("에러 발생:", error);
        }
    });

    // 차트 그리기
    function renderChart(data) {
        const months = Object.keys(data);  // 월 리스트
        const statusLabels = Object.keys(data[months[0]]);  // 상태 리스트
        const datasets = [];

        // 지정된 색상 배열 (예: 상태별로 다른 색상)
        const colors = [
            'rgba(255, 87, 51, 0.7)',  // 색상 1 (예: 입양 문의)
            'rgba(51, 255, 87, 0.7)',  // 색상 2 (예: 쇼핑몰 문의)
            'rgba(51, 87, 255, 0.7)',  // 색상 3 (예: 커뮤니티 문의)
            'rgba(255, 51, 161, 0.7)'  // 색상 4 (예: 기타 문의)
        ];

        // 각 상태에 대해 데이터셋을 준비
        statusLabels.forEach((status, index) => {
            const dataset = {
                label: status,
                data: [],
                backgroundColor: colors[index % colors.length],  // 색상 배열에서 순차적으로 색상 할당
                borderColor: colors[index % colors.length],  // 색상 배열에서 순차적으로 테두리 색상 할당
                borderWidth: 2,
                borderRadius: 5,  // 각 막대의 모서리를 둥글게 만들기
                hoverBackgroundColor: colors[index % colors.length],  // 마우스를 올렸을 때 색상 변경
                hoverBorderColor: colors[index % colors.length],  // 마우스를 올렸을 때 테두리 색상 변경
                hoverBorderWidth: 2  // 마우스를 올렸을 때 테두리 두께 증가
            };

            months.forEach(month => {
                dataset.data.push(data[month][status] || 0);  // 상태별 개수 추가
            });

            datasets.push(dataset);
        });

        // 차트 설정
        const ctx = document.getElementById('barChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',  // 차트 타입 (막대 차트)
            data: {
                labels: months,  // x축에 표시될 월들
                datasets: datasets  // 준비된 데이터셋들
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: '월별',
                            color: '#333',
                            font: {
                                size: 16,
                                weight: 'bold',
                                family: 'Arial'
                            }
                        },
                        grid: {
                            display: false // x축 그리드 숨기기
                        },
                        ticks: {
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: '건수',
                            color: '#333',
                            font: {
                                size: 16,
                                weight: 'bold',
                                family: 'Arial'
                            }
                        },
                        beginAtZero: true,  // 0부터 시작
                        max: Math.max(...datasets.map(dataset => Math.max(...dataset.data))) + 1, // y축의 최대값을 자동으로 계산하여 설정
                        grid: {
                            color: 'rgba(0, 0, 0, 0.1)',  // y축 그리드 선 색상
                            lineWidth: 1  // y축 그리드 선 두께
                        },
                        ticks: {
                            stepSize: 1,  // 각 틱 간격을 1로 설정
                            callback: function(value) {
                                return value;  // 숫자를 그대로 출력
                            }
                        }
                    }
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            font: {
                                size: 14,
                                weight: 'bold'
                            },
                            boxWidth: 20  // 레전드 아이콘 크기
                        }
                    },
                    tooltip: {
                        backgroundColor: 'rgba(0, 0, 0, 0.8)',  // 툴팁 배경 색상
                        titleFont: {
                            size: 16,
                            weight: 'bold'
                        },
                        bodyFont: {
                            size: 14
                        }
                    }
                },
                layout: {
                    padding: 20
                },
                animation: {
                    duration: 1000,  // 애니메이션 시간 설정
                    easing: 'easeOutBounce'  // 애니메이션 효과 설정
                },
                elements: {
                    bar: {
                        borderRadius: 8  // 막대 모서리 둥글게 만들기
                    }
                },
                backgroundColor: 'rgba(255, 255, 255, 0.1)',  // 차트 배경 색상
                borderColor: 'rgba(0, 0, 0, 0.1)',  // 차트 테두리 색상
                borderWidth: 1
            }
        });
    }
});
</script>
	<div class="card">
		<div class="card-body">
			<div class="chartjs-size-monitor">
				<div class="chartjs-size-monitor-expand">
					<div class=""></div>
				</div>
				<div class="chartjs-size-monitor-shrink">
					<div class=""></div>
				</div>
			</div>
			<h4 class="card-title">이번년도 문의 답변 작성 완료율</h4>
			<canvas id="doughnutChart" style="height: 462px; display: block; width: 925px;" width="740" height="369" class="chartjs-render-monitor"></canvas>
		</div>
	</div>























				</div>
          <!-- content-wrapper ends -->
          <!-- partial:footer.jsp -->
          <%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>
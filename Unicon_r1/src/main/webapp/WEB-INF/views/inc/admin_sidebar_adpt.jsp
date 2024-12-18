<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <!-- <li class="nav-item nav-category">Main</li> -->
            <li class="nav-item">
              <a class="nav-link" href="/center/main">
                <span class="icon-bg"><i class="mdi mdi-cube menu-icon"></i></span>
                <span class="menu-title">메인페이지</span>
              </a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#adoption-mgmt" aria-expanded="false" aria-controls="adoption-mgmt">
                <span class="icon-bg"><i class="mdi mdi-crosshairs-gps menu-icon"></i></span>
                <span class="menu-title">입양 관리</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="adoption-mgmt">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/AM/animals/creation">동물 등록</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/AM/animals/list">동물 목록</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/AM/writings/all">입양글 목록</a></li>
                </ul>
              </div>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#notice" aria-expanded="false" aria-controls="notice">
                <span class="icon-bg"><i class="mdi mdi-bullhorn"></i></span>
                <span class="menu-title">공지사항 관리</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="notice">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/notice/manage/form">공지사항 등록</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/notice/manage/noList">공지사항 목록</a></li>
                </ul>
              </div>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#volunteer" aria-expanded="false" aria-controls="volunteer">	
                <span class="icon-bg"><i class="mdi mdi-thumb-up-outline"></i></span>
                <span class="menu-title">봉사활동 관리</span>
                <i class="menu-arrow"></i>
              </a>  
              <div class="collapse" id="volunteer">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/volunteer/manage/volForm">봉사활동 등록</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/volunteer/manage/voList">봉사활동 목록</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/volunteer/manage/volStatistics">봉사활동 통계</a></li>
                </ul>
              </div>
            </li>
            
            
             <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#inquiry" aria-expanded="false" aria-controls="inquiry">
                <span class="icon-bg"><i class="mdi mdi-clipboard-text"></i></span>
                <span class="menu-title">고객센터 관리</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="inquiry">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/inquiry/manage">고객센터 문의 관리</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/inquiry/graph">문의 현황</a></li>
                </ul>
              </div>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <span class="icon-bg"><i class="mdi mdi-lock menu-icon"></i></span>
                <span class="menu-title">관리자 페이지</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/AM/manager/animals/everything"> 입양동물 관리 </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/AM/manager/writings/total"> 입양글 관리 </a></li>
                  <!-- <li class="nav-item"> <a class="nav-link" href="/pages/samples/blank-page"> Blank Page </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/pages/samples/login"> Login </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/pages/samples/register"> Register </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/pages/samples/error-404"> 404 </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/pages/samples/error-500"> 500 </a></li> -->
                </ul>
              </div>
            </li>
<!--            <li class="nav-item documentation-link">
              <a class="nav-link" href="http://www.bootstrapdash.com/demo/connect-plus-free/jquery/documentation/documentation" target="_blank">
                <span class="icon-bg">
                  <i class="mdi mdi-file-document-box menu-icon"></i>
                </span>
                <span class="menu-title">Documentation</span>
              </a>
            </li> -->
<!--            <li class="nav-item sidebar-user-actions">
              <div class="user-details">
                <div class="d-flex justify-content-between align-items-center">
                  <div>
                    <div class="d-flex align-items-center">
                      <div class="sidebar-profile-img">
                        <img src="/resources/admin/images/faces/face28.png" alt="image">
                      </div>
                      <div class="sidebar-profile-text">
                        <p class="mb-1">Henry Klein</p>
                      </div>
                    </div>
                  </div>
                  <div class="badge badge-danger">3</div>
                </div>
              </div>
            </li> -->
<!--             <li class="nav-item sidebar-user-actions">
              <div class="sidebar-user-menu">
                <a href="#" class="nav-link"><i class="mdi mdi-settings menu-icon"></i>
                  <span class="menu-title">Settings</span>
                </a>
              </div>
            </li> -->
<!--             <li class="nav-item sidebar-user-actions">
              <div class="sidebar-user-menu">
                <a href="#" class="nav-link"><i class="mdi mdi-speedometer menu-icon"></i>
                  <span class="menu-title">Take Tour</span></a>
              </div>
            </li>
            <li class="nav-item sidebar-user-actions">
              <div class="sidebar-user-menu">
                <a href="#" class="nav-link"><i class="mdi mdi-logout menu-icon"></i>
                  <span class="menu-title">Log Out</span></a>
              </div>
            </li> -->
          </ul>
        </nav>
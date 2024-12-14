<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <!-- <li class="nav-item nav-category">Main</li> -->
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#product-basic" aria-expanded="false" aria-controls="product-basic">
                <span class="icon-bg"><i class="mdi mdi-cube menu-icon"></i></span>
                <span class="menu-title">상품 관리</span>
                <i class="menu-arrow"></i>
              </a>
                <div class="collapse" id="product-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/store/admin/product/newList">신규 상품 목록</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/store/admin/products">전체 상품 목록</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#notice-basic" aria-expanded="false" aria-controls="notice-basic">
                <span class="icon-bg"><i class="mdi mdi-contacts menu-icon"></i></span>
                <span class="menu-title">공지사항 관리</span>
                 <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="notice-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/store/admin/notice">공지사항</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/store/admin/popup">팝업</a></li>
                </ul>
              </div>
              
              
            </li>
<!--             <li class="nav-item documentation-link">
              <a class="nav-link" href="http://www.bootstrapdash.com/demo/connect-plus-free/jquery/documentation/documentation" target="_blank">
                <span class="icon-bg">
                  <i class="mdi mdi-file-document-box menu-icon"></i>
                </span>
                <span class="menu-title">Documentation</span>
              </a>
            </li> -->
<!--             <li class="nav-item sidebar-user-actions">
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
            </li>
            <li class="nav-item sidebar-user-actions">
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
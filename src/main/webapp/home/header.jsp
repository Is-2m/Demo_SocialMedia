<%--
  Created by IntelliJ IDEA.
  User: is2m
  Date: 2024-04-07
  Time: 02:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" scope="session" value="${currentUser}"/>
<c:set var="friends" scope="session" value="${currentUser.getFriends()}"/>

<div class="iq-sidebar sidebar-default">
  <div id="sidebar-scrollbar">
    <nav class="iq-sidebar-menu">
      <ul id="iq-sidebar-toggle" class="iq-menu">
        <li class="active">
          <a href="feed.jsp" class=" ">
            <i class="las la-newspaper"></i><span>Newsfeed</span>
          </a>
        </li>
        <li class="">
          <a href="app/profile.html" class=" ">
            <i class="las la-user"></i><span>Profile</span>
          </a>
        </li>
      </ul>
    </nav>
    <div class="p-5"></div>
  </div>
</div>

<div class="iq-top-navbar">
  <div class="iq-navbar-custom">
    <nav class="navbar navbar-expand-lg navbar-light p-0">
      <div class="iq-navbar-logo d-flex justify-content-between">
        <a href="feed.jsp">
          <img src="../assets/images/logo.png" class="img-fluid" alt=""/>
          <span>SocialV</span>
        </a>
        <div class="iq-menu-bt align-self-center">
          <div class="wrapper-menu">
            <div class="main-circle"><i class="ri-menu-line"></i></div>
          </div>
        </div>
      </div>
      <div class="iq-search-bar device-search">
        <form action="#" class="searchbox">
          <a class="search-link" href="#"
          ><i class="ri-search-line"></i
          ></a>
          <input
              type="text"
              class="text search-input"
              placeholder="Search here..."
          />
        </form>
      </div>
      <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-label="Toggle navigation"
      >
        <i class="ri-menu-3-line"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto navbar-list">
          <li>
            <a
                href="dashboard/index.html"
                class="d-flex align-items-center"
            >
              <i class="ri-home-line"></i>
            </a>
          </li>
          <li class="nav-item dropdown">
            <a
                href="#"
                class="dropdown-toggle"
                id="group-drop"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
            ><i class="ri-group-line"></i
            ></a>
            <div
                class="sub-drop sub-drop-large dropdown-menu"
                aria-labelledby="group-drop"
            >
              <div class="card shadow-none m-0">
                <div
                    class="card-header d-flex justify-content-between bg-primary"
                >
                  <div class="header-title">
                    <h5 class="mb-0 text-white">Friend Request</h5>
                  </div>
                  <small class="badge bg-light text-dark">4</small>
                </div>
                <div class="card-body p-0">
                  <div class="iq-friend-request">
                    <div
                        class="iq-sub-card iq-sub-card-big d-flex align-items-center justify-content-between"
                    >
                      <div class="d-flex align-items-center">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/01.jpg"
                            alt=""
                        />
                        <div class="ms-3">
                          <h6 class="mb-0">Jaques Amole</h6>
                          <p class="mb-0">40 friends</p>
                        </div>
                      </div>
                      <div class="d-flex align-items-center">
                        <a
                            href="javascript:void();"
                            class="me-3 btn btn-primary rounded"
                        >Confirm</a
                        >
                        <a
                            href="javascript:void();"
                            class="me-3 btn btn-secondary rounded"
                        >Delete Request</a
                        >
                      </div>
                    </div>
                  </div>
                  <div class="iq-friend-request">
                    <div
                        class="iq-sub-card iq-sub-card-big d-flex align-items-center justify-content-between"
                    >
                      <div class="d-flex align-items-center">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/02.jpg"
                            alt=""
                        />
                        <div class="ms-3">
                          <h6 class="mb-0">Lucy Tania</h6>
                          <p class="mb-0">12 friends</p>
                        </div>
                      </div>
                      <div class="d-flex align-items-center">
                        <a
                            href="javascript:void();"
                            class="me-3 btn btn-primary rounded"
                        >Confirm</a
                        >
                        <a
                            href="javascript:void();"
                            class="me-3 btn btn-secondary rounded"
                        >Delete Request</a
                        >
                      </div>
                    </div>
                  </div>
                  <div class="iq-friend-request">
                    <div
                        class="iq-sub-card iq-sub-card-big d-flex align-items-center justify-content-between"
                    >
                      <div class="d-flex align-items-center">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/03.jpg"
                            alt=""
                        />
                        <div class="ms-3">
                          <h6 class="mb-0">Manny Petty</h6>
                          <p class="mb-0">3 friends</p>
                        </div>
                      </div>
                      <div class="d-flex align-items-center">
                        <a
                            href="javascript:void();"
                            class="me-3 btn btn-primary rounded"
                        >Confirm</a
                        >
                        <a
                            href="javascript:void();"
                            class="me-3 btn btn-secondary rounded"
                        >Delete Request</a
                        >
                      </div>
                    </div>
                  </div>
                  <div class="iq-friend-request">
                    <div
                        class="iq-sub-card iq-sub-card-big d-flex align-items-center justify-content-between"
                    >
                      <div class="d-flex align-items-center">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/04.jpg"
                            alt=""
                        />
                        <div class="ms-3">
                          <h6 class="mb-0">Marsha Mello</h6>
                          <p class="mb-0">15 friends</p>
                        </div>
                      </div>
                      <div class="d-flex align-items-center">
                        <a
                            href="javascript:void();"
                            class="me-3 btn btn-primary rounded"
                        >Confirm</a
                        >
                        <a
                            href="javascript:void();"
                            class="me-3 btn btn-secondary rounded"
                        >Delete Request</a
                        >
                      </div>
                    </div>
                  </div>
                  <div class="text-center">
                    <a href="#" class="btn text-primary"
                    >View More Request</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a
                href="#"
                class="search-toggle dropdown-toggle"
                id="notification-drop"
                data-bs-toggle="dropdown"
            >
              <i class="ri-notification-4-line"></i>
            </a>
            <div
                class="sub-drop dropdown-menu"
                aria-labelledby="notification-drop"
            >
              <div class="card shadow-none m-0">
                <div
                    class="card-header d-flex justify-content-between bg-primary"
                >
                  <div class="header-title bg-primary">
                    <h5 class="mb-0 text-white">All Notifications</h5>
                  </div>
                  <small class="badge bg-light text-dark">4</small>
                </div>
                <div class="card-body p-0">
                  <a href="#" class="iq-sub-card">
                    <div class="d-flex align-items-center">
                      <div class="">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/01.jpg"
                            alt=""
                        />
                      </div>
                      <div class="ms-3 w-100">
                        <h6 class="mb-0">Emma Watson Bni</h6>
                        <div
                            class="d-flex justify-content-between align-items-center"
                        >
                          <p class="mb-0">95 MB</p>
                          <small class="float-right font-size-12"
                          >Just Now</small
                          >
                        </div>
                      </div>
                    </div>
                  </a>
                  <a href="#" class="iq-sub-card">
                    <div class="d-flex align-items-center">
                      <div class="">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/02.jpg"
                            alt=""
                        />
                      </div>
                      <div class="ms-3 w-100">
                        <h6 class="mb-0">New customer is join</h6>
                        <div
                            class="d-flex justify-content-between align-items-center"
                        >
                          <p class="mb-0">Cyst Bni</p>
                          <small class="float-right font-size-12"
                          >5 days ago</small
                          >
                        </div>
                      </div>
                    </div>
                  </a>
                  <a href="#" class="iq-sub-card">
                    <div class="d-flex align-items-center">
                      <div class="">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/03.jpg"
                            alt=""
                        />
                      </div>
                      <div class="ms-3 w-100">
                        <h6 class="mb-0">Two customer is left</h6>
                        <div
                            class="d-flex justify-content-between align-items-center"
                        >
                          <p class="mb-0">Cyst Bni</p>
                          <small class="float-right font-size-12"
                          >2 days ago</small
                          >
                        </div>
                      </div>
                    </div>
                  </a>
                  <a href="#" class="iq-sub-card">
                    <div class="d-flex align-items-center">
                      <div class="">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/04.jpg"
                            alt=""
                        />
                      </div>
                      <div class="w-100 ms-3">
                        <h6 class="mb-0">New Mail from Fenny</h6>
                        <div
                            class="d-flex justify-content-between align-items-center"
                        >
                          <p class="mb-0">Cyst Bni</p>
                          <small class="float-right font-size-12"
                          >3 days ago</small
                          >
                        </div>
                      </div>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a
                href="#"
                class="dropdown-toggle"
                id="mail-drop"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
            >
              <i class="ri-mail-line"></i>
            </a>
            <div
                class="sub-drop dropdown-menu"
                aria-labelledby="mail-drop"
            >
              <div class="card shadow-none m-0">
                <div
                    class="card-header d-flex justify-content-between bg-primary"
                >
                  <div class="header-title bg-primary">
                    <h5 class="mb-0 text-white">All Message</h5>
                  </div>
                  <small class="badge bg-light text-dark">4</small>
                </div>
                <div class="card-body p-0">
                  <a href="#" class="iq-sub-card">
                    <div class="d-flex align-items-center">
                      <div class="">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/01.jpg"
                            alt=""
                        />
                      </div>
                      <div class="w-100 ms-3">
                        <h6 class="mb-0">Bni Emma Watson</h6>
                        <small class="float-left font-size-12"
                        >13 Jun</small
                        >
                      </div>
                    </div>
                  </a>
                  <a href="#" class="iq-sub-card">
                    <div class="d-flex align-items-center">
                      <div class="">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/02.jpg"
                            alt=""
                        />
                      </div>
                      <div class="ms-3">
                        <h6 class="mb-0">Lorem Ipsum Watson</h6>
                        <small class="float-left font-size-12"
                        >20 Apr</small
                        >
                      </div>
                    </div>
                  </a>
                  <a href="#" class="iq-sub-card">
                    <div class="d-flex align-items-center">
                      <div class="">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/03.jpg"
                            alt=""
                        />
                      </div>
                      <div class="ms-3">
                        <h6 class="mb-0">Why do we use it?</h6>
                        <small class="float-left font-size-12"
                        >30 Jun</small
                        >
                      </div>
                    </div>
                  </a>
                  <a href="#" class="iq-sub-card">
                    <div class="d-flex align-items-center">
                      <div class="">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/04.jpg"
                            alt=""
                        />
                      </div>
                      <div class="ms-3">
                        <h6 class="mb-0">Variations Passages</h6>
                        <small class="float-left font-size-12"
                        >12 Sep</small
                        >
                      </div>
                    </div>
                  </a>
                  <a href="#" class="iq-sub-card">
                    <div class="d-flex align-items-center">
                      <div class="">
                        <img
                            class="avatar-40 rounded"
                            src="../assets/images/user/05.jpg"
                            alt=""
                        />
                      </div>
                      <div class="ms-3">
                        <h6 class="mb-0">Lorem Ipsum generators</h6>
                        <small class="float-left font-size-12"
                        >5 Dec</small
                        >
                      </div>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a
                href="#"
                class="d-flex align-items-center dropdown-toggle"
                id="drop-down-arrow"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
            >
              <img
                  src="<c:out value="${user.getProfilePicture()}"/>"
                  class="img-fluid rounded-circle me-3"
                  alt="user"
              />
              <div class="caption">
                <h6 class="mb-0 line-height"><c:out value="${user.getFirstName()}"/> <c:out
                    value="${user.getLastName()}"/></h6>
              </div>
            </a>
            <div
                class="sub-drop dropdown-menu caption-menu"
                aria-labelledby="drop-down-arrow"
            >
              <div class="card shadow-none m-0">
                <div class="card-header bg-primary">
                  <div class="header-title">
                    <h5 class="mb-0 text-white">Hello <c:out value="${user.getFirstName()}"/> <c:out
                        value="${user.getLastName()}"/></h5>
                    <span class="text-white font-size-12">Available</span>
                  </div>
                </div>
                <div class="card-body p-0">
                  <a
                      href="app/profile.html"
                      class="iq-sub-card iq-bg-primary-hover"
                  >
                    <div class="d-flex align-items-center">
                      <div class="rounded card-icon bg-soft-primary">
                        <i class="ri-file-user-line"></i>
                      </div>
                      <div class="ms-3">
                        <h6 class="mb-0">My Profile</h6>
                        <p class="mb-0 font-size-12">
                          View personal profile details.
                        </p>
                      </div>
                    </div>
                  </a>
                  <a
                      href="app/profile-edit.html"
                      class="iq-sub-card iq-bg-warning-hover"
                  >
                    <div class="d-flex align-items-center">
                      <div class="rounded card-icon bg-soft-warning">
                        <i class="ri-profile-line"></i>
                      </div>
                      <div class="ms-3">
                        <h6 class="mb-0">Edit Profile</h6>
                        <p class="mb-0 font-size-12">
                          Modify your personal details.
                        </p>
                      </div>
                    </div>
                  </a>
                  <a
                      href="app/account-setting.html"
                      class="iq-sub-card iq-bg-info-hover"
                  >
                    <div class="d-flex align-items-center">
                      <div class="rounded card-icon bg-soft-info">
                        <i class="ri-account-box-line"></i>
                      </div>
                      <div class="ms-3">
                        <h6 class="mb-0">Account settings</h6>
                        <p class="mb-0 font-size-12">
                          Manage your account parameters.
                        </p>
                      </div>
                    </div>
                  </a>
                  <a
                      href="app/privacy-setting.html"
                      class="iq-sub-card iq-bg-danger-hover"
                  >
                    <div class="d-flex align-items-center">
                      <div class="rounded card-icon bg-soft-danger">
                        <i class="ri-lock-line"></i>
                      </div>
                      <div class="ms-3">
                        <h6 class="mb-0">Privacy Settings</h6>
                        <p class="mb-0 font-size-12">
                          Control your privacy parameters.
                        </p>
                      </div>
                    </div>
                  </a>
                  <div class="d-inline-block w-100 text-center p-3">
                    <form method="post" action="${pageContext.request.contextPath}/LoginServlet">
                      <input type="hidden" name="operation" value="LOGOUT">
                      <button
                          class="btn btn-primary iq-sign-btn"
                          type="submit"
                      >Sign out<i class="ri-login-box-line ms-2"></i
                      ></button>

                    </form>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</div>
<div class="right-sidebar-mini right-sidebar">
  <div class="right-sidebar-panel p-0">
    <div class="card shadow-none">
      <div class="card-body p-0">
        <div class="media-height p-3" data-scrollbar="init">
          <c:if test="${not empty friends}">
            <c:forEach var="friend" items="${friends}">
              <div class="d-flex align-items-center mb-4">
                <div class="iq-profile-avatar status-online">
                  <img
                      class="rounded-circle avatar-50"
                      src="<c:out value="${friend.getProfilePicture()}"/>"
                      alt=""
                  />
                </div>
                <div class="ms-3">
                  <h6 class="mb-0"><c:out value="${friend.getFirstName()}"/>
                    <c:out value="${friend.getLastName()}"/></h6>
                  <p class="mb-0">Just Now</p>
                </div>
              </div>
            </c:forEach>
          </c:if>
        </div>
        <div class="right-sidebar-toggle bg-primary text-white mt-3">
          <i class="ri-arrow-left-line side-left-icon"></i>
          <i class="ri-arrow-right-line side-right-icon"
          ><span class="ms-3 d-inline-block">Close Menu</span></i
          >
        </div>
      </div>
    </div>
  </div>
</div>
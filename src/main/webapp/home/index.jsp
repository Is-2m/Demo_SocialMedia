<%@ page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; ISO-8859-1" import="ensamc.mbdio.tp2_jee.service.PostService" %>
<%@ page import="jakarta.annotation.Resource" %>
<%@ page import="javax.sql.DataSource" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%!
  @Resource(name = "jdbc/ENSAMC-SocialNetwork")
  DataSource dataSource;

%>
<%
  PostService.fetchFriendPosts(request, dataSource);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <title>SocialV | Responsive Bootstrap 5 Admin Dashboard Template</title>

  <link rel="shortcut icon" href="../assets/images/favicon.ico"/>
  <link rel="stylesheet" href="../assets/css/libs.min.css"/>
  <link rel="stylesheet" href="../assets/css/socialv.css?v=4.0.0"/>
  <link
      rel="stylesheet"
      href="../assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
  />
  <link rel="stylesheet" href="../assets/vendor/remixicon/fonts/remixicon.css"/>
  <link
      rel="stylesheet"
      href="../assets/vendor/vanillajs-datepicker/dist/css/datepicker.min.css"
  />
  <link
      rel="stylesheet"
      href="../assets/vendor/line-awesome/dist/line-awesome/css/line-awesome.min.css"
  />
</head>
<body class=" ">
<!-- loader Start -->
<%--<div id="loading">--%>
<%--  <div id="loading-center"></div>--%>
<%--</div>--%>
<!-- loader END -->
<!-- Wrapper Start -->

<c:set var="user" scope="session" value="${currentUser}"/>

<div class="wrapper">
  <jsp:include page="header.jsp"/>
  <c:set var="posts" scope="session" value="${friendsPosts}"/>

  <div id="content-page" class="content-page">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 row m-0 p-0">
          <div class="col-sm-12">
            <div
                id="post-modal-data"
                class="card card-block card-stretch card-height"
            >
              <div class="card-header d-flex justify-content-between">
                <div class="header-title">
                  <h4 class="card-title">Create Post</h4>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex align-items-center">
                  <div class="user-img">
                    <img
                        src="<c:out value="${user.getProfilePicture()}" />"
                        alt="userimg"
                        class="avatar-60 rounded-circle"
                    />
                  </div>
                  <form
                      class="post-text ms-3 w-100"
                      data-bs-toggle="modal"
                      data-bs-target="#post-modal"
                      action="javascript:void();"
                  >
                    <input
                        type="text"
                        class="form-control rounded"
                        placeholder="Write something here..."
                        style="border: none"
                    />
                  </form>
                </div>
                <hr/>
                <ul class="post-opt-block d-flex list-inline m-0 p-0 flex-wrap">
                  <li class="me-3 mb-md-0 mb-2">
                    <a href="#" class="btn btn-soft-primary">
                      <img
                          src="../assets/images/small/07.png"
                          alt="icon"
                          class="img-fluid me-2"
                      />
                      Photo/Video
                    </a>
                  </li>
                  <li class="me-3 mb-md-0 mb-2">
                    <a href="#" class="btn btn-soft-primary">
                      <img
                          src="../assets/images/small/08.png"
                          alt="icon"
                          class="img-fluid me-2"
                      />
                      Tag Friend
                    </a>
                  </li>
                  <li>
                    <button class="btn btn-soft-primary">
                      <div
                          class="card-header-toolbar d-flex align-items-center"
                      >
                        <div class="dropdown">
                          <div
                              class="dropdown-toggle"
                              id="post-option"
                              data-bs-toggle="dropdown">
                            <i class="ri-more-fill"></i>
                          </div>
                          <div
                              class="dropdown-menu dropdown-menu-right"
                              aria-labelledby="post-option"
                              style="">
                            <a
                                class="dropdown-item"
                                href="#"
                                data-bs-toggle="modal"
                                data-bs-target="#post-modal"
                            >Check in</a>

                          </div>
                        </div>
                      </div>
                    </button>
                  </li>
                </ul>
              </div>
              <div
                  class="modal fade"
                  id="post-modal"
                  tabindex="-1"
                  aria-labelledby="post-modalLabel"
                  aria-hidden="true"
              >
                <div class="modal-dialog modal-fullscreen-sm-down">

                  <form
                      class="post-text ms-3 w-100"
                      method="post"
                      action="${pageContext.request.contextPath}/PostServlet"
                  >
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="post-modalLabel">
                          Create Post
                        </h5>
                        <button
                            type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal"
                        >
                          <i class="ri-close-fill"></i>
                        </button>
                      </div>
                      <div class="modal-body">
                        <div class="d-flex align-items-center">
                          <div class="user-img">
                            <img
                                src="<c:out value="${user.getProfilePicture()}"/>"
                                alt="userimg"
                                class="avatar-60 rounded-circle img-fluid"
                            />
                          </div>

                          <input type="hidden" name="operation" value="CREATE_POST">
                          <input
                              name="content"
                              type="text"
                              class="form-control rounded"
                              placeholder="Write something here..."
                              style="border: none"
                          />
                        </div>
                        <hr/>
                        <ul class="d-flex flex-wrap align-items-center list-inline m-0 p-0">
                          <li class="col-md-6 mb-3">
                            <div
                                class="bg-soft-primary rounded p-2 pointer me-3">
                              <a href="#"></a
                              ><img
                                src="../assets/images/small/07.png"
                                alt="icon"
                                class="img-fluid"
                            />
                              Photo/Video
                            </div>
                          </li>
                          <li class="col-md-6 mb-3">
                            <div
                                class="bg-soft-primary rounded p-2 pointer me-3">
                              <a href="#"></a
                              ><img
                                src="../assets/images/small/08.png"
                                alt="icon"
                                class="img-fluid"
                            />
                              Tag Friend
                            </div>
                          </li>

                          <li class="col-md-6 mb-3">
                            <div
                                class="bg-soft-primary rounded p-2 pointer me-3">
                              <a href="#"></a
                              ><img
                                src="../assets/images/small/10.png"
                                alt="icon"
                                class="img-fluid"
                            />
                              Check in
                            </div>
                          </li>

                        </ul>
                        <hr/>

                        <button
                            type="submit"
                            class="btn btn-primary d-block w-100 mt-3">
                          Post
                        </button>
                      </div>
                    </div>
                  </form>

                </div>
              </div>
            </div>
          </div>

          <!-- Post Items -->
          <c:if test="${not empty posts}">
            <c:forEach var="post" items="${posts}">
              <div class="col-sm-12">
                <div class="card card-block card-stretch card-height">
                  <div class="card-body">
                    <div class="user-post-data">
                      <div class="d-flex justify-content-between">
                        <div class="me-3">
                          <img class="rounded-circle img-fluid" src="<c:out value="${post.user.getProfilePicture()}"/>"
                               alt=""/>
                        </div>
                        <div class="w-100">
                          <div class="d-flex justify-content-between">
                            <div class="">
                              <h5 class="mb-0 d-inline-block"><c:out value="${post.getUser().getFirstName()}"/> <c:out
                                  value="${post.getUser().getLastName()}"/></h5>
                              <span class="mb-0 d-inline-block">Added New Post</span>
                              <p class="mb-0 text-primary"><c:out value="${post.getTimeAgo()}"/></p>
                            </div>
                            <div class="card-post-toolbar">
                              <div class="dropdown">
                  <span
                      class="dropdown-toggle"
                      data-bs-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                      role="button"
                  >
                    <i class="ri-more-fill"></i>
                  </span>
                                <div class="dropdown-menu m-0 p-0">
                                  <!-- Menu Options -->
                                  <a class="dropdown-item p-3" href="#">
                                    <div class="d-flex align-items-top">
                                      <div class="h4">
                                        <i class="ri-save-line"></i>
                                      </div>
                                      <div class="data ms-2">
                                        <h6>Save Post</h6>
                                        <p class="mb-0">Add this to your saved items</p>
                                      </div>
                                    </div>
                                  </a>
                                  <a class="dropdown-item p-3" href="#">
                                    <div class="d-flex align-items-top">
                                      <i class="ri-close-circle-line h4"></i>
                                      <div class="data ms-2">
                                        <h6>Hide Post</h6>
                                        <p class="mb-0">See fewer posts like this.</p>
                                      </div>
                                    </div>
                                  </a>
                                  <a class="dropdown-item p-3" href="#">
                                    <div class="d-flex align-items-top">
                                      <i class="ri-user-unfollow-line h4"></i>
                                      <div class="data ms-2">
                                        <h6>Unfollow User</h6>
                                        <p class="mb-0">
                                          Stop seeing posts but stay friends.
                                        </p>
                                      </div>
                                    </div>
                                  </a>
                                  <a class="dropdown-item p-3" href="#">
                                    <div class="d-flex align-items-top">
                                      <i class="ri-notification-line h4"></i>
                                      <div class="data ms-2">
                                        <h6>Notifications</h6>
                                        <p class="mb-0">
                                          Turn on notifications for this post
                                        </p>
                                      </div>
                                    </div>
                                  </a>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="mt-3">
                      <p><c:out value="${post.getResources().get(0).asMessage().getContent()}"/></p>
                    </div>
                    <div class="user-post">
                      <div class="d-grid grid-rows-2 grid-flow-col gap-3">
                        <!-- Post Images -->
                        <div class="row-span-2 row-span-md-1">
                            <%--                          <img--%>
                            <%--                              src="assets/images/page-img/p2.jpg"--%>
                            <%--                              alt="post-image"--%>
                            <%--                              class="img-fluid rounded w-100"--%>
                            <%--                          />--%>
                        </div>
                      </div>
                    </div>
                    <div class="comment-area mt-3">
                      <div
                          class="d-flex justify-content-between align-items-center flex-wrap"
                      >
                        <div class="like-block position-relative d-flex align-items-center">
                          <div class="d-flex align-items-center">
                            <div class="like-data">
                              <div class="dropdown">
                  <span
                      class="dropdown-toggle"
                      data-bs-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                      role="button"
                  >
                    <img
                        src="../assets/images/icon/01.png"
                        class="img-fluid"
                        alt=""
                    />
                  </span>
                                <div class="dropdown-menu py-2">
                                  <!-- Reacts Icons -->
                                  <a
                                      class="ms-2 me-2"
                                      href="#"
                                      data-bs-toggle="tooltip"
                                      data-bs-placement="top"
                                      title=""
                                      data-bs-original-title="Like"
                                      aria-label="Like"
                                  ><img
                                      src="../assets/images/icon/01.png"
                                      class="img-fluid"
                                      alt=""
                                  /></a>
                                  <a
                                      class="me-2"
                                      href="#"
                                      data-bs-toggle="tooltip"
                                      data-bs-placement="top"
                                      title=""
                                      data-bs-original-title="Love"
                                      aria-label="Love"
                                  ><img
                                      src="../assets/images/icon/02.png"
                                      class="img-fluid"
                                      alt=""
                                  /></a>
                                  <a
                                      class="me-2"
                                      href="#"
                                      data-bs-toggle="tooltip"
                                      data-bs-placement="top"
                                      title=""
                                      data-bs-original-title="Happy"
                                      aria-label="Happy"
                                  ><img
                                      src="../assets/images/icon/03.png"
                                      class="img-fluid"
                                      alt=""
                                  /></a>
                                  <a
                                      class="me-2"
                                      href="#"
                                      data-bs-toggle="tooltip"
                                      data-bs-placement="top"
                                      title=""
                                      data-bs-original-title="HaHa"
                                      aria-label="HaHa"
                                  ><img
                                      src="../assets/images/icon/04.png"
                                      class="img-fluid"
                                      alt=""
                                  /></a>
                                  <a
                                      class="me-2"
                                      href="#"
                                      data-bs-toggle="tooltip"
                                      data-bs-placement="top"
                                      title=""
                                      data-bs-original-title="Think"
                                      aria-label="Think"
                                  ><img
                                      src="../assets/images/icon/05.png"
                                      class="img-fluid"
                                      alt=""
                                  /></a>
                                  <a
                                      class="me-2"
                                      href="#"
                                      data-bs-toggle="tooltip"
                                      data-bs-placement="top"
                                      title=""
                                      data-bs-original-title="Sade"
                                      aria-label="Sade"
                                  ><img
                                      src="../assets/images/icon/06.png"
                                      class="img-fluid"
                                      alt=""
                                  /></a>
                                  <a
                                      class="me-2"
                                      href="#"
                                      data-bs-toggle="tooltip"
                                      data-bs-placement="top"
                                      title=""
                                      data-bs-original-title="Lovely"
                                      aria-label="Lovely"
                                  ><img
                                      src="../assets/images/icon/07.png"
                                      class="img-fluid"
                                      alt=""
                                  /></a>
                                </div>
                              </div>
                            </div>
                            <div class="total-like-block ms-2 me-3">
                              <div class="dropdown">
                  <span
                      class="dropdown-toggle"
                      data-bs-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                      role="button"
                  >
                    <%= (new Random()).nextInt(33, 760) %> Likes
                  </span>
                                <div class="dropdown-menu">
                                  <!-- Likes DropDown Item -->
                                  <a class="dropdown-item" href="{link+ID}">{Liker Name}</a>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="total-comment-block">
                            <div class="dropdown">
                <span
                    class="dropdown-toggle"
                    data-bs-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                    role="button"
                >
                  <%= (new Random()).nextInt(33, 760) %>
                </span>
                              <div class="dropdown-menu">
                                <!-- Commenters DropDown Item -->
                                <a class="dropdown-item" href="{ID}">{Name}</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div
                            class="share-block d-flex align-items-center feather-icon mt-2 mt-md-0"
                        >
                          <a
                              href="javascript:void();"
                              data-bs-toggle="offcanvas"
                              data-bs-target="#share-btn"
                              aria-controls="share-btn"><i class="ri-share-line"></i>
                            <span class="ms-1"><%= (new Random()).nextInt(33, 760) %> </span></a>
                        </div>
                      </div>
                      <hr/>

                      <form
                          class="comment-text d-flex align-items-center mt-3"
                          action="javascript:void(0);"
                      >
                        <input
                            type="text"
                            class="form-control rounded"
                            placeholder="Enter Your Comment"
                        />
                        <div class="comment-attagement d-flex">
                          <a href="javascript:void();"><i class="ri-link me-3"></i></a>
                          <a href="javascript:void();"><i class="ri-user-smile-line me-3"></i></a>
                          <a href="javascript:void();"><i class="ri-camera-line me-3"></i></a>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:if>

        </div>

        <div class="col-sm-12 text-center">
          <img
              src="../assets/images/page-img/page-load-loader.gif"
              alt="loader"
              style="height: 100px"
          />
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Wrapper End-->
<footer class="iq-footer bg-white">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-6">
        <ul class="list-inline mb-0">
          <li class="list-inline-item">
            <a href="dashboard/privacy-policy.html">Privacy Policy</a>
          </li>
          <li class="list-inline-item">
            <a href="dashboard/terms-of-service.html">Terms of Use</a>
          </li>
        </ul>
      </div>
      <div class="col-lg-6 d-flex justify-content-end">
        Copyright 2020 <a href="#">SocialV</a> All Rights Reserved.
      </div>
    </div>
  </div>
</footer>
<!-- Backend Bundle JavaScript -->
<script src="../assets/js/libs.min.js"></script>
<!-- slider JavaScript -->
<script src="../assets/js/slider.js"></script>
<!-- masonry JavaScript -->
<script src="../assets/js/masonry.pkgd.min.js"></script>
<!-- SweetAlert JavaScript -->
<script src="../assets/js/enchanter.js"></script>
<!-- SweetAlert JavaScript -->
<script src="../assets/js/sweetalert.js"></script>
<!-- app JavaScript -->
<script src="../assets/js/charts/weather-chart.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>
<script src="../assets/js/lottie.js"></script>

</body>
</html>
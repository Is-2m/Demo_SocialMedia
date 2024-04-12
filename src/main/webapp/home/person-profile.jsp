<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <title>ENSAMC | Social Network</title>

  <link rel="shortcut icon" href="../assets/images/favicon.ico"/>
  <link rel="stylesheet" href="../assets/css/libs.min.css"/>
  <link rel="stylesheet" href="../assets/css/socialv.css?v=4.0.0"/>
  <link
      rel="stylesheet"
      href="../assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
  />
  <link
      rel="stylesheet"
      href="../assets/vendor/remixicon/fonts/remixicon.css"
  />
  <link
      rel="stylesheet"
      href="../assets/vendor/vanillajs-datepicker/dist/css/datepicker.min.css"
  />
  <link
      rel="stylesheet"
      href="../assets/vendor/font-awesome-line-awesome/css/all.min.css"
  />
  <link
      rel="stylesheet"
      href="../assets/vendor/line-awesome/dist/line-awesome/css/line-awesome.min.css"
  />
</head>
<body class="  ">


<c:set var="personPosts" value="${requestScope.personPosts}"/>
<c:set var="person" value="${requestScope.person}"/>
<!-- Wrapper Start -->
<div class="wrapper">
  <jsp:include page="header.jsp"/>
  <div id="content-page" class="content-page">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="card">
            <div class="card-body profile-page p-0">
              <div class="profile-header">
                <div class="position-relative">
                  <img
                      src="../assets/images/page-img/profile-bg1.jpg"
                      alt="profile-bg"
                      class="rounded img-fluid"
                  />
                  <ul
                      class="header-nav list-inline d-flex flex-wrap justify-end p-0 m-0"
                  >
                    <li>
                      <a href="#"><i class="ri-pencil-line"></i></a>
                    </li>
                    <li>
                      <a href="edit-profile.jsp" style="position: relative;z-index: 999"><i
                          class="ri-settings-4-line"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="user-detail text-center mb-3">
                  <div class="profile-img">
                    <img
                        src="<c:out value="${person.getProfilePicture()}" />"
                        alt="profile-img"
                        class="avatar-130 img-fluid"
                    />
                  </div>
                  <div class="profile-detail">
                    <h3 class=""><c:out value="${person.getFirstName()}"/>
                      <c:out value="${person.getLastName()}"/></h3>
                  </div>
                </div>
                <div
                    class="profile-info p-3 d-flex align-items-center justify-content-between position-relative"
                >
                  <div class="social-info">
                    <ul
                        class="social-data-block d-flex align-items-center justify-content-between list-inline p-0 m-0"
                    >
                      <li class="text-center ps-3">
                        <h6>Posts</h6>
                        <p class="mb-0"><c:out value="${personPosts.size()}"/></p>
                      </li>
                      <%--                      <li class="text-center ps-3">--%>
                      <%--                        <h6>Friends</h6>--%>
                      <%--                        <p class="mb-0"><c:out value="${person.getFriends().size()}"/></p>--%>
                      <%--                      </li>--%>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-body p-0">
              <div class="user-tabing">
                <ul
                    class="nav nav-pills d-flex align-items-center justify-content-center profile-feed-items p-0 m-0"
                >
                  <li class="nav-item col-12 col-sm-3 p-0">
                    <a
                        class="nav-link active"
                        href="#pills-timeline-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#timeline"
                        role="button"
                    >Timeline</a
                    >
                  </li>
                  <li class="nav-item col-12 col-sm-3 p-0">
                    <a
                        class="nav-link"
                        href="#pills-about-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#about"
                        role="button"
                    >About</a
                    >
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-12">
          <div class="tab-content">
            <div
                class="tab-pane fade show active"
                id="timeline"
                role="tabpanel"
            >
              <div class="card-body p-0">
                <div class="row">

                  <div class="col-lg-12">
                    <div class="container w-75">
                      <c:if test="${not empty personPosts}">
                        <c:forEach var="post" items="${personPosts}">
                          <!-- Post Items -->
                          <div class="card">
                            <div class="card card-block card-stretch card-height">
                              <div class="card-body">
                                <div class="user-post-data">
                                  <div class="d-flex justify-content-between">
                                    <div class="me-3" style="width: 15vh;">
                                      <img class="rounded-circle img-fluid avatar-60"
                                           src="<c:out value="${post.getUser().getProfilePicture()}"/>"
                                           alt=""/>
                                    </div>
                                    <div class="w-100">
                                      <div class="d-flex justify-content-between">
                                        <div class="">
                                          <h5 class="mb-0 d-inline-block"><c:out
                                              value="${post.getUser().getFirstName()}"/> <c:out
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
                  </div> <!-- End col-lg-8 -->
                </div>
              </div>
            </div>
            <div class="tab-pane fade" id="about" role="tabpanel">
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-3">
                      <ul
                          class="nav nav-pills basic-info-items list-inline d-block p-0 m-0"
                      >
                        <li>
                          <a
                              class="nav-link active"
                              href="#v-pills-basicinfo-tab"
                              data-bs-toggle="pill"
                              data-bs-target="#v-pills-basicinfo-tab"
                              role="button"
                          >Contact and Basic Info</a
                          >
                        </li>
                        <li>
                          <a
                              class="nav-link"
                              href="#v-pills-details-tab"
                              data-bs-toggle="pill"
                              data-bs-target="#v-pills-details-tab"
                              role="button"
                          >Details About You</a
                          >
                        </li>
                      </ul>
                    </div>
                    <div class="col-md-9 ps-4">
                      <div class="tab-content">
                        <div
                            class="tab-pane fade active show"
                            id="v-pills-basicinfo-tab"
                            role="tabpanel"
                            aria-labelledby="v-pills-basicinfo-tab"
                        >
                          <h4>Contact Information</h4>
                          <hr/>
                          <div class="row">
                            <div class="col-3">
                              <h6>Email</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0"><c:out value="${person.getEmail()}"/></p>
                            </div>
                            <div class="col-3">
                              <h6>Mobile</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0"><c:out value="${person.getPhone()}"/></p>
                            </div>
                            <div class="col-3">
                              <h6>Address</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0"><c:out value="${person.getAddress()}"/></p>
                            </div>
                          </div>

                          <h4 class="mt-3">Basic Information</h4>
                          <hr/>
                          <div class="row">
                            <div class="col-3">
                              <h6>Birth Date</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0"><c:out value="${person.getBirthDate()}"/></p>
                            </div>
                            <%--                            <div class="col-3">--%>
                            <%--                              <h6>Birth Year</h6>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col-9">--%>
                            <%--                              <p class="mb-0">1994</p>--%>
                            <%--                            </div>--%>
                            <div class="col-3">
                              <h6>Gender</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0"><c:out value="${person.getGender()}"/></p>
                            </div>
                            <%--                            <div class="col-3">--%>
                            <%--                              <h6>interested in</h6>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col-9">--%>
                            <%--                              <p class="mb-0">Designing</p>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col-3">--%>
                            <%--                              <h6>language</h6>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="col-9">--%>
                            <%--                              <p class="mb-0">English, French</p>--%>
                            <%--                            </div>--%>
                          </div>
                        </div>

                        <div
                            class="tab-pane fade"
                            id="v-pills-details-tab"
                            role="tabpanel"
                            aria-labelledby="v-pills-details-tab"
                        >
                          <h4 class="mb-3">About You</h4>
                          <p>
                            <c:out value="${person.getAboutMe()}"/>
                          </p>
                          <h4 class="mt-3 mb-3">Other Name</h4>
                          <p><c:out value="${person.getOtherName()}"/></p>
                          <h4 class="mt-3 mb-3">Favorite Quotes</h4>
                          <p>
                            <c:out value="${person.getFavoriteQuote()}"/>
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
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
            <a href="../dashboard/privacy-policy.html">Privacy Policy</a>
          </li>
          <li class="list-inline-item">
            <a href="../dashboard/terms-of-service.html">Terms of Use</a>
          </li>
        </ul>
      </div>
      <div class="col-lg-6 d-flex justify-content-end">
        Copyright 2020 <a href="#">ENSAMC Social Network</a> All Rights Reserved.
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

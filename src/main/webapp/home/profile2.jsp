<%@ page import="jakarta.annotation.Resource" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="static ensamc.mbdio.tp2_jee.service.PostService.getUserPosts" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%!
  @Resource(name = "jdbc/ENSAMC-SocialNetwork")
  DataSource dataSource;

%>
<%
  getUserPosts(request, dataSource);
%>
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
<body class="">
<c:set var="posts" scope="session" value="${userPosts}"/>
<c:set var="user" scope="session" value="${currentUser}"/>
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
                      <a href="#"><i class="ri-settings-4-line"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="user-detail text-center mb-3">
                  <div class="profile-img">
                    <img
                        src="<c:out value="${user.getProfilePicture()}" />"
                        alt="profile-img"
                        class="avatar-130 img-fluid"
                    />
                  </div>
                  <div class="profile-detail">
                    <h3 class=""><c:out value="${user.getFirstName()}"/>
                      <c:out value="${user.getLastName()}"/></h3>
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
                        <p class="mb-0"><c:out value="${posts.size()}"/></p>
                      </li>
                      <li class="text-center ps-3">
                        <h6>Friends</h6>
                        <p class="mb-0"><c:out value="${user.getFriends().size()}"/></p>
                      </li>
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
                  <li class="nav-item col-12 col-sm-3 p-0">
                    <a
                        class="nav-link"
                        href="#pills-friends-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#friends"
                        role="button"
                    >Friends</a
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
                  <div class="col-lg-4">
                    <div class="card">
                      <div
                          class="card-header d-flex justify-content-between"
                      >
                        <div class="header-title">
                          <h4 class="card-title">Friends</h4>
                        </div>
                        <%--                        <div--%>
                        <%--                            class="card-header-toolbar d-flex align-items-center"--%>
                        <%--                        >--%>
                        <%--                          <p class="m-0">--%>
                        <%--                            <a href="javacsript:void();">Add New </a>--%>
                        <%--                          </p>--%>
                        <%--                        </div>--%>
                      </div>
                      <div class="card-body">
                        <ul
                            class="profile-img-gallary p-0 m-0 list-unstyled"
                        >
                          <c:if test="${not empty user.getFriends()}">
                            <c:forEach var="friend" items="${user.getFriends()}">
                              <!-- Friend Item -->
                              <li class="">
                                <a href="#">
                                  <img
                                      src="../assets/images/user/05.jpg"
                                      alt="gallary-image"
                                      class="img-fluid"
                                  /></a>
                                <h6 class="mt-2 text-center">Anna Rexia</h6>
                              </li>
                              <!-- End Friend Item -->
                            </c:forEach>
                          </c:if>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-8">
                    <div
                        id="post-modal-data"
                        class="card card-block card-stretch card-height">
                      <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                          <h4 class="card-title">Create Post</h4>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="d-flex align-items-center">
                          <div class="user-img">
                            <img
                                src="<c:out value="${user.getProfilePicture()}"/>"
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
                    <div class="card">
                      <div class="card-body"></div>
                    </div>
                  </div>
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
                              <p class="mb-0">Bnijohn@gmail.com</p>
                            </div>
                            <div class="col-3">
                              <h6>Mobile</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0">(001) 4544 565 456</p>
                            </div>
                            <div class="col-3">
                              <h6>Address</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0">United States of America</p>
                            </div>
                          </div>

                          <h4 class="mt-3">Basic Information</h4>
                          <hr/>
                          <div class="row">
                            <div class="col-3">
                              <h6>Birth Date</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0">24 January</p>
                            </div>
                            <div class="col-3">
                              <h6>Birth Year</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0">1994</p>
                            </div>
                            <div class="col-3">
                              <h6>Gender</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0">Female</p>
                            </div>
                            <div class="col-3">
                              <h6>interested in</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0">Designing</p>
                            </div>
                            <div class="col-3">
                              <h6>language</h6>
                            </div>
                            <div class="col-9">
                              <p class="mb-0">English, French</p>
                            </div>
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
                            Hi, I’m Bni, I’m 26 and I work as a Web Designer
                            for the iqonicdesign.
                          </p>
                          <h4 class="mt-3 mb-3">Other Name</h4>
                          <p>Bini Rock</p>
                          <h4 class="mt-3 mb-3">Favorite Quotes</h4>
                          <p>
                            Lorem Ipsum is simply dummy text of the printing
                            and typesetting industry. Lorem Ipsum has been
                            the industry's standard dummy text ever since
                            the 1500s
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane fade" id="friends" role="tabpanel">
              <div class="card">
                <div class="card-body">
                  <h2>Friends</h2>
                  <div class="friend-list-tab mt-2">
                    <ul
                        class="nav nav-pills d-flex align-items-center justify-content-left friend-list-items p-0 mb-2"
                    >
                      <li>
                        <a
                            class="nav-link active"
                            data-bs-toggle="pill"
                            href="#pill-all-friends"
                            data-bs-target="#all-feinds"
                        >All Friends</a
                        >
                      </li>
                      <li>
                        <a
                            class="nav-link"
                            data-bs-toggle="pill"
                            href="#pill-recently-add"
                            data-bs-target="#recently-add"
                        >Recently Added</a
                        >
                      </li>
                      <li>
                        <a
                            class="nav-link"
                            data-bs-toggle="pill"
                            href="#pill-closefriends"
                            data-bs-target="#closefriends"
                        >
                          Close friends</a
                        >
                      </li>
                      <li>
                        <a
                            class="nav-link"
                            data-bs-toggle="pill"
                            href="#pill-home"
                            data-bs-target="#home-town"
                        >
                          Home/Town</a
                        >
                      </li>
                      <li>
                        <a
                            class="nav-link"
                            data-bs-toggle="pill"
                            href="#pill-following"
                            data-bs-target="#following"
                        >Following</a
                        >
                      </li>
                    </ul>
                    <div class="tab-content">
                      <div
                          class="tab-pane fade active show"
                          id="all-friends"
                          role="tabpanel"
                      >
                        <div class="card-body p-0">
                          <div class="row">
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/05.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Petey Cruiser</h5>
                                      <p class="mb-0">15 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton01"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-time-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton01"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/06.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Anna Sthesia</h5>
                                      <p class="mb-0">50 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton02"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton02"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/07.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Paul Molive</h5>
                                      <p class="mb-0">10 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton03"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton03"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/08.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Gail Forcewind</h5>
                                      <p class="mb-0">20 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton04"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton04"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/09.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Paige Turner</h5>
                                      <p class="mb-0">12 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton05"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton05"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/10.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>b Frapples</h5>
                                      <p class="mb-0">6 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton06"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton06"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/13.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Walter Melon</h5>
                                      <p class="mb-0">30 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton07"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton07"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/14.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Barb Ackue</h5>
                                      <p class="mb-0">14 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton08"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton08"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/15.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Buck Kinnear</h5>
                                      <p class="mb-0">16 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton09"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton09"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/16.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Ira Membrit</h5>
                                      <p class="mb-0">22 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton10"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton10"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/17.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Shonda Leer</h5>
                                      <p class="mb-0">10 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton11"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton11"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/18.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>ock Lee</h5>
                                      <p class="mb-0">18 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton12"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton12"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/19.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Maya Didas</h5>
                                      <p class="mb-0">40 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton13"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton13"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/05.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Rick O'Shea</h5>
                                      <p class="mb-0">50 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton14"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton14"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/06.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Pete Sariya</h5>
                                      <p class="mb-0">5 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton15"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton15"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/07.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Monty Carlo</h5>
                                      <p class="mb-0">2 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton16"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton16"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/08.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Sal Monella</h5>
                                      <p class="mb-0">0 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton17"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton17"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/09.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Sue Vaneer</h5>
                                      <p class="mb-0">25 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton18"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton18"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/10.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Cliff Hanger</h5>
                                      <p class="mb-0">18 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton19"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton19"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/05.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Barb Dwyer</h5>
                                      <p class="mb-0">23 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton20"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton20"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/06.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Terry Aki</h5>
                                      <p class="mb-0">8 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton21"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton21"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/13.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Cory Ander</h5>
                                      <p class="mb-0">7 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton22"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton22"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/14.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Robin Banks</h5>
                                      <p class="mb-0">14 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton23"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton23"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/15.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Jimmy Changa</h5>
                                      <p class="mb-0">10 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton24"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton24"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/16.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Barry Wine</h5>
                                      <p class="mb-0">18 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton25"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton25"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/17.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Poppa Cherry</h5>
                                      <p class="mb-0">16 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton26"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton26"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/18.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Zack Lee</h5>
                                      <p class="mb-0">33 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton27"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton27"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/19.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Don Stairs</h5>
                                      <p class="mb-0">15 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton28"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton28"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/05.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Peter Pants</h5>
                                      <p class="mb-0">12 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton29"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton29"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/06.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Hal Appeno</h5>
                                      <p class="mb-0">13 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton30"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton30"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                          class="tab-pane fade"
                          id="recently-add"
                          role="tabpanel"
                      >
                        <div class="card-body p-0">
                          <div class="row">
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/07.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Otto Matic</h5>
                                      <p class="mb-0">4 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton31"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton31"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/08.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Moe Fugga</h5>
                                      <p class="mb-0">16 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton32"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton32"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/09.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Tom Foolery</h5>
                                      <p class="mb-0">14 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton33"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton33"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/10.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Bud Wiser</h5>
                                      <p class="mb-0">16 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton34"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton34"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/15.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Polly Tech</h5>
                                      <p class="mb-0">10 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton35"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton35"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/16.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Holly Graham</h5>
                                      <p class="mb-0">8 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton36"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton36"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/17.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Tara Zona</h5>
                                      <p class="mb-0">5 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton37"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton37"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/18.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Barry Cade</h5>
                                      <p class="mb-0">20 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton38"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton38"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                          class="tab-pane fade"
                          id="closefriends"
                          role="tabpanel"
                      >
                        <div class="card-body p-0">
                          <div class="row">
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/19.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Bud Wiser</h5>
                                      <p class="mb-0">32 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton39"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton39"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/05.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Otto Matic</h5>
                                      <p class="mb-0">9 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton40"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton40"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/06.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Peter Pants</h5>
                                      <p class="mb-0">2 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton41"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton41"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/07.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Zack Lee</h5>
                                      <p class="mb-0">15 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton42"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton42"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/08.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Barry Wine</h5>
                                      <p class="mb-0">36 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton43"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton43"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/09.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Robin Banks</h5>
                                      <p class="mb-0">22 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton44"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton44"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/10.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Cory Ander</h5>
                                      <p class="mb-0">18 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton45"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton45"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/15.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Moe Fugga</h5>
                                      <p class="mb-0">12 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton46"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton46"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/16.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Polly Tech</h5>
                                      <p class="mb-0">30 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton47"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton47"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/17.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Hal Appeno</h5>
                                      <p class="mb-0">25 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton48"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton48"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                          class="tab-pane fade"
                          id="home-town"
                          role="tabpanel"
                      >
                        <div class="card-body p-0">
                          <div class="row">
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/18.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Paul Molive</h5>
                                      <p class="mb-0">14 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton49"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton49"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/19.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Paige Turner</h5>
                                      <p class="mb-0">8 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton50"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton50"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/05.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Barb Ackue</h5>
                                      <p class="mb-0">23 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton51"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton51"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/06.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Ira Membrit</h5>
                                      <p class="mb-0">16 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton52"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton52"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/07.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Maya Didas</h5>
                                      <p class="mb-0">12 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton53"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton53"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                          class="tab-pane fade"
                          id="following"
                          role="tabpanel"
                      >
                        <div class="card-body p-0">
                          <div class="row">
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/05.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Maya Didas</h5>
                                      <p class="mb-0">20 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton54"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton54"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/06.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Monty Carlo</h5>
                                      <p class="mb-0">3 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton55"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton55"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/07.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Cliff Hanger</h5>
                                      <p class="mb-0">20 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton56"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton56"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/08.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>b Ackue</h5>
                                      <p class="mb-0">12 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton57"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton57"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/09.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Bob Frapples</h5>
                                      <p class="mb-0">12 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton58"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton58"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/10.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Anna Mull</h5>
                                      <p class="mb-0">6 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton59"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton59"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/15.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>ry Wine</h5>
                                      <p class="mb-0">15 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton60"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton60"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/16.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Don Stairs</h5>
                                      <p class="mb-0">12 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton61"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton61"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/17.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Peter Pants</h5>
                                      <p class="mb-0">8 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton62"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton62"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/18.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Polly Tech</h5>
                                      <p class="mb-0">18 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton63"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton63"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/19.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Tara Zona</h5>
                                      <p class="mb-0">30 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton64"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton64"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/05.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Arty Ficial</h5>
                                      <p class="mb-0">15 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton65"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton65"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/06.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Bill Emia</h5>
                                      <p class="mb-0">25 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton66"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton66"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/07.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Bill Yerds</h5>
                                      <p class="mb-0">9 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton67"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton67"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div
                                    class="d-flex align-items-center justify-content-between"
                                >
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img
                                          src="../assets/images/user/08.jpg"
                                          alt="profile-img"
                                          class="img-fluid"
                                      />
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5>Matt Innae</h5>
                                      <p class="mb-0">19 friends</p>
                                    </div>
                                  </div>
                                  <div
                                      class="card-header-toolbar d-flex align-items-center"
                                  >
                                    <div class="dropdown">
  <span
      class="dropdown-toggle btn btn-secondary me-2"
      id="dropdownMenuButton68"
      data-bs-toggle="dropdown"
      aria-expanded="true"
      role="button"
  >
  <i
      class="ri-check-line me-1 text-white"
  ></i>
  Friend
  </span>
                                      <div
                                          class="dropdown-menu dropdown-menu-right"
                                          aria-labelledby="dropdownMenuButton68"
                                      >
                                        <a class="dropdown-item" href="#"
                                        >Get Notification</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Close Friend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfollow</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Unfriend</a
                                        >
                                        <a class="dropdown-item" href="#"
                                        >Block</a
                                        >
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
<script src="../vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>
<script src="../assets/js/lottie.js"></script>


</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>SocialV | Responsive Bootstrap 5 Admin Dashboard Template</title>

  <link rel="shortcut icon" href="../assets/images/favicon.ico"/>
  <link rel="stylesheet" href="../assets/css/libs.min.css">
  <link rel="stylesheet" href="../assets/css/socialv.css?v=4.0.0">
  <link rel="stylesheet" href="../assets/vendor/@fortawesome/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="../assets/vendor/remixicon/fonts/remixicon.css">
  <link rel="stylesheet" href="../assets/vendor/vanillajs-datepicker/dist/css/datepicker.min.css">
  <link rel="stylesheet" href="../assets/vendor/font-awesome-line-awesome/css/all.min.css">
  <link rel="stylesheet" href="../assets/vendor/line-awesome/dist/line-awesome/css/line-awesome.min.css">

</head>
<body class="  ">
<!-- loader Start -->
<div id="loading">
  <div id="loading-center">
  </div>
</div>
<!-- loader END -->
<!-- Wrapper Start -->
<div class="wrapper">
  <jsp:include page="header.jsp"/>

  <c:set var="results" scope="session" value="${searchResults}"/>
  <div id="content-page" class="content-page">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h2>Search Result</h2>
              <div class="friend-list-tab mt-2">
                <div class="tab-content">
                  <div class="tab-pane fade active show" id="all-friends" role="tabpanel">
                    <div class="card-body p-0">
                      <div class="row">
                        <c:if test="${not empty results}">
                          <c:forEach var="person" items="${results}">
                            <!--Person Item -->
                            <div class="col-md-6 col-lg-6 mb-3">
                              <div class="iq-friendlist-block">
                                <div class="d-flex align-items-center justify-content-between">
                                  <div class="d-flex align-items-center">
                                    <a href="#">
                                      <img src="<c:out value="${person.getProfilePicture()}"/>" alt="profile-img"
                                           class="img-fluid">
                                    </a>
                                    <div class="friend-info ms-3">
                                      <h5><c:out value="${person.getFirstName()}"/>
                                        <c:out value="${person.getLastName()}"/></h5>
                                    </div>
                                  </div>
                                  <c:choose>
                                    <c:when test="${person.getFriendship().getState().name().equals('APPROVED')}">
                                      <div class="card-header-toolbar d-flex align-items-center">
                                        <div class="dropdown">
                                   <span
                                       class="dropdown-toggle btn btn-success me-2"
                                       id="dropdownMenuUser<c:out value="${person.getId()}"/>"
                                       data-bs-toggle="dropdown"
                                       aria-expanded="true"
                                       role="button">
                                   <i class="ri-check-line me-1 text-white"></i> Friend
                                   </span>
                                          <div class="dropdown-menu dropdown-menu-right"
                                               aria-labelledby="dropdownMenuButton02">
                                            <form method="post" action="${pageContext.request.contextPath}/FriendshipServlet">
                                              <input type="hidden" name="user_id"
                                                     value="<c:out value="${person.getId()}"/>"/>
                                              <input type="hidden" name="operation" value="UNFRIEND">
                                              <button type="submit" class="dropdown-item">Unfriend</button>
                                            </form>
                                          </div>
                                        </div>
                                      </div>
                                    </c:when>
                                    <c:when test="${person.getFriendship().getState().name() == 'PENDING' }">
                                      <div class="card-header-toolbar d-flex align-items-center">
                                        <div class="dropdown">
                                           <span
                                               class="dropdown-toggle btn btn-secondary me-2"
                                               id="dropdownMenuUser<c:out value="${person.getId()}"/>"
                                               data-bs-toggle="dropdown"
                                               aria-expanded="true"
                                               role="button">
                                           <i class="ri-time-line me-1 text-white"></i> Pending
                                           </span>
                                          <div class="dropdown-menu dropdown-menu-right"
                                               aria-labelledby="dropdownMenuButton02">
                                            <form method="post" action="${pageContext.request.contextPath}/FriendshipServlet">
                                              <input type="hidden" name="user_id"
                                                     value="<c:out value="${person.getId()}"/>"/>
                                              <input type="hidden" name="operation" value="CANCEL">
                                              <button type="submit" class="dropdown-item">Cancel</button>
                                            </form>
                                          </div>
                                        </div>
                                      </div>
                                    </c:when>
                                    <c:otherwise>
                                      <div class="card-header-toolbar d-flex align-items-center">
                                        <div class="dropdown">
                                          <form method="post" action="${pageContext.request.contextPath}/FriendshipServlet">
                                            <input type="hidden" name="operation" value="SEND_REQUEST">
                                            <input type="hidden" name="user_id"
                                                   value="<c:out value="${person.getId()}"/>"/>
                                            <button class="btn btn-primary me-2"
                                                    aria-expanded="true" role="button">
                                              <i class="ri-send-plane-fill me-1 text-white"></i> Add Friend
                                            </button>
                                          </form>
                                        </div>
                                      </div>
                                    </c:otherwise>
                                  </c:choose>
                                </div>
                              </div>
                            </div>
                            <!-- End Person Item -->
                          </c:forEach>
                        </c:if>
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
<!-- Wrapper End-->
<footer class="iq-footer bg-white">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-6">
        <ul class="list-inline mb-0">
          <li class="list-inline-item"><a href="../dashboard/privacy-policy.html">Privacy Policy</a></li>
          <li class="list-inline-item"><a href="../dashboard/terms-of-service.html">Terms of Use</a></li>
        </ul>
      </div>
      <div class="col-lg-6 d-flex justify-content-end">
        Copyright 2020 <a href="#">SocialV</a> All Rights Reserved.
      </div>
    </div>
  </div>
</footer>    <!-- Backend Bundle JavaScript -->
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

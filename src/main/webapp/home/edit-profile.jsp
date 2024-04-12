<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <title>ENSAMC | Social Network</title>

  <link rel="shortcut icon" href="../assets/images/favicon.ico" />
  <link rel="stylesheet" href="../assets/css/libs.min.css" />
  <link rel="stylesheet" href="../assets/css/socialv.css?v=4.0.0" />
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
<!-- loader Start -->
<div id="loading">
  <div id="loading-center"></div>
</div>
<!-- loader END -->
<!-- Wrapper Start -->
<div class="wrapper">
  <jsp:include page="header.jsp"/>
  <c:set var="user" value="${currentUser}" scope="session"/>
  <div id="content-page" class="content-page">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body p-0">
              <div class="iq-edit-list">
                <ul class="iq-edit-profile row nav nav-pills">
                  <li class="col-md-3 p-0">
                    <a
                        class="nav-link active"
                        data-bs-toggle="pill"
                        href="#personal-information"
                    >
                      Personal Information
                    </a>
                  </li>
                  <li class="col-md-3 p-0">
                    <a
                        class="nav-link"
                        data-bs-toggle="pill"
                        href="#chang-pwd"
                    >
                      Change Password
                    </a>
                  </li>
                  <li class="col-md-3 p-0">
                    <a
                        class="nav-link"
                        data-bs-toggle="pill"
                        href="#aboutme"
                    >
                      About Me
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="iq-edit-list-data">
            <div class="tab-content">
              <div
                  class="tab-pane fade active show"
                  id="personal-information"
                  role="tabpanel"
              >
                <div class="card">
                  <div class="card-header d-flex justify-content-between">
                    <div class="header-title">
                      <h4 class="card-title">Personal Information</h4>
                    </div>
                  </div>
                  <div class="card-body">
                    <form method="post" action="${pageContext.request.contextPath}/ProfileServlet">
                      <input type="hidden" name="operation" value="PROFILE">
                      <div class="form-group row align-items-center">
                        <div class="col-md-12">
                          <div class="profile-img-edit">
                            <img
                                class="profile-pic"
                                src="<c:out value="${user.getProfilePicture()}"/>"
                                alt="profile-pic"
                            />
                            <div class="p-image">
                              <i
                                  class="ri-pencil-line upload-button text-white"
                              ></i>
                              <input
                                  class="file-upload"
                                  type="file"
                                  accept="image/*"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row align-items-center">
                        <div class="form-group col-sm-6">
                          <label for="fname" class="form-label"
                          >First Name:</label
                          >
                          <input
                              name="firstName"
                              type="text"
                              class="form-control"
                              id="fname"
                              placeholder="<c:out value="${user.getFirstName()}"/>"
                          />
                        </div>
                        <div class="form-group col-sm-6">
                          <label for="lname" class="form-label"
                          >Last Name:</label
                          >
                          <input
                              name="lastName"
                              type="text"
                              class="form-control"
                              id="lname"
                              placeholder="<c:out value="${user.getLastName()}"/>"
                          />
                        </div>
                        <div class="form-group col-sm-6">
                          <label for="uname" class="form-label"
                          >Phone Number:</label
                          >
                          <input
                              name="phone"
                              type="text"
                              class="form-control"
                              id="uname"
                              placeholder="<c:out value="${user.getPhone()}"/>"
                          />
                        </div>
                        <div class="form-group col-sm-6">
                          <label for="cname" class="form-label"
                          >Email:</label
                          >
                          <input
                              name="email"
                              type="text"
                              class="form-control"
                              disabled="disabled"
                              id="cname"
                              placeholder="<c:out value="${user.getEmail()}"/>"
                          />
                        </div>
                        <div class="form-group col-sm-6">
                          <label class="form-label d-block">Gender:</label>
                          <div class="form-check form-check-inline">
                            <input
                                class="form-check-input"
                                type="radio"
                                name="gender"
                                id="inlineRadio10"
                                <c:out value="${user.getGender().equals('Male')?'checked':''}" />
                                value="Male"
                            />
                            <label
                                class="form-check-label"
                                for="inlineRadio10"
                            >
                              Male</label
                            >
                          </div>
                          <div class="form-check form-check-inline">
                            <input
                                class="form-check-input"
                                type="radio"
                                name="gender"
                                id="inlineRadio11"
                                <c:out value="${user.getGender().equals('Female')?'checked':''}" />
                                value="Female"
                            />
                            <label
                                class="form-check-label"
                                for="inlineRadio11"
                            >Female</label
                            >
                          </div>
                        </div>
                        <div class="form-group col-sm-6">
                          <label for="dob" class="form-label"
                          >Date Of Birth:</label
                          >
                          <input
                              name="birthDate"
                              class="form-control"
                              id="dob"
                              placeholder="<c:out value="${user.getBirthDate()}"/>"
                          />
                        </div>
                        <div class="form-group col-sm-12">
                          <label class="form-label">Address:</label>
                          <textarea
                              class="form-control"
                              name="address"
                              rows="5"
                              style="line-height: 22px"
                          >
                            <c:out value="${user.getAddress()}"/>
                          </textarea>
                        </div>
                      </div>
                      <button type="submit" class="btn btn-primary me-2">
                        Submit
                      </button>
                      <button type="reset" class="btn bg-soft-danger">
                        Cancle
                      </button>
                    </form>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="chang-pwd" role="tabpanel">
                <div class="card">
                  <div class="card-header d-flex justify-content-between">
                    <div class="iq-header-title">
                      <h4 class="card-title">Change Password</h4>
                    </div>
                  </div>
                  <div class="card-body">
                    <form method="post" action="${pageContext.request.contextPath}/ProfileServlet" onsubmit="onSubmit()">
                      <input type="hidden" name="operation" value="PASSWORD">

                      <div class="form-group">
                        <label for="inputOldPassword" class="form-label"
                        >Current Password:</label
                        >
                        <a href="#" class="float-end">Forgot Password</a>
                        <input
                            class="form-control"
                            required
                            id="inputOldPassword"
                            type="password"
                            name="oldPassword"
                            value=""
                        />
                      </div>
                      <div class="form-group">
                        <label for="inputNewPassword" class="form-label"
                        >New Password:</label
                        >
                        <input
                            class="form-control"
                            required
                            id="inputNewPassword"
                            type="password"
                            name="newPassword"
                            value=""
                            onkeyup="checkPasswordStrength(this.value)"
                        />
                        <span id="passwordStrength" class="text-muted"></span>
                      </div>
                      <div class="form-group">
                        <label for="inputConfirmNewPassword" class="form-label"
                        >Verify Password:</label
                        >
                        <input
                            class="form-control"
                            required
                            id="inputConfirmNewPassword"
                            type="password"
                            name="confirmNewPassword"
                            value=""
                            onkeyup="checkPasswordMatch()"
                        />
                        <span id="confirmPasswordMatch" class="text-muted"></span>
                      </div>
                      <button type="submit" class="btn btn-primary me-2">
                        Submit
                      </button>
                      <button type="reset" class="btn bg-soft-danger">
                        Cancle
                      </button>
                    </form>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="aboutme" role="tabpanel">
                <div class="card">
                  <div class="card-header d-flex justify-content-between">
                    <div class="header-title">
                      <h4 class="card-title">Details About You</h4>
                    </div>
                  </div>
                  <div class="card-body">
                    <form method="post" action="${pageContext.request.contextPath}/ProfileServlet">
                      <input type="hidden" name="operation" value="ABOUT_ME">
                      <div class="form-group">
                        <label for="cno" class="form-label"
                        >Other Name:</label
                        >
                        <input
                            name="otherName"
                            type="text"
                            class="form-control"
                            id="cno"
                            value="<c:out value="${user.getOtherName()}"/>"
                        />
                      </div>
                      <div class="form-group">
                        <label for="about_me" class="form-label">About Me:</label>
                        <textarea
                            id="about_me"
                            class="form-control"
                            name="aboutMe"
                            rows="5"
                            style="line-height: 22px"
                        >
<c:out value="${user.getAboutMe()}"/>
                        </textarea>
                      </div>
                      <div class="form-group">
                        <label for="favQuote" class="form-label">Favorite Quote:</label>
                        <textarea
                            name="favoriteQuote"
                            class="form-control"
                            style="line-height: 22px"
                            rows="5"
                            id="favQuote">
<c:out value="${user.getFavoriteQuote()}"/>
                        </textarea>
                      </div>
                      <button type="submit" class="btn btn-primary me-2">
                        Submit
                      </button>
                      <button type="reset" class="btn bg-soft-danger">
                        Cancle
                      </button>
                    </form>
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
<script>
    function checkPasswordStrength(password) {
        checkPasswordMatch();
        const strength = {
            weak: 0,
            medium: 1,
            strong: 2,
        };
        let score = 0;

        // Minimum length
        if (password.length >= 8) {
            score += 1;
        }

        // Lowercase letters
        if (/[a-z]/.test(password)) {
            score += 1;
        }

        // Uppercase letters
        if (/[A-Z]/.test(password)) {
            score += 1;
        }

        // Numbers
        if (/[0-9]/.test(password)) {
            score += 1;
        }

        // Symbols
        if (/[^a-zA-Z0-9]/.test(password)) {
            score += 1;
        }

        let strengthText;
        let borderColor;
        switch (score) {
            case strength.weak:
                strengthText = "Weak";
                borderColor = "red";
                break;
            case strength.medium:
                strengthText = "Medium";
                borderColor = "orange";
                break;
            case strength.strong:
                strengthText = "Strong";
                borderColor = "green";
                break;
        }

        document.getElementById("passwordStrength").textContent = strengthText;
        document.getElementById("inputNewPassword").style.borderColor =
            borderColor;

        // Enable button only if password is strong
        // const saveButton = document.querySelector("button[type='button']");
        // saveButton.disabled = score < strength.medium;
    }

    function checkPasswordMatch() {
        const newPassword = document.getElementById("inputNewPassword").value;
        const confirmPassword = document.getElementById(
            "inputConfirmNewPassword"
        ).value;
        const confirmSpan = document.getElementById("confirmPasswordMatch");

        let matchText;
        let borderColor;
        if (newPassword === confirmPassword) {
            matchText = "Passwords Match";
            borderColor = "green";
            // Enable button only if password matches
            // const saveButton = document.querySelector("button[type='button']");
            // saveButton.disabled = false;
        } else {
            matchText = "Passwords Don't Match";
            borderColor = "red";
            // Disable button if password doesn't match
            // const saveButton = document.querySelector("button[type='button']");
            // saveButton.disabled = true;
        }

        confirmSpan.textContent = matchText;
        document.getElementById("inputConfirmNewPassword").style.borderColor =
            borderColor;

    }

    // function for onsubmit that will be called when the form is submitted
    function onSubmit() {
        // get the form element
        const form = document.querySelector("form");
        // get the input elements
        const oldPassword = document.getElementById("inputOldPassword");
        const newPassword = document.getElementById("inputNewPassword");
        const confirmNewPassword = document.getElementById("inputConfirmNewPassword");

        // check if the new password and confirm new password are the same
        if (newPassword.value !== confirmNewPassword.value) {
            // if they are not the same, show an alert
            alert("Passwords do not match");
            // prevent the form from submitting
            return false;
        }

        // if the new password and confirm new password are the same, submit the form
        return true;
    }


</script>
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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>ENSAMC | Social Network</title>

  <link rel="shortcut icon" href="assets/images/favicon.ico"/>
  <link rel="stylesheet" href="assets/css/libs.min.css">
  <link rel="stylesheet" href="assets/css/socialv.css?v=4.0.0">
  <link rel="stylesheet" href="assets/vendor/@fortawesome/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="assets/vendor/remixicon/fonts/remixicon.css">
  <link rel="stylesheet" href="assets/vendor/vanillajs-datepicker/dist/css/datepicker.min.css">
  <link rel="stylesheet" href="assets/vendor/font-awesome-line-awesome/css/all.min.css">
  <link rel="stylesheet" href="assets/vendor/line-awesome/dist/line-awesome/css/line-awesome.min.css">

</head>
<body class=" ">
<!-- loader Start -->
<div id="loading">
  <div id="loading-center">
  </div>
</div>
<!-- loader END -->

<div class="wrapper">
  <section class="sign-in-page">
    <div id="container-inside">
      <div id="circle-small"></div>
      <div id="circle-medium"></div>
      <div id="circle-large"></div>
      <div id="circle-xlarge"></div>
      <div id="circle-xxlarge"></div>
    </div>
    <div class="container p-0">
      <div class="row no-gutters">
        <div class="col-md-6 text-center pt-5">
          <div class="sign-in-detail text-white">
            <a class="sign-in-logo mb-5" href="#"><img src="assets/images/logo-full.png" class="img-fluid"
                                                       alt="logo"></a>
            <div class="sign-slider overflow-hidden ">
              <ul class="swiper-wrapper list-inline m-0 p-0 ">
                <li class="swiper-slide">
                  <img src="assets/images/login/1.png" class="img-fluid mb-4" alt="logo">
                  <h4 class="mb-1 text-white">Find new friends</h4>
                  <p>It is a long established fact that a reader will be distracted by the readable content.</p>
                </li>
                <li class="swiper-slide">
                  <img src="assets/images/login/2.png" class="img-fluid mb-4" alt="logo">
                  <h4 class="mb-1 text-white">Connect with the world</h4>
                  <p>It is a long established fact that a reader will be distracted by the readable content.</p>
                </li>
                <li class="swiper-slide">
                  <img src="assets/images/login/3.png" class="img-fluid mb-4" alt="logo">
                  <h4 class="mb-1 text-white">Create new events</h4>
                  <p>It is a long established fact that a reader will be distracted by the readable content.</p>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-md-6 bg-white pt-5 pt-5 pb-lg-0 pb-5">
          <div class="sign-in-from">
            <h1 class="mb-0">Reset Password</h1>
            <p>Enter your email address and we'll send you an email with instructions to reset your password.</p>
            <form method="post" action="${pageContext.request.contextPath}/reset_password" onsubmit="onSubmit()"
                  class="mt-4">
              <input type="hidden" name="operation" value="CHANGE_PWD">
              <input type="hidden" name="token" value="<c:out value="${requestScope.token}"/>">
              <div class="form-group">
                <label for="inputNewPassword" class="form-label"
                >New Password:</label
                >
                <input
                    class="form-control mb-0"
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
                    class="form-control mb-0"
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
    </div>
  </section>
</div>
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
<script src="assets/js/libs.min.js"></script>
<!-- slider JavaScript -->
<script src="assets/js/slider.js"></script>
<!-- masonry JavaScript -->
<script src="assets/js/masonry.pkgd.min.js"></script>
<!-- SweetAlert JavaScript -->
<script src="assets/js/enchanter.js"></script>
<!-- SweetAlert JavaScript -->
<script src="assets/js/sweetalert.js"></script>
<!-- app JavaScript -->
<script src="assets/js/charts/weather-chart.js"></script>
<script src="assets/js/app.js"></script>
<script src="assets/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>
<script src="assets/js/lottie.js"></script>

</body>
</html>
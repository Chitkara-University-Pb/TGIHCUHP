<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="all_css_js.jsp" %>
</head>
<body>
    <section style="height: 100vh;" class="d-flex align-items-center justify-content-center" >
        <div class="card mb-3 shadow-lg border-1" style="max-width: 800px;">
            <div class="row g-0">
              <div class="col-md-7">
                <img src="img/login2.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-5">
                <div class="card-body">
                    <div class="d-flex justify-content-between" style="margin-bottom: -21px;">
                        <h1 class="fs-4 card-title fw-bold mb-4">Login</h1>
                        <button type="button" class="btn-close" disabled aria-label="Close"></button>
                    </div>
                    
                    <form action="AuthenticationServlet" method="get" class="needs-validation" novalidate="" autocomplete="off">
                        <div class="mb-3">
                            <label class="mb-2 text-muted" for="logInUsername">Username</label>
                            <input id="logInUsername" type="text" class="form-control user" name="logInUsername" value="" required autofocus>
                            <div class="invalid-feedback">
                                User is invalid
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="mb-2 w-100">
                                <label class="text-muted" for="password">Password</label>
                                <a href="#" class="float-end">
                                    Forgot Password?
                                </a>
                            </div>
                            <input id="logInPassword" type="password" class="form-control" name="logInPassword" required>
                            <div class="invalid-feedback">
                                Password is required
                            </div>
                        </div>

                        <div class="d-flex align-items-center">
                            <div class="form-check">
                                <input type="checkbox" name="remember" id="remember" class="form-check-input">
                                <label for="remember" class="form-check-label">Remember Me</label>
                            </div>
                            <button type="submit" class="btn btn-primary ms-auto">
                                Login
                            </button>
                        </div>
                        <div class="d-flex align-items-center" style="margin-top: 0px; margin-bottom: 0px;">
                            <a href="signup.jsp">SignUp</a>
                        </div>
                    </form>
                  
                </div>
              </div>
            </div>
          </div>
    </section>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Document</title>
    <%@include file="all_css_js.jsp"%>
</head>
<body>
    <section style="height: 100vh;" class="d-flex align-items-center justify-content-center" >
        <div class="card mb-3 shadow-lg border-1" style="max-width: 1000px;">
            
                <div class="card-body" style="width: 500px;">
                    <div class="d-flex justify-content-between">
                        <h1 class="fs-4 card-title fw-bold mb-4">SignUp</h1>
                        <button type="button" class="btn-close" disabled aria-label="Close"></button>
                    </div>
                    
                    <form action="SaveSignUpServlet" method="post" class="needs-validation" novalidate="" autocomplete="off">
                        <div class="mb-3">
                            <label class="mb-2 text-muted" for="username">Username</label>
                            <input id="username" type="text" class="form-control user" name="signUpUsername" value="" placeholder="Username" required autofocus>
                            <div class="invalid-feedback">
                                User is invalid
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="mb-2 text-muted" for="phone">Phone Number</label>
                            <input id="phone" type="text" name="signUpPhoneNumber" data-validation="number" data-validation-allowing="negative,number" input name="color" data-validation="number" datavalidation-ignore="$" required="required" class="form-control" placeholder="Phone Number">
                            <div class="invalid-feedback">
                                invalid number
                            </div>
                        </div>
						
						<div class="mb-3">
                            <label for="exampleInputEmail1">Email address</label>
                            <input name="signUpEmail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        
                        <div class="mb-3">
                            <div class="mb-2 w-100">
                                <label class="text-muted" for="password">Password</label>
                            </div>
                            <input id="password" type="password" class="form-control" name="password" required>
                            <div class="invalid-feedback">
                                Password is required
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="mb-2 w-100">
                                <label class="text-muted" for="password1">Reenter password</label>
                            </div>
                            <input id="password1" type="password" class="form-control" name="password" required>
                            <div class="invalid-feedback">
                                Password is required
                            </div>
                        </div>

                        <div class="d-flex align-items-center">
                            <div class="form-check">
                                <a href="login.jsp">LogIn</a>
                            </div>
                            <button type="submit" class="btn btn-primary ms-auto">
                                SignUp
                            </button>
                        </div>
                    </form>
                  
                </div>
              </div>
            
          
    </section>
</body>
</html>
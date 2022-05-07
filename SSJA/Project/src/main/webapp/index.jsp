<html lang="en">
<head>
<%@include file="all_css_js.jsp"%>
<title>Hello, world!</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">QuickFix</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="signup.jsp">Signup</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About Us</a>
        </li>
      </ul>
    </div>
  </div>
</nav>


    <!-- here content starts here -->
    <div class="container-fluid hero-content">
      <div class="row align-items-center">
        <div class="col-md-6 col-sm-12 text-center" data-aos="fade-up">
          <h1>WELL COME</h1>
          <p class="lead muted">Easy way to create a new account</p>
          
          <br>
          <br>
          <a class="get-started" href="signup.jsp">Get Started</a>
        </div>
        <div class="col-md-6 col-sm-12 text-center" data-aos="fade-left">
          <div class="hero-img-div">
            <img class="hero-img" src="img/hero-img.svg" alt="img-showing-money-transfer">
          </div>
        </div>
      </div>
    </div>
    <!-- here content ends here -->




    <!-- footer starts here -->
    <footer>
      <hr>
      <div class="row text-center">
        <div class="col-md-6">
            <button style="font-size:24px"> <i class="fa fa-envelope"><p></p></i></button>
            <p>quickfix01@gmail.com</p>
        </div>
        
        <div class="col-md-6 text-center">
            <ul class="social-icons">
              Contact Me:
              <li><a target="_blank" class="github" href="https://github.com/shanti2001"><i class="fab fa-github fa-2x"></i></a></li>
              
              <li><a target="_blank" class="linkedin" href="https://www.linkedin.com/in/shantinath-samanta-80836a1b6/"><i class="fab fa-linkedin fa-2x"></i></a></li>   
            </ul>
        </div>
      </div>
    </footer>
    <!-- footer ends here -->

    <!-- spalsh screen js -->
    <script>
      var preloader = document.getElementById("loading");
      function loader(){
        preloader.style.display = 'none';
      }
    </script>

    
    <script>
      AOS.init({
        duration: 700,
      });
      
      let myAccountBalance = parseInt(document.getElementById("myAccountBalance").innerText);

      function sendMoney(){
         var enterName = document.getElementById("enterName").value;
         var enterAmount = parseInt(document.getElementById("enterAmount").value);

         if (enterAmount > 8000) {
            alert("Insufficient Balance.")
         } else {
            var findUserBankAccount = enterName + "BankBalance";
            var finalAmount = parseInt(document.getElementById(findUserBankAccount).innerHTML) + enterAmount;
            var myAccountBalance = parseInt(document.getElementById("myAccountBalance").innerText) - enterAmount
            document.getElementById("myAccountBalance").innerText = myAccountBalance
            document.getElementById(findUserBankAccount).innerHTML = finalAmount;
            alert(`Successful Transaction !!  
            $${enterAmount} is sent to ${enterName}@email.com.`)

            // transaction history 
            var createPTag = document.createElement("li");
            var textNode = document.createTextNode(`$${enterAmount} is sent to recepient with Email-id ${enterName}@email.com on ${Date()}.`);
            createPTag.appendChild(textNode);
            var element = document.getElementById("transaction-history-body");
            element.insertBefore(createPTag, element.firstChild);
         }
      }
    </script>

</body>
</html>

<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.*"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style2.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="all_css_js.jsp"%>

</head>
<body>

	<div class="d-flex wrapper1">
		<nav id="sidebar" class="">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
				</button>
			</div>
			<div class="img bg-wrap text-center py-4"
				style="background-image: url(img/bg_1.jpg);">
				<div class="user-logo">
					<div class="img" style="background-image: url(img/susanta.png);"></div>
					<%
					Session s = FactoryProvider.getFactory().openSession();
					String str = session.getAttribute("username").toString();
					Query q = s.createQuery("from AccountInfo");
					List<AccountInfo> list = q.list();
					String username = "";
					for (AccountInfo acinfo : list) {
						if (acinfo.getSignUpInfo().getUserName().equals(str)) {
							username = acinfo.getName();
						}
					}
					%>
					<h4><%=username%></h4>
				</div>
			</div>
			<ul class="list-unstyled components mb-5">
				<li><a href="userDashboard.jsp" style="text-decoration: none;"><span
						class="fa fa-home mr-3"></span> Account Details</a></li>
				<li><a href="transferManu.jsp" style="text-decoration: none;"><span
						class="fa fa-gift mr-3"></span> Tranfer Money</a></li>
				<li><a href="transactionHistry.jsp"
					style="text-decoration: none;"><span class="fa fa-history mr-3"></span>
						Transaction History</a></li>
				<li><a href="loanSection.jsp" style="text-decoration: none;"><span
						class="fa fa-cog mr-3"></span> Loan Section</a></li>
				<li class="active"><a href="#" style="text-decoration: none;"><span
						class="fa fa-support mr-3"></span> Other Supports</a></li>
				<li><a href="LogOutServlet" style="text-decoration: none;"><span
						class="fa fa-sign-out mr-3"></span> Sign Out</a></li>
			</ul>

		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">

			<div class="d-flex flex-wrap p-4">
				<div class="card m-3" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Funds Transfer </h5>
                        <p class="card-text"></p>
                        <a href="#" style="margin-left:80px;">View Demo</a><br><br>
                        <a href="#" class="btn btn-primary" style="margin-left:100px;"> Go </a>
                    </div>
                </div>

                <div class="card m-3" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">BillPay & Recharge </h5>
                        <p class="card-text"></p>
                        <a href="#" style="margin-left:80px;">View Demo</a><br><br>
                        <a href="#" class="btn btn-primary" style="margin-left:100px;"> Go </a>
                    </div>
                </div>

                <div class="card m-3" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Cards</h5>
                        <p class="card-text"></p>
                        <a href="#" style="margin-left:80px;">View Demo</a><br><br>
                        <a href="#" class="btn btn-primary" style="margin-left:100px;"> Go </a>
                    </div>
                </div>
                <div class="card m-3" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Demat</h5>
                        <p class="card-text"></p>
                        <a href="#" style="margin-left:80px;">View Demo</a><br><br>
                        <a href="#" class="btn btn-primary" style="margin-left:100px;"> Go </a>
                    </div>
                </div>
                <div class="card m-3" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Mutual Fund</h5>
                        <p class="card-text"></p>
                        <a href="#" style="margin-left:80px;">View Demo</a><br><br>
                        <a href="#" class="btn btn-primary" style="margin-left:100px;"> Go </a>
                    </div>
                </div>
                <div class="card m-3" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Insurance</h5>
                        <p class="card-text"></p>
                        <a href="#" style="margin-left:80px;">View Demo</a><br><br>
                        <a href="#" class="btn btn-primary" style="margin-left:100px;"> Go </a>
                    </div>
                </div>

			</div>

		</div>
	</div>

	<script type="text/javascript">
		(function($) {

			"use strict";

			var fullHeight = function() {

				$('.js-fullheight').css('height', $(window).height());
				$(window).resize(function() {
					$('.js-fullheight').css('height', $(window).height());
				});

			};
			fullHeight();

			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});

		})(jQuery);

		$(function() {
			$("#wizard").steps({
				headerTag : "h2",
				bodyTag : "section",
				transitionEffect : "fade",
				enableAllSteps : true,
				transitionEffectSpeed : 500,
				labels : {
					finish : "Submit",
					next : "Next",
					previous : "Back"
				}
			});
			$('.wizard > .steps li a').click(function() {
				$(this).parent().addClass('checked');
				$(this).parent().prevAll().addClass('checked');
				$(this).parent().nextAll().removeClass('checked');
			});
			// Custome Jquery Step Button
			$('.forward').click(function() {
				$("#wizard").steps('next');
			})
			$('.backward').click(function() {
				$("#wizard").steps('previous');
			})
			// Select Dropdown
			$('html').click(function() {
				$('.select .dropdown').hide();
			});
			$('.select').click(function(event) {
				event.stopPropagation();
			});
			$('.select .select-control').click(function() {
				$(this).parent().next().toggle();
			})
			$('.select .dropdown li').click(function() {
				$(this).parent().toggle();
				var text = $(this).attr('value');
				$(this).parent().prev().find('div').text(text);
			})
		})
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-steps/1.1.0/jquery.steps.js"
		integrity="sha512-gH0SqyjTN7WJAtki1UvqOkhWi3WsF9LY05BMwdcSq6QdFDXrXeXy0q8iP0YmBXCqo7OnSgdIPrC5Vqn8/KRu/Q=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
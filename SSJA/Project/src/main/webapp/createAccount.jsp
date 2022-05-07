
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
					<div class="img" style="background-image: url(img/logo.jpg);"></div>
					<h4>Catriona Henderson</h4>
				</div>
			</div>
			<ul class="list-unstyled components mb-5">
				<li class="active"><a href="#" style="text-decoration: none;"><span
						class="fa fa-home mr-3"></span> Account Details</a></li>
				<li><a href="#" style="text-decoration: none;"><span
						class="fa fa-gift mr-3"></span> Tranfer Money</a></li>
				<li><a href="#" style="text-decoration: none;"><span
						class="fa fa-history mr-3"></span> Transaction History</a></li>
				<li><a href="#" style="text-decoration: none;"><span
						class="fa fa-cog mr-3"></span> Settings</a></li>
				<li><a href="#" style="text-decoration: none;"><span
						class="fa fa-support mr-3"></span> Support</a></li>
				<li><a href="#" style="text-decoration: none;"><span
						class="fa fa-sign-out mr-3"></span> Sign Out</a></li>
			</ul>

		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">

			<div class="wrapper">
				<form action="SaveAccountServlet" method="post" id="wizard">
					<!-- SECTION 1 -->
					<h2></h2>
					<section>
						<div class="inner">
							<div class="form-content">
								<div class="form-header1">
									<h3>Registration</h3>
								</div>
								<p>Personal Information</p>
								<div class="form-row1">
									<div class="form-holder1">
										<input name="acFirstName" type="text" placeholder="First Name"
											class="form-control1">
									</div>
									<div class="form-holder1">
										<input name="acLastName" type="text" placeholder="Last Name"
											class="form-control1">
									</div>
								</div>
								<div class="form-row1">
									<div class="form-holder1">
										<input name="acDOB" type="text"
											placeholder="Date Of Birth(dd-mm-yyyy)" class="form-control1">
									</div>
									<div class="form-holder1">
										<input name="acPhoneNo" type="number"
											placeholder="Phone Number" class="form-control1">
									</div>
								</div>
								<div class="form-row1">
									<div class="form-holder1">
										<input name="acAge" type="number" placeholder="Age"
											class="form-control1">
									</div>
									<div class="form-holder1"
										style="align-self: flex-end; transform: translateY(4px);">
										<div class="checkbox-tick">
											<label class="male"> <input type="radio"
												name="gender" value="male" checked> Male<br> <span
												class="checkmark"></span>
											</label> <label class="female"> <input type="radio"
												name="gender" value="female"> Female<br> <span
												class="checkmark"></span>
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>

					<!-- SECTION 2 -->
					<h2></h2>
					<section>
						<div class="inner">
							<div class="form-content">
								<div class="form-header1">
									<h3>Registration</h3>
								</div>
								<p>Account Information</p>

								<div class="form-row1">
									<div class="select">
										<div class="form-holder1">
											<select name="acType" class="select-control"
												style="border: none;">
												<option value="Savin Account">Savin Account</option>
												<option value="Chacking Account">Chacking Account</option>
												<option value="Othet Account">Othet Account</option>
											</select>
										</div>

									</div>
									<div class="form-holder1">
										<div class="form-holder1">
											<input name="acIFSC" type="text" placeholder="IFSC Code"
												class="form-control1">
										</div>
									</div>
								</div>
								<div class="form-row1">
									<div class="form-holder1">
										<input name="acAccountNo" type="number"
											placeholder="Account Number" class="form-control1">
									</div>
									<div class="form-holder1">
										<input name="acZIP" type="number" placeholder="Zip Code"
											class="form-control1">
									</div>
								</div>
								<div class="form-row1">
									<div class="form-holder1 w-100">
										<input name="scBranch" type="text" placeholder="Branch"
											class="form-control1">
									</div>
								</div>

							</div>
						</div>
					</section>

					<!-- SECTION 3 -->
					<h2></h2>
					<section>
						<div class="inner">
							<div class="form-content">
								<div class="form-header1">
									<h3>Registration</h3>
								</div>
								<p>Create Transaction PIN</p>
								<div class="form-row1">
									<div class="form-holder1">
										<input name="acPin" type="number" placeholder="Enter PIN"
											class="form-control1">
									</div>
									<div class="form-holder1">
										<input type="number" placeholder="Reenter PIN"
											class="form-control1">
									</div>
								</div>
								<div class="checkbox-circle mt-24">
									<label> <input type="checkbox" checked> &emsp;
										Please accept <a href="#">terms and conditions ?</a> <span
										class="checkmark"></span>
									</label>
								</div>
							</div>
						</div>
						<button type="submit"
							style="position: absolute; left: 526px; top: 410px; width: 130px; height: 40px; background-color: rgba(68, 116, 68, 0.967); z-index: 1000; border: none;">submit</button>
					</section>
				</form>
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
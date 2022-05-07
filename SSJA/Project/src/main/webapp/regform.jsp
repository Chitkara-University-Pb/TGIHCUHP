
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style2.css">
</head>

<div class="wrapper">
	<form action="" id="wizard">
		<!-- SECTION 1 -->
		<h2></h2>
		<section>
			<div class="inner">
				<!-- <div class="image-holder">
            <img src="images/form-wizard-1.jpg" alt="">
          </div> -->
				<div class="form-content">
					<div class="form-header">
						<h3>Registration</h3>
					</div>
					<p>Personal Information</p>
					`
					<div class="form-row">
						<div class="form-holder">
							<input type="text" placeholder="First Name" class="form-control">
						</div>
						<div class="form-holder">
							<input type="text" placeholder="Last Name" class="form-control">
						</div>
					</div>
					<div class="form-row">
						<div class="form-holder">
							<input type="text" placeholder="Date Of Birth(dd-mm-yyyy)"
								class="form-control">
						</div>
						<div class="form-holder">
							<input type="text" placeholder="Phone Number"
								class="form-control">
						</div>
					</div>
					<div class="form-row">
						<div class="form-holder">
							<input type="text" placeholder="Age" class="form-control">
						</div>
						<div class="form-holder"
							style="align-self: flex-end; transform: translateY(4px);">
							<div class="checkbox-tick">
								<label class="male"> <input type="radio" name="gender"
									value="male" checked> Male<br> <span
									class="checkmark"></span>
								</label> <label class="female"> <input type="radio"
									name="gender" value="female"> Female<br> <span
									class="checkmark"></span>
								</label>
							</div>
						</div>
					</div>
					<!-- <div class="checkbox-circle">
              <label>
                 <input type="checkbox" checked> Nor again is there anyone who loves or pursues or desires to obtaini. 
                <span class="checkmark"></span>
              </label>
            </div> -->
				</div>
			</div>
		</section>

		<!-- SECTION 2 -->
		<h2></h2>
		<section>
			<div class="inner">
				<!-- <div class="image-holder">
            <img src="images/form-wizard-2.jpg" alt="">
          </div> -->
				<div class="form-content">
					<div class="form-header">
						<h3>Registration</h3>
					</div>
					<p>Account Information</p>

					<div class="form-row">
						<div class="select">
							<div class="form-holder">
								<div class="select-control">Account Type</div>
								<i class="zmdi zmdi-caret-down"></i>
							</div>
							<ul class="dropdown">
								<li rel="Savin Account">Savin Account</li>
								<li rel="Chacking Account">Chacking Account</li>
								<li rel="Othet Account">Othet Account</li>
							</ul>
						</div>
						<div class="form-holder">
							<div class="form-holder">
								<input type="text" placeholder="IFSC Code" class="form-control">
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="form-holder">
							<input type="text" placeholder="Account Number"
								class="form-control">
						</div>
						<div class="form-holder">
							<input type="text" placeholder="Zip Code" class="form-control">
						</div>
					</div>
					<div class="form-row">
						<div class="form-holder w-100">
							<input type="text" placeholder="Branch" class="form-control">
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
					<div class="form-header">
						<h3>Registration</h3>
					</div>
					<p>Create Transaction PIN</p>
					<div class="form-row">
						<div class="form-holder">
							<input type="number" placeholder="Enter PIN" class="form-control">
						</div>
						<div class="form-holder">
							<input type="number" placeholder="Reenter PIN"
								class="form-control">
						</div>
					</div>
					<div class="checkbox-circle mt-24">
						<label> <input type="checkbox" checked> Please
							accept <a href="#">terms and conditions ?</a> <span
							class="checkmark"></span>
						</label>
					</div>
				</div>
			</div>
		</section>
	</form>
</div>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-steps/1.1.0/jquery.steps.js"
	integrity="sha512-gH0SqyjTN7WJAtki1UvqOkhWi3WsF9LY05BMwdcSq6QdFDXrXeXy0q8iP0YmBXCqo7OnSgdIPrC5Vqn8/KRu/Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
	$(function() {
		$("#wizard").steps({
			headerTag : "h2",
			bodyTag : "section",
			transitionEffect : "fade",
			enableAllSteps : true,
			transitionEffectSpeed : 500,
			labels : {
				finish : "Submit",
				next : "Forward",
				previous : "Backward"
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
			var text = $(this).attr('rel');
			$(this).parent().prev().find('div').text(text);
		})
	})
</script>


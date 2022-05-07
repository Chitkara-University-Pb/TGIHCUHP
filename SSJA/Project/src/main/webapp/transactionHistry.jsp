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
<%@include file="all_css_js.jsp"%>

</head>
<body>

	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
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
					long id = 10000;
					String username = "";
					for (AccountInfo note : list) {
						if (note.getSignUpInfo().getUserName().equals(str)) {
							username = note.getName();
						}
					}
					%>
					<h3><%=username%></h3>

				</div>
			</div>
			<ul class="list-unstyled components mb-5">
				<li><a href="#" style="text-decoration: none;"><span
						class="fa fa-home mr-3"></span> Account Details</a></li>
				<li><a href="transferManu.jsp" style="text-decoration: none;"><span
						class="fa fa-gift mr-3"></span> Tranfer Money</a></li>
				<li class="active"><a href="#" style="text-decoration: none;"><span
						class="fa fa-history mr-3"></span> Transaction History</a></li>
				<li><a href="loanSection.jsp" style="text-decoration: none;"><span
						class="fa fa-cog mr-3"></span> Loan Section</a></li>
				<li><a href="otherSuports.jsp" style="text-decoration: none;"><span
						class="fa fa-support mr-3"></span> Other Supports</a></li>
				<li><a href="LogOutServlet" style="text-decoration: none;"><span
						class="fa fa-sign-out mr-3"></span> Sign Out</a></li>
			</ul>

		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<div class="d-flex justify-content-between mb-5">
				<h3 class="mb-2">Transaction History</h3>

			</div>


			<table class="table">
				<thead>
					<tr>
						<th scope="col">Bank Account ID</th>
						<th scope="col">From</th>
						<th scope="col">To</th>
						<th scope="col">Date</th>
						<th scope="col">Amount</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<th scope="row">10001</th>
						<td>250035648</td>
						<td>253468975</td>
						<td>06/05/2022</td>
						<td><i class="fa fa-inr" aria-hidden="true"></i> 500</td>
					</tr>
					<tr>
						<th scope="row">10002</th>
						<td>250036848</td>
						<td>356468975</td>
						<td>06/05/2022</td>
						<td><i class="fa fa-inr" aria-hidden="true"></i> 300</td>
					</tr>
					<tr>
						<th scope="row">10001</th>
						<td>250069848</td>
						<td>258958975</td>
						<td>07/05/2022</td>
						<td><i class="fa fa-inr" aria-hidden="true"></i> 200</td>
					</tr>
					<tr>
						<th scope="row">10001</th>
						<td>250035648</td>
						<td>289648975</td>
						<td>07/05/2022</td>
						<td><i class="fa fa-inr" aria-hidden="true"></i> 3000</td>
					</tr>

				</tbody>
			</table>
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
	</script>

</body>
</html>
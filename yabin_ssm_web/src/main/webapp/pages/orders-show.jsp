<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Page meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Data - AdminLTE2 MOD</title>
<meta name="description" content="AdminLTE2 MOD">
<meta name="keywords" content="AdminLTE2 MOD">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<link rel=“stylesheet”
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- Header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- Header /-->

		<!-- Nav-sidebar -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- Nav-sidebar /-->

		<!-- Content Area -->
		<div class="content-wrapper">

			<!-- Content Header -->
			<section class="content-header">
			<h1>
				Orders Admin <small>All Orders</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="all-admin-index.html"><i
						class="fa fa-dashboard"></i>Home</a></li>
				<li><a href="all-order-manage-list.html">Orders Admin</a></li>
				<li class="active">Order Detail</li>
			</ol>
			</section>
			<!-- Content Header /-->

			<!-- Content -->
			<section class="content"> <!--Order Info-->
			<div class="panel panel-default">
				<div class="panel-heading">Order Info</div>
				<div class="row data-type">

					<div class="col-md-2 title">Order Number</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="Order Number"
							value="${orders.orderNum }" readonly="readonly">
					</div>

					<div class="col-md-2 title">Order Time</div>
					<div class="col-md-4 data">
						<div class="input-group date">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" class="form-control pull-right"
								id="datepicker-a3" readonly="readonly"
								value="${orders.orderTimeStr}">
						</div>
					</div>
					<div class="col-md-2 title">Route Name</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="Route Name"
							value="${orders.product.productName }" readonly="readonly">
					</div>

					<div class="col-md-2 title">Departure City</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="Departure City"
							value="${orders.product.cityName }" readonly="readonly">
					</div>

					<div class="col-md-2 title">Departure Time</div>
					<div class="col-md-4 data">
						<div class="input-group date">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" class="form-control pull-right"
								id="datepicker-a6" value="${orders.product.departureTimeStr}"
								readonly="readonly">
						</div>
					</div>
					<div class="col-md-2 title">Num of People</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="Num of People"
							value="${orders.peopleCount}" readonly="readonly">
					</div>

					<div class="col-md-2 title rowHeight2x">Remarks Info</div>
					<div class="col-md-10 data rowHeight2x">
						<textarea class="form-control" rows="3" placeholder="Remarks Info">
							${orders.orderDesc }
						</textarea>
					</div>

				</div>
			</div>
			<!--Order Info/--> <!--Traveller Info-->
			<div class="panel panel-default">
				<div class="panel-heading">Traveller Info</div>
				<!--Data List-->
				<table id="dataList"
					class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="">Traveller Type</th>
							<th class="">Name</th>
							<th class="">Sex</th>
							<th class="">Phone Num</th>
							<th class="">ID Type</th>
							<th class="">ID Number</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="traveller" items="${orders.travellers}">

							<tr>
								<td>${traveller.travellerTypeStr}</td>
								<td><input type="text" size="10" value="${traveller.name }"
									readonly="readonly"></td>
								<td><input type="text" size="10" value="${traveller.sex }"
									readonly="readonly"></td>
								<td><input type="text" size="20"
									value="${traveller.phoneNum }" readonly="readonly"></td>
								<td><input type="text" size="15"
									value="${traveller.credentialsTypeStr}" readonly="readonly"></td>
								<td><input type="text" size="28"
									value="${traveller.credentialsNum }" readonly="readonly"></td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
				<!--Data List/-->
			</div>
			<!--Traveller Info/--> <!--Contact Info-->
			<div class="panel panel-default">
				<div class="panel-heading">Contact Info</div>
				<div class="row data-type">

					<div class="col-md-2 title">Member</div>
					<div class="col-md-4 data text">${orders.member.nickname }</div>

					<div class="col-md-2 title">Contact Name</div>
					<div class="col-md-4 data text">${orders.member.name}</div>

					<div class="col-md-2 title">Phone Num</div>
					<div class="col-md-4 data text">${orders.member.phoneNum}</div>

					<div class="col-md-2 title">Email</div>
					<div class="col-md-4 data text">${orders.member.email}</div>

				</div>
			</div>
			<!--Contact Info/--> <!--Bill Info--> <c:if test="${orders.orderStatus==1}">
				<div class="panel panel-default">
					<div class="panel-heading">Bill Info</div>
					<div class="row data-type">

						<div class="col-md-2 title">Pay Type</div>
						<div class="col-md-4 data text">Online payment-${orders.payTypeStr}</div>

						<div class="col-md-2 title">Amount</div>
						<div class="col-md-4 data text">$${orders.product.productPrice}</div>

					</div>
				</div>
			</c:if> <!--Bill Info/--> <!--Tool Bar-->
			<div class="box-tools text-center">

				<button type="button" class="btn bg-default"
					onclick="history.back(-1);">Back</button>
			</div>
			<!--Tool Bar/--> </section>
			<!-- Content /-->


		</div>
		<!-- Content Area /-->

		<!-- Footer -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0.8
		</div>
			<strong>Copyright &copy; 2014-2017 <a
					href="https://github.com/sonicfrog-z?tab=repositories">SonicFrog-Z</a>.
			</strong> All rights reserved.
		</footer>
		<!-- Footer /-->

	</div>

	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

	<script>
		$(document).ready(function() {
			//  selection list
			$(".select2").select2();

			// WYSIHTML5 editor
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// Set sidebar active
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {

			// Activate sidebar
			setSidebarActive("order-manage");

			// checkbox
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});
			// check all box
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
		});
	</script>
</body>


</html>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/PS24728_NguyenVanBao_ASM/css/nav.css">
<link rel="stylesheet" href="/PS24728_NguyenVanBao_ASM/css/detail.css">
</head>
<style>
.title {
	font-family: "YouTube Sans", Roboto, sans-serif;
	font-size: 20px;
	line-height: 28px;
	text-align: start;
	font-weight: 600;
	letter-spacing: normal;
}

.card {
	border: 0px !important;
}
</style>
<body>
	<script>
		// Lấy giá trị tham số id từ URL
		const urlParams = new URLSearchParams(window.location.search);
		const itemId = urlParams.get('id');
	</script>
	<section>
		<jsp:include page="navbar.jsp"></jsp:include>
	</section>
	<section>
		<div class="container-fluid col-11">
			<div class="row">
				<div class="col-md-9">
					<iframe class="w-100" height="500" title="YouTube video player"
						frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen autoplay
						src="https://www.youtube.com/embed/${form.id}"> Your
						browser does not support HTML video. </iframe>
					<p class="title my-0">${form.title}</p>
					<div class="row">
						<div class="col-6">
							<p class="my-0">${form.views}</p>
							<p class="my-0"></p>
						</div>
						<div class="col-6">
							<div class="d-flex justify-content-center">
								<c:if test="${not empty sessionScope.us}">
									<div class="btn-group rounded-pill mx-3">
										<a href="#"
											onclick="event.preventDefault(); location.href='${url}?id=${form.id}'"
											class="btn detail" type="button"> <i
											class="bi bi-hand-thumbs-up"></i>35N
										</a> <a href="#"
											onclick="event.preventDefault(); location.href='${url}?id=${form.id}'"
											class="btn detail" type="button"> <i
											class="bi bi-hand-thumbs-down"></i>
										</a>
									</div>
									<button class="btn mx-3 rounded-pill detail" type="button"
										data-bs-toggle="modal" data-bs-target="#myModal">
										<i class="bi bi-cloud-arrow-up"></i>Share
									</button>
								</c:if>
								<c:if test="${empty sessionScope.us}">
									<div class="btn-group rounded-pill mx-3">
										<a href="/PS24728_NguyenVanBao_ASM/login" class="btn detail" type="button"> <i
											class="bi bi-hand-thumbs-up"></i>35N
										</a> <a href="/PS24728_NguyenVanBao_ASM/login" class="btn detail" type="button"> <i
											class="bi bi-hand-thumbs-down"></i>
										</a>
									</div>
									<a href="/PS24728_NguyenVanBao_ASM/login" class="btn mx-3 rounded-pill detail" type="button">
										<i class="bi bi-cloud-arrow-up"></i>Share
									</a>
								</c:if>

								<div class="dropdown mx-3">
									<button class="dots btn rounded-circle dropdown-toggle detail"
										data-bs-toggle="dropdown">
										<i class="bx bx-dots-vertical-rounded"></i>
									</button>
									<ul class="dropdown-menu detail">
										<li><a class="dropdown-item" href="#"><i
												class="bi bi-flag"></i>Report</a></li>
										<li><a class="dropdown-item" href="#"><i
												class="bi bi-keyboard"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<textarea class="w-100 my-3" name="" id="" cols="30" rows="10">${form.description}</textarea>
					</div>
				</div>
				<div class="d-flex flex-column col-md-3">
					<jsp:include page="list.jsp" />
				</div>
			</div>
		</div>
	</section>
	<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Share your friend</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form action="${url}" method="post" class="was-validated">
					<div class="mb-3 ">
						<mark>${msg2}</mark>
						<label for="" class="form-label">Nhập email muốn gửi: </label> <input
							name="share" id="mails" type="text" class="form-control" required>
					</div>
					<div class="d-flex justify-content-end">
						<button formaction='' class="btn btn-primary btnOK">OK</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
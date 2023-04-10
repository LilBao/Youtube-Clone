<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<link>
<style type="text/css">
.dots {
	border: 0px;
}

.dots:focus {
	border: 0px;
}

.card {
	margin-top: 50px;
}
</style>
</head>
<body>
	<c:url var="url" value="/home"></c:url>
	<section>
		<jsp:include page="navbar.jsp"></jsp:include>
	</section>
	<section>
		<script>
			// Lấy giá trị tham số id từ URL
			const urlParams = new URLSearchParams(window.location.search);
			const videoID = urlParams.get('id');
			
			 var btnOK = document.querySelector(".btnOK");
			  var mails = document.getElementById("mails");
			  var shareID = null;

			  $('#myModal').on('show.bs.modal', function (event) {
			    var button = $(event.relatedTarget);
			    shareID = button.data('share-id');
			    btnOK.setAttribute("formaction", '${url}?shareID=' + shareID);
			  });

			  btnOK.addEventListener('click', function (event) {
			    event.preventDefault();
			    var shareEmail = mails.value;
			  });
		</script>
		<div class="container">
			<div class="row">
				<c:forEach var="item" items="${homes}">
					<div class="col-md-4 col-sm-12">
						<div class="card my-3">
							<a href="/PS24728_NguyenVanBao_ASM/detail"
								onclick="event.preventDefault(); window.location.href='/PS24728_NguyenVanBao_ASM/detail?id=${item.id}'">
								<c:if test="${not empty item.poster}">
									<img class="w-100 card-img-top"
										style="height: 200px; object-fit: cover;"
										src="https://img.youtube.com/vi/${item.poster}/maxresdefault.jpg"
										alt="Card image">
								</c:if> <c:if test="${empty item.poster}">
									<img class="w-100 card-img-top"
										style="height: 200px; object-fit: cover;"
										src="/PS24728_NguyenVanBao_ASM/files/str.jpg" alt="Card image">
								</c:if>
							</a>
							<div class="card-body">
								<div class="row">
									<div class="col-11">
										<h5 class="m-0">${item.title}</h5>
										<p class="m-0">${item.views}Views</p>
									</div>
									<div class="col-1">
										<div class="dropdown">
											<div class="dropdown">
												<button class="dots btn p-0 dropdown-toggle hide-arrow"
													data-bs-toggle="dropdown" aria-expanded="false">
													<i class="bx bx-dots-vertical-rounded"></i>
												</button>
												<ul class="dropdown-menu">
													<c:if test="${not empty sessionScope.us}">
														<li><a class="dropdown-item" href="#"
															onclick="event.preventDefault(); window.location.href='${url}?idVideo=${item.id}'">
																<i class="bi bi-list-check">Like</i>
														</a></li>
														<li><a href="#" class="dropdown-item"
															onclick="window.history.replaceState(null, null, '${url}?shareID=${item.id}')"
															 data-share-id="${item.id}" data-bs-toggle="modal" data-bs-target="#myModal"> <i
																class="bi bi-cloud-arrow-up">Share</i>
														</a></li>
													</c:if>
													<c:if test="${empty sessionScope.us}">
														<li><a class="dropdown-item"
															href="/PS24728_NguyenVanBao_ASM/login"> <i
																class="bi bi-list-check">Like</i>
														</a></li>
														<li><a href="/PS24728_NguyenVanBao_ASM/login"
															class="dropdown-item"> <i
																class="bi bi-cloud-arrow-up">Share</i>
														</a></li>
													</c:if>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
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
										<label for="" class="form-label">Nhập email muốn gửi:
										</label> <input name="share" id="mails" type="text" class="form-control" required>
									</div>
									<div class="d-flex justify-content-end">
										<button formaction='' class="btn btn-primary btnOK">OK</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<style>
.dots {
	border: 0px;
}

.dots:focus {
	border: 0px;
}
</style>
<script type="text/javascript">
	var btnOK = document.querySelector(".btnOK");
	var mails = document.getElementById("mails");
	var shareID = null;

	$('#myModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget);
		shareID = button.data('share-id');
		btnOK.setAttribute("formaction", '${url}?shareID=' + shareID);
	});

	btnOK.addEventListener('click', function(event) {
		event.preventDefault();
		var shareEmail = mails.value;
	});
</script>
<c:forEach var="random" items="${random}">
	<div>
		<div class="card" style="margin-bottom: 1rem;">
			<div class="row">
				<div class="col-6">
					<a href="/PS24728_NguyenVanBao_ASM/detail"
						onclick="event.preventDefault(); window.location.href='/PS24728_NguyenVanBao_ASM/detail?id=${random.id}'">

						<c:if test="${not empty random.poster}">
							<img class="w-100"
								style="height: 100px; object-fit: cover; border-radius: 5px"
								src="https://img.youtube.com/vi/${random.poster}/maxresdefault.jpg"
								alt="Card image">
						</c:if> <c:if test="${empty random.poster}">
							<img class="w-100"
								style="height: 100px; object-fit: cover; border-radius: 5px"
								src="/PS24728_NguyenVanBao_ASM/files/str.jpg" alt="Card image">
						</c:if>
					</a>
				</div>
				<div class="col-6 px-0">
					<div class="row">
						<div class="col-9">
							<p style="font-size: 15px;" class="title m-0">${random.title }</p>
							<p class="m-0">${random.views}Views</p>
						</div>

						<div class="col-3">
							<div class="dropdown">
								<div class="dropdown">
									<button class="dots btn p-0 dropdown-toggle hide-arrow"
										data-bs-toggle="dropdown" aria-expanded="false">
										<i class="bx bx-dots-vertical-rounded"></i>
									</button>

									<ul class="dropdown-menu">
										<c:if test="${not empty sessionScope.us}">
											<li><a class="dropdown-item" href="#"><i
													class="bi bi-list-check">Thêm vào danh sách chờ</i></a></li>
											<li><a href="#" class="dropdown-item"
												onclick="window.history.replaceState(null, null, '${url}?shareID=${item.id}')"
												data-share-id="${item.id}" data-bs-toggle="modal"
												data-bs-target="#myModal"><i
													class="bi bi-cloud-arrow-up">Share</i></a></li>
										</c:if>
										<c:if test="${empty sessionScope.us}">
											<li><a class="dropdown-item" href="#"><i
													class="bi bi-list-check">Thêm vào danh sách chờ</i></a></li>
											<li><a class="dropdown-item"
												href="/PS24728_NguyenVanBao_ASM/login"><i
													class="bi bi-cloud-arrow-up">Share</i></a></li>
										</c:if>

									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>


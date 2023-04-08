<%-- <%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
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
<link rel="stylesheet" href="/PS24728_NguyenVanBao_ASM/css/login.css">
<link>
</head>
<body>
	<section>
		<div class="container col-4">
			<mark>${message2 }</mark>
				<form action="/PS24728_NguyenVanBao_ASM/forgot" class="form was-validated" method="post">
					<div class="mb-3 ">
						<label for="username" class="form-label"> Tài Khoản:
						</label> <input name="usernameFg" type="text" id="username" class="form-control" placeholder="Username" required>
					</div>
					<div class="mb-3 ">
						<label for="email" class="form-label"> Email:
						</label> <input name="emailFg" type="email" id="email" class="form-control" placeholder="Email" required>
					</div>
					<div class="d-flex justify-content-end">
						<button class="btn btn-primary btnOK ">OK</button>
					</div>
				</form>
		</div>
	</section>
</body>
</html> --%>





<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<c:url var="url" value="/login" />
<div class="modal fade" id="myModal2">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Quên Mật Khẩu</h4>
				<button type="button" class="" data-bs-dismiss="modal"></button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
			<mark>${message2 }</mark>
				<form action="${url}" class="was-validated" method="post">
					<div class="mb-3 ">
						<label for="username" class="form-label"> Tài Khoản:
						</label> <input name="usernameID" type="text" id="username" class="form-control" placeholder="Username" required>
					</div>
					<div class="mb-3 ">
						<label for="email" class="form-label"> Email:
						</label> <input name="emailID" type="email" id="email" class="form-control" placeholder="Email" required>
					</div>
					<div class="d-flex justify-content-end">
						<button class="btn btn-primary btnOK" formaction="${url}/forgot">OK</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div> 
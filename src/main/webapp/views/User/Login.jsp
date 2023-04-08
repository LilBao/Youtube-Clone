<%@ page pageEncoding="utf-8"%>
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
	<c:url var="url" value="/login" />
	<section>
		<div class="container col-4">
			<form action="${url}" class="form"
				method="post">
				<h4 class="mx-5 mt-5">Đăng Nhập</h4>
				<div class="form-outline mx-5 ">
					<div class="form-floating">
						<input name="id" type="text" id="loginName" class="form-control"
							placeholder="Email or username" /> <label class="form-label"
							for="loginName">Email or username</label>
					</div>

				</div>
				<div class="form-outline my-4 mx-5">
					<div class="form-floating">
						<input name="password" type="password" id="form2Example2"
							class="form-control" placeholder="password" /> <label
							class="form-label" for="form2Example2">password</label>
					</div>
				</div>
				<div class="d-flex justify-content-between align-items-center mx-5">
					<!-- Checkbox -->
					<div class="form-check mb-0">
						<input name="remember" class="form-check-input me-2" type="checkbox" value=""
							id="form2Example3" /> <label class="form-check-label"
							for="form2Example3"> Remember me </label>
					</div>
					<a href="${url}" class="text-body" data-bs-toggle="modal"
						data-bs-target="#myModal2">Forgot password?</a>
				</div>
				<div class="d-flex justify-content-center my-4">
					<button class="btn btn-outline-dark btn-lg px-5"
						formaction="${url}/OK" type="submit">Login</button>
				</div>
				<div class="d-flex justify-content-between mx-5">
					<p>You don't have an account?</p>
					<a href="/PS24728_NguyenVanBao_ASM/signup">Register</a>
				</div>
				<div class="divider d-flex align-items-center">
					<p class="text-center mx-3 mb-0">Or sign in with</p>
				</div>
				<div class="d-flex justify-content-center mb-5">
					<a class="btn " href=""><i class="bi bi-facebook"></i></a> <a
						class="btn " href=""><i class="bi bi-google"></i></a> <a
						class="btn " href=""><i class="bi bi-twitter"></i></a> <a
						class="btn " href=""><i class="bi bi-github"></i></a>
				</div>
			</form>
			<mark>${message }</mark>
				${param.error}
			
		</div>
	</section>
	<jsp:include page="ForgotPass.jsp"></jsp:include>
</body>
</html>
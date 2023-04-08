<%@ page     pageEncoding="utf-8"%>
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
<link rel="stylesheet"
	href="/PS24728_NguyenVanBao_ASM/css/login.css">
<link>
</head>
<body>
	<div class="container col-4">
		<mark>${message}</mark>
        <form action="" class="form" method="post">
            <h4 class="mx-5 mt-5">Đăng Ký</h4>
            <div class="form-outline mx-5 ">
                <div class="form-floating">
                    <input name="id" type="text" id="username" class="form-control" placeholder="Username" />
                    <label class="form-label" for="username">Username</label>
                </div>
            </div>
            <div class="form-outline my-4 mx-5 ">
                <div class="form-floating">
                    <input name="fullname" type="text" id="fullname" class="form-control" placeholder="Fullname" />
                    <label class="form-label" for="fullname">Fullname</label>
                </div>
            </div>
            <div class="form-outline my-4 mx-5 ">
                <div class="form-floating">
                    <input name="email" type="email" id="email" class="form-control" placeholder="Email" />
                    <label class="form-label" for="email">Email</label>
                </div>
            </div>
            <div class="form-outline my-4 mx-5">
                <div class="form-floating">
                    <input name="password" type="password" id="pass" class="form-control" placeholder="Password" />
                    <label class="form-label" for="pass">Password</label>
                </div>
            </div>
            <div class="form-outline mx-5">
                <div class="form-floating">
                    <input name="confirmPass" type="password" id="cfpass" class="form-control" placeholder="Confirm password" />
                    <label class="form-label" for="cfpass">Confirm password</label>
                </div>
            </div>
            <input name="admin" type="hidden" value="false">
            <div class="d-flex justify-content-center my-4">
                <button class="btn btn-outline-dark btn-lg px-5" type="submit">Sign up</button>
            </div>
            <p class="text-center">Already have an account? <a href="/PS24728_NguyenVanBao_ASM/login">Sign in instead</a></p>
        </form>
    </div>
</body>
</html>
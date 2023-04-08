<%@ page 
    pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="/PS24728_NguyenVanBao_ASM/css/nav.css"><link>
</head>
<body>
	<section>
		<jsp:include page="navbar.jsp"></jsp:include>
	</section>
	<div class="container col-4">
		<form action="/PS24728_NguyenVanBao_ASM/edit-profile" method="post" class="form rounded" style="border-radius:1px">
	        <h4 class="mx-5 mt-5">Edit profile</h4>
	        <div class="form-outline mx-5 ">
	            <div class="form-floating">
	                <input value="${us.id }" name="id" type="text" id="username" class="form-control" placeholder="Username"/>
	                <label class="form-label" for="username">Username</label>
	            </div> 
	        </div>
	        <div class="form-outline my-4 mx-5">
	            <div class="form-floating">
	                <input value="${us.password }" name="password" type="password" id="pass" class="form-control" placeholder="Password"/>
	            <label class="form-label" for="pass">Password</label>
	            </div>
	        </div>
	        <div class="form-outline my-4 mx-5 ">
	            <div class="form-floating">
	                <input value="${us.email }" name="email" type="email" id="email" class="form-control" placeholder="Email"/>
	                <label class="form-label" for="email">Email</label>
	            </div>
	        </div>
	        <div class="form-outline mx-5">
	            <div class="form-floating">
	                <input value="${us.fullname }" name="fullname" type="text" id="fname" class="form-control" placeholder="Fullname"/>
	                <label class="form-label" for="fname">Fullname</label>
	            </div>
	        </div>
	        <div class="d-flex justify-content-end mx-5 my-4">
	            <button class="btn btn-outline-dark btn-lg px-5" type="submit">Update</button>
	        </div>
	    </form>
	</div>
</body>
</html>
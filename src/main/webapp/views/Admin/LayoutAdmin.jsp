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
<link rel="stylesheet" type="text/css" href="/PS24728_NguyenVanBao_ASM/css/nav.css">
<link rel="stylesheet" type="text/css" href="/PS24728_NguyenVanBao_ASM/css/menu.css">

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-0 col-md-2">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			<div class="col-sm-12 col-md-10" style="background:#f5f5f9;">
				<jsp:include page="nav.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>
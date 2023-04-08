<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
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
<link rel="stylesheet" type="text/css" href="/PS24728_NguyenVanBao_ASM/css/menu.css">
<link rel="stylesheet" type="text/css" href="/PS24728_NguyenVanBao_ASM/css/UserManager.css"><link>

</head>
<body>
	<c:url var="url" value="/User"/>
	<div class="container-fluid">
		${message}
	
		<div class="row">
			<div class="col-sm-0 col-md-2">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			<div class="col-sm-12 col-md-10 bg">
				<jsp:include page="nav.jsp"></jsp:include>
				<div class="container col-11 my-4">
				<div class="row">
		            <div class="col-4 card">
		                <form action="${url}">
		                    <div class="form-outline my-4">
		                        <div class="form-floating">
		                            <input value="${form.id}" name="id" type="text" id="username" class="form-control" placeholder="Username" />
		                            <label class="form-label" for="username">Username</label>
		                        </div>
		                    </div>
		                    <div class="form-outline my-4">
		                        <div class="form-floating">
		                            <input value="${form.password }" name="password" type="text" id="pass" class="form-control" placeholder="Password" />
		                            <label class="form-label" for="pass">Password</label>
		                        </div>
		                    </div>
		                    <div class="form-outline my-4">
		                        <div class="form-floating">
		                            <input value="${form.fullname }" name="fullname" type="text" id="fullname" class="form-control" placeholder="Fullname" />
		                            <label class="form-label" for="fullname">Fullname</label>
		                        </div>
		                    </div>
		                    <div class="form-outline my-4">
		                        <div class="form-floating">
		                            <input value="${form.email }" name="email" type="text" id="email" class="form-control" placeholder="Email" />
		                            <label class="form-label" for="email">Email</label>
		                        </div>
		                    </div>
		                    <div>
								<input ${form.admin?'checked':''} type="radio" name="admin">Admin
								<input ${form.admin?'':'checked'} type="radio" name="admin">User
							</div>
							<div class="d-flex justify-content-end">
		                    	<button formaction="${url}/Update" class="btnbg btn btn-outline-dark m-3 px-2" type="submit"><i class="bi bi-capslock">Update</i></button>
		                    	<button formaction="${url}/Delete" class="btnbg btn btn-outline-dark m-3 px-2" type="submit"><i class="bi bi-x-lg">Delete</i></button>
		                	</div>
		                </form>
		            </div>
		            <div class="col-8 card">
		                <table class="table table-hover">
		                    <thead>
		                      <tr>
		                        <th>Username</th>
		                        <th>Password</th>
		                        <th>Fullname</th>
		                        <th>Email</th>
		                        <th>Role</th>
		                        <th></th>
		                      </tr>
		                    </thead>
		                    <tbody>
		                   <c:forEach var="item" items="${users }">
		                    	<tr>
			                        <td>${item.id}</td>
			                        <td>${item.password}</td>
			                        <td>${item.fullname}</td>
			                        <td>${item.email}</td>
			                        <td> <i class="bi bi-person-circle">${item.admin?'Admin':'User'}</i></td>		            
			                        <td>
			                          <div class="dropdown">
			                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
			                              <i class="bx bx-dots-vertical-rounded"></i></a>
			                            <ul class="dropdown-menu">
			                              <li><a class="dropdown-item" href="${url}/Delete"><i class="bi bi-trash3">Delete</i></a></li>
			                              <li><a class="dropdown-item" href="${url}/Edit/${item.id}"><i class="bi bi-pencil-square">Edit</i></a></li>
			                            </ul>
			                          </div>
			                        </td>
		                      </tr>
		                    </c:forEach>
		                    </tbody>
		                  </table>
		                  <div class="d-flex justify-content-center">
		                    <button class="btnbg btn btn-outline-dark mx-2" type="submit"><i class="bi bi-arrow-bar-left"></i></button>
		                    <button class="btnbg btn btn-outline-dark mx-2" type="submit"><i class="bi bi-arrow-left"></i></button>
		                    <button class="btnbg btn btn-outline-dark mx-2" type="submit"><i class="bi bi-arrow-right"></i></button>
		                    <button class="btnbg btn btn-outline-dark mx-2" type="submit"><i class="bi bi-arrow-bar-right"></i></button>
		                  </div>
		            </div>
		        </div>
		        </div>
			</div>
		</div>
	</div>
</body>
</html>
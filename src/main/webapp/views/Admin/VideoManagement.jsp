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
	crossorigin="anonymous">
</script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/PS24728_NguyenVanBao_ASM/css/managerVideo.css"><link>
<link rel="stylesheet" type="text/css" href="/PS24728_NguyenVanBao_ASM/css/menu.css">
<link rel="stylesheet" type="text/css" href="/PS24728_NguyenVanBao_ASM/css/nav.css"><link>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	
	<c:url var="url" value="/Video"/>
	<div class="container-fluid">
			${message}
		<div class="row">
			<div class="col-sm-0 col-md-2">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			<div class="col-sm-12 col-md-10 bg">
				<jsp:include page="nav.jsp"></jsp:include>
				<section class="card container col-11 my-4">  
				<form action="${url}" method="post" enctype="multipart/form-data">
				        <div class="row">
				          <div class="col-4 my-4">
<!-- 				            <input type="file" name="photo_file">
 -->				             <div class="form-floating">
				                <input name="poster" value="${form.poster}" type="text" id="poster" class="form-control" placeholder="Poster src" />
				                <label class="form-label" for="poster">Poster src</label>
				              </div>
				               <img id='imgPreview' class="w-100 my-4" src="" alt="">
				               <script type="text/javascript">
				               		$(document).ready(function() {
				                   			var newSrc = $('#poster').val();
				                   			$('#imgPreview').attr('src','https://img.youtube.com/vi/'+newSrc+'/maxresdefault.jpg');
				               		});
								    $('#poster').on('blur', function(){
								        var newSrc = $(this).val();
								        $('#imgPreview').attr('src','https://img.youtube.com/vi/'+newSrc+'/maxresdefault.jpg');
								    });
								</script>
				          </div>
				          <div class="col-8">
				            <div class="form-outline my-4">
				              <div class="form-floating">
				                <input name="id" value="${form.id}" type="text" id="ytbid" class="form-control" placeholder="Youtube ID" />
				                <label class="form-label" for="ytbid">Youtube ID</label>
				              </div>
				            </div>
				            <div class="form-outline my-4">
				              <div class="form-floating">
				                <input name="title" value="${form.title}"  type="text" id="title" class="form-control" placeholder="Video title" />
				                <label class="form-label" for="title">Video title</label>
				              </div>
				            </div>
				            <div class="form-outline my-4">
				              <div class="form-floating">
				                <input name="views" value="${form.views}"  type="text" id="viewCount" class="form-control" placeholder="viewcount" />
				                <label class="form-label" for="viewCount">viewcount</label>
				              </div>
				            </div>
				            <div class="my-4">
				              	<input ${form.active ? 'checked' : ''}	value="true" type="radio" name="active">Active
								<input ${!form.active ? 'checked' : ''} value="false" type="radio" name="active">Inactive
				            </div>
				            <div>
				              <label for="">Description</label>
				              <textarea class="w-100" name="description" id="" cols="30" rows="10">${form.description } </textarea>
				            </div>
				            </div>
				          </div>
				          <div class="d-flex justify-content-end">
				        	<button formaction="${url}/Create" class="text-center btn btnbg btn-outline-dark m-3 px-2" type="submit"><i class="bi bi-plus-lg">Create</i></button>
				        	<button formaction="${url}/Update" class="btn btnbg btn-outline-dark m-3 px-2" type="submit"><i class="bi bi-capslock">Update</i></button>
				        	<button formaction="${url}/Delete" class="btn btnbg btn-outline-dark m-3 px-2" type="submit"><i class="bi bi-x-lg">Delete</i></button>
				        	<a href="${url}" class="btn btnbg btn-outline-dark m-3 px-2" type="submit"><i class="bi bi-arrow-counterclockwise">Reset</i></a>
				      	</div>
				          </form>
				  </section>
				
				  <section class="container card col-11">
				    <table class="table table-hover">
				      <thead>
				        <tr>
				          <th>Youtube ID</th>
				          <th>Video title</th>
				          <th>View count</th>
				          <th>Status</th>
				          <th></th>
				        </tr>
				      </thead>
				      <tbody>
				      <c:forEach var="item" items="${videos }">
				      <tr>
				          <td>${item.id }</td>
				          <td>${item.title }</td>
				          <td>${item.views }</td>
				          <td>
				          	<c:if test="${item.active==true}">
				          		<span class="badge bg-success p-1">Active</span>			   
				          	</c:if>
				          	<c:if test="${item.active==false}">
				          		<span class="badge bg-danger p-1">InActive</span>
				          	</c:if>				          
				          </td>
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
				      <button class="btn btnbg btn-outline-dark m-2" type="submit"><i class="bi bi-arrow-bar-left"></i></i></button>
				      <button class="btn btnbg btn-outline-dark m-2" type="submit"><i class="bi bi-arrow-left"></i></button>
				      <button class="btn btnbg btn-outline-dark m-2" type="submit"><i class="bi bi-arrow-right"></i></button>
				      <button class="btn btnbg btn-outline-dark m-2" type="submit"><i class="bi bi-arrow-bar-right"></i></button>
				    </div>
				  </section>
				</div>
			</div>
		</div>
</body>
</html>
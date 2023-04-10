<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

   <nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container-fluid ">
      <a class="navbar-brand" href="/PS24728_NguyenVanBao_ASM/home">
        <img class="" src="/PS24728_NguyenVanBao_ASM/images/ytb.png" alt="Logo" style="width:100px;" class="rounded-pill">
      </a>
      <!-- search -->
      <form class="d-flex search w-25 jutify-content-end">
        <button class=" btn btn-primary" type="button"><i class="bi bi-search-heart"></i></button>
        <input class="" type="text" placeholder="Search...">
      </form>

      <ul class="nav ms-auto navbar-right">
        <li class="nav-item">
          <a style=" color: black;" class="nav-link" href="/PS24728_NguyenVanBao_ASM/likedVideo">Liked Video</a>
        </li>
        <li class="nav-item">
        <c:if test="${sessionScope.us.admin}">
			<a style=" color: black;" class="nav-link" href="/PS24728_NguyenVanBao_ASM/Admin">Management</a>
		</c:if>
		</li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img (31).webp" class="rounded-circle" height="22"
              alt="Portrait of a Woman" loading="lazy" />
          </a>
          <ul class="dropdown-menu dropdown-menu-end w-50">
            <li>
              <a class="dropdown-item" href="#">
              <c:if test="${not empty sessionScope.us}">
                <div class="d-flex">
                  <div class="flex-shrink-0 me-3">
                    <div class="">
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img (31).webp" height="50" class="w-15 rounded-circle" />
                    </div>
                  </div>
                  <div class="flex-grow-1">
                    <span class="fw-semibold d-block">${sessionScope.us.fullname}</span>
                    <small class="text-muted">${sessionScope.us.admin}Admin</small>
                  </div>
                </div>
               </c:if>
              </a>
            </li>
            <li>
              <div class="dropdown-divider"></div>
            </li>
            <li>
            <c:if test="${empty sessionScope.us}">
              <a class="dropdown-item" href="/PS24728_NguyenVanBao_ASM/login">
                <i class="bx bx-user me-2"></i>
                <span class="align-middle">Login</span>
              </a>
              </c:if>
            </li>
            <li>
              <a class="dropdown-item" href="/PS24728_NguyenVanBao_ASM/edit-profile">
                <i class="bx bx-user me-2"></i>
                <span class="align-middle">My Profile</span>
              </a>
            </li>
            <li>
              <a class="dropdown-item" href="/PS24728_NguyenVanBao_ASM/ChangePass">
                <i class="bx bx-cog me-2"></i>
                <span class="align-middle">Change Pass</span>
              </a>
            </li>
            <li>
              <div class="dropdown-divider"></div>
            </li>
            <li>
              <a class="dropdown-item" href="/PS24728_NguyenVanBao_ASM/sign-out">
                <i class="bx bx-power-off me-2"></i>
                <span class="align-middle">Log Out</span>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>

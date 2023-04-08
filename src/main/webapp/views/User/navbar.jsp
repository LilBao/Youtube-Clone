<%@ page 
    pageEncoding="utf-8"%>
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
          <a class="nav-link" href="/PS24728_NguyenVanBao_ASM/likedVideo"><i class="bi bi-hand-thumbs-up">Liked Video</i></a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img (31).webp" class="rounded-circle" height="22"
              alt="Portrait of a Woman" loading="lazy" />
          </a>
          <ul class="dropdown-menu dropdown-menu-end w-50">
            <li>
              <a class="dropdown-item" href="#">
                <div class="d-flex">
                  <div class="flex-shrink-0 me-3">
                    <div class="">
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img (31).webp" height="50" alt
                        class="w-15 rounded-circle" />
                    </div>
                  </div>
                  <div class="flex-grow-1">
                    <span class="fw-semibold d-block">John Doe</span>
                    <small class="text-muted">Admin</small>
                  </div>
                </div>
              </a>
            </li>
            <li>
              <div class="dropdown-divider"></div>
            </li>
            <li>
              <a class="dropdown-item" href="/PS24728_NguyenVanBao_ASM/login">
                <i class="bx bx-user me-2"></i>
                <span class="align-middle">Login</span>
              </a>
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

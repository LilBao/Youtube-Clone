package Servlet;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import bean.Report;
import bean.User;
import bean.Video;
import untils.JpaUntils;
import untils.ReportDAO;
import untils.UserDAO;
import untils.VideoDAO;

@MultipartConfig
@WebServlet({ "/Admin", "/User", "/Video", "/Report", "/User/Update", "/User/Delete", "/User/Edit/*", "/Video/Create",
		"/Video/Update", "/Video/Delete", "/Video/Edit/*"})
public class AdminServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("Admin")) {
			req.getRequestDispatcher("/views/Admin/LayoutAdmin.jsp").forward(req, resp);
		} else if (uri.contains("Video")) {
			this.doVideo(req, resp);
		} else if (uri.contains("User")) {
			this.doUser(req, resp);
		} else if (uri.contains("Report")) {
			this.doReport(req, resp);
		}
	}

	private void doReport(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO daoVideo = new VideoDAO();		
		ReportDAO daoReport = new ReportDAO();
		List<Video> title = daoVideo.findAll();
		req.setAttribute("titles", title);
		// Report favoriteVideo
		List<Report> listReport = daoReport.report();
		req.setAttribute("reports", listReport);
		// Report Favortite User
		String idVideo = req.getParameter("idVideo");
		if (idVideo == null) { // Kiểm tra nếu giá trị bằng null
			idVideo = title.get(0).getId(); // Lấy giá trị đầu tiên trong trường hợp giá trị bị null
			List<Object[]> favoriteUser = daoReport.favoriteUser(idVideo);
			req.setAttribute("favoriteUser", favoriteUser);
		} else {
			List<Object[]> favoriteUser = daoReport.favoriteUser(idVideo);
			req.setAttribute("favoriteUser", favoriteUser);
		}
		// Report sendVideo
		System.out.println(idVideo);
		req.getRequestDispatcher("/views/Admin/Report.jsp").forward(req, resp);
	}

	private void doUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		User user = new User();
		UserDAO dao = new UserDAO();
		List<User> list = dao.findAll();
		String method = req.getMethod();
		if (uri.contains("Edit")) {
			String id = uri.substring(uri.lastIndexOf("/") + 1);
			user = dao.findByMainKey(id);
		} else if (uri.contains("Update")) {
			try {
				BeanUtils.populate(user, req.getParameterMap());
				dao.update(user);
				req.setAttribute("message", "Cập nhật thành công");
			} catch (IllegalAccessException | InvocationTargetException e) {
				req.setAttribute("message", "Cập nhật thất bại");
				e.printStackTrace();
			}
		} else if (uri.contains("Delete")) {
			try {
				String id = req.getParameter("id");
				dao.delete(id);
				req.setAttribute("message", "Xóa thành công");
			} catch (Exception e) {
				req.setAttribute("message", "Xóa thất bại");
				e.printStackTrace();
			}
		}
		req.setAttribute("form", user);
		req.setAttribute("users", list);
		req.getRequestDispatcher("/views/Admin/UserManagement.jsp").forward(req, resp);
	}

	private void doVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String method = req.getMethod();
		Video video = new Video();
		VideoDAO dao = new VideoDAO();
		List<Video> list = dao.findAll();
		File dir = new File(req.getServletContext().getRealPath("/files"));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		if (uri.contains("Edit")) {
			String id = uri.substring(uri.lastIndexOf("/") + 1);
			video = dao.findByMainKey(id);
		} else if (uri.contains("Create")) {
			try {
				BeanUtils.populate(video, req.getParameterMap());
				String strUrl = req.getParameter("poster");
				video.setPoster(strUrl.toString());
				System.out.println(strUrl.toString());
				dao.create(video);
				req.setAttribute("message", "Thêm thành công");
			} catch (IllegalAccessException | InvocationTargetException e) {
				req.setAttribute("message", "Thêm thất bại");
				e.printStackTrace();
			}
		} else if (uri.contains("Update")) {
			try {

				BeanUtils.populate(video, req.getParameterMap());
				dao.update(video);
				req.setAttribute("message", "Cập nhật thành công");
			} catch (IllegalAccessException | InvocationTargetException e) {
				req.setAttribute("message", "Cập nhật thất bại");
				e.printStackTrace();
			}

		} else if (uri.contains("Delete")) {
			try {
				String id = req.getParameter("id");
				dao.delete(id);
				req.setAttribute("message", "Xóa thành công");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				req.setAttribute("message", "Xóa thất bại");
				e.printStackTrace();
			}
		}
		req.setAttribute("form", video);
		req.setAttribute("videos", list);
		req.getRequestDispatcher("/views/Admin/VideoManagement.jsp").forward(req, resp);
	}
}

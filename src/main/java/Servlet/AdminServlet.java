package Servlet;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import bean.Report;
import bean.Share;
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
    EntityManager em = JpaUntils.getEntityManager();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("Admin")) {
			User us = (User) req.getSession().getAttribute("us");
			req.getSession().setAttribute("us", us);
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
		List<Video> title = daoVideo.findAll();
		req.setAttribute("titles", title);
	
		int page1 = 1;
	    int recordsPerPage = 6;
		// Report favoriteVideo
	    if(req.getParameter("page1") != null)
	        page1 = Integer.parseInt(req.getParameter("page1"));
	    	String jpql="Select new Report(o.video.title,count(o), max(o.likeDate), min(o.likeDate)) from Favorite o group by o.video.title";
	    	TypedQuery<Report> query = em.createQuery(jpql,Report.class);
	    	query.setFirstResult((page1-1) * recordsPerPage);
	    	query.setMaxResults(recordsPerPage);
	    	List<Report> listReport =query.getResultList();
	    	int noOf1Records = ((Number) em.createQuery(jpql).getResultList().size()).intValue();
		    int noOf1Pages = (int) Math.ceil(noOf1Records * 1.0 / recordsPerPage);
		    req.setAttribute("noOf1Pages", noOf1Pages);
		    req.setAttribute("current1Page", page1);
	    	req.setAttribute("reports", listReport);
	    	
		// Report Favortite User
		String idVideo = req.getParameter("idVideo");
		if (idVideo == null) { 				// Kiểm tra nếu giá trị bằng null
			idVideo = title.get(0).getId(); // Lấy giá trị đầu tiên trong trường hợp giá trị bị null
			reportFavoriteUser(idVideo, req, resp);
		    //Report send mail
			reportSendMail(idVideo, req, resp);
		} else {
			//Report Favorite User
			reportFavoriteUser(idVideo, req, resp);
			 //Report send mail
			reportSendMail(idVideo, req, resp);	
		}
		req.getRequestDispatcher("/views/Admin/Report.jsp").forward(req, resp);
	}

	private void doUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		User user = new User();
		UserDAO dao = new UserDAO();
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
		//Phan trang 
		int page = 1;
	    int recordsPerPage = 10;
	    if(req.getParameter("page") != null)
	        page = Integer.parseInt(req.getParameter("page"));
	    TypedQuery<User> query = em.createQuery("FROM User", User.class);
	    query.setFirstResult((page-1) * recordsPerPage);
	    query.setMaxResults(recordsPerPage);
	    List<User> list = query.getResultList();
	    
	    int noOfRecords = ((Number) em.createQuery("SELECT COUNT(o) FROM User o").getSingleResult()).intValue();
	    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
	    req.setAttribute("noOfPages", noOfPages);
	    req.setAttribute("currentPage", page);
		//
		req.setAttribute("form", user);
		req.setAttribute("users", list);
		req.getRequestDispatcher("/views/Admin/UserManagement.jsp").forward(req, resp);
	}

	private void doVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		Video video = new Video();
		VideoDAO dao = new VideoDAO();
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
		//phan trang
		int page =1;
		int recordsPerPage=10;
		if(req.getParameter("page")!=null)
			 page = Integer.parseInt(req.getParameter("page"));
		TypedQuery<Video> query = em.createQuery("from Video", Video.class);
		query.setFirstResult((page-1)*recordsPerPage);
		query.setMaxResults(recordsPerPage);
		List<Video> list = query.getResultList();
		
		int noOfRecords = ((Number) em.createQuery("select count(o) from Video o").getSingleResult()).intValue();
		int noOfPages = (int) Math.ceil( noOfRecords * 1.0 / recordsPerPage);
		//
		req.setAttribute("noOfPages", noOfPages);
	    req.setAttribute("currentPage", page);
		req.setAttribute("form", video);
		req.setAttribute("videos", list);
		req.getRequestDispatcher("/views/Admin/VideoManagement.jsp").forward(req, resp);
	}
	public void reportFavoriteUser(String idVideo,HttpServletRequest req, HttpServletResponse resp) {
		int page2 = 1;
	    int recordsPerPage2 = 10; 
		if(req.getParameter("page2") != null)
		page2 = Integer.parseInt(req.getParameter("page2"));
		StoredProcedureQuery query2 = em.createNamedStoredProcedureQuery("Report.favoritesUser");
		query2.setParameter("id",idVideo);
		List<Object[]> favoriteUser = query2.getResultList();
    	query2.setFirstResult((page2-1) * recordsPerPage2);
    	query2.setMaxResults(recordsPerPage2);
    	int noOf2Records = ((Number) query2.getResultList().size()).intValue();
	    int noOf2Pages = (int) Math.ceil(noOf2Records * 1.0 / recordsPerPage2);
	    req.setAttribute("noOf2Pages", noOf2Pages);
	    req.setAttribute("current2Page", page2);
	    req.setAttribute("favoriteUser", favoriteUser);
	}
	public void reportSendMail(String idVideo,HttpServletRequest req, HttpServletResponse resp) {
		int page3 = 1;
	    int recordsPerPage3 = 10; 
		if(req.getParameter("page3") != null)
			page3 = Integer.parseInt(req.getParameter("page3"));
		StoredProcedureQuery query3 = em.createNamedStoredProcedureQuery("Report.sendMail");
		query3.setParameter("id",idVideo);
		List<Object[]> listSend = query3.getResultList();
		query3.setFirstResult((page3-1) * recordsPerPage3);
    	query3.setMaxResults(recordsPerPage3);
    	int noOf3Records = ((Number)  query3.getResultList().size()).intValue();
	    int noOf3Pages = (int) Math.ceil(noOf3Records * 1.0 / recordsPerPage3);
	    req.setAttribute("noOf3Pages", noOf3Pages);
	    req.setAttribute("current3Page", page3);
	    req.setAttribute("listSend", listSend);
	}
}

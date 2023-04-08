package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import Filter.CookieUntils;
import bean.Favorite;
import bean.LikedVideo;
import bean.User;
import bean.Video;
import untils.FavoriteDAO;
import untils.UserDAO;
import untils.VideoDAO;
import untils.likedVideoDAO;

@WebServlet({ "/home", "/login", "/login/OK", "/login/forgot", "/signup", "/sign-out", "/forgot", "/edit-profile",
		"/detail", "/ChangePass", "/likedVideo" })
public class home extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("home")) {
			this.doHome(req, resp);
		} else if (uri.contains("login")) {
			this.doSignIn(req, resp);
		} else if (uri.contains("signup")) {
			this.doSignUp(req, resp);
		} else if (uri.contains("edit-profile")) {
			this.doEditProfile(req, resp);
		} else if (uri.contains("detail")) {
			this.doDetail(req, resp);
		} else if (uri.contains("sign-out")) {
			this.doSignOut(req, resp);
		} else if (uri.contains("ChangePass")) {
			this.doChangePass(req, resp);
		} else if (uri.contains("likedVideo")) {
			this.doLikedVideo(req, resp);
		}
	}

	private void doLikedVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		likedVideoDAO daoLV = new likedVideoDAO();
		User us = (User) req.getSession().getAttribute("us");
		List<LikedVideo> list = daoLV.likedVideo(us.getId());
		req.setAttribute("list", list);
		String idVideo = req.getParameter("idVideo");
		if (idVideo != null) {
			unLike(us.getId(), idVideo);
			req.getSession().setAttribute("us",us);
		}
		req.getRequestDispatcher("views/User/LikedVideo.jsp").forward(req, resp);
	}

	private void doHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		User us = (User) req.getSession().getAttribute("us");
		VideoDAO dao = new VideoDAO();
		List<Video> list = dao.orderByViews();
		req.setAttribute("homes", list);
		String idVideo=req.getParameter("idVideo");
		String shareID=req.getParameter("shareID");
		if(idVideo!=null) {
			like(us, idVideo, req, resp);
		}
		if (shareID!=null) {
			share(us.getId(), req.getParameter("share"), shareID, req, resp);
		}
		req.getRequestDispatcher("/views/User/layout.jsp").forward(req, resp);
	}

	private void doChangePass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User us = (User) req.getSession().getAttribute("us");
		String method = req.getMethod();
		UserDAO dao = new UserDAO();
		if (method.equalsIgnoreCase("POST")) {
			String crPass = req.getParameter("password");
			if (!crPass.equals(us.getPassword())) {
				req.setAttribute("message", "Sai mật khẩu");
			} else {
				if (!req.getParameter("newPass").equals(req.getParameter("cfPass"))) {
					req.setAttribute("message", "Sai mật khẩu mới và mật khẩu xác nhận không đúng");
				} else {
					us.setPassword(req.getParameter("newPass"));
					dao.update(us);
					req.setAttribute("message", "Cập nhật mật khẩu thành công");
				}
			}
		}
		req.getRequestDispatcher("/views/User/ChangePass.jsp").forward(req, resp);
	}

	private void doSignOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().setAttribute("us", null);
		req.getRequestDispatcher("/views/User/Login.jsp").forward(req, resp);
	}

	private void doDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User us = (User) req.getSession().getAttribute("us");
		String itemId = req.getParameter("id");
		VideoDAO dao = new VideoDAO();
		Video video = dao.findByMainKey(itemId);
		video.setViews(video.getViews() + 1);
		String like=req.getParameter("like");
		String dislike=req.getParameter("dislike");
		if(like!=null && us!=null) {
			like(us, like, req, resp);
		}if(dislike!=null && us!=null) {
			unLike(us.getId(), dislike);
		}
		req.setAttribute("random", dao.randomVideo());
		req.setAttribute("form", dao.findByMainKey(itemId));
		req.getRequestDispatcher("/views/User/detail.jsp").forward(req, resp);
	}

	private void doEditProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User us = (User) req.getSession().getAttribute("us");
		UserDAO dao = new UserDAO();
		System.out.println(us.getId());
		try {
			BeanUtils.populate(us, req.getParameterMap());
			dao.update(us);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		req.getRequestDispatcher("/views/User/EditProfile.jsp").forward(req, resp);
	}

	private void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			UserDAO dao = new UserDAO();
			User user = new User();
			try {
				BeanUtils.populate(user, req.getParameterMap());
				dao.create(user);
				req.setAttribute("message", "Đăng ký thành công");
			} catch (IllegalAccessException | InvocationTargetException e) {
				req.setAttribute("message", "Đăng ký thất bại");
				e.printStackTrace();
			}
		}
		req.getRequestDispatcher("/views/User/SignUp.jsp").forward(req, resp);

	}

	private void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		UserDAO dao = new UserDAO();
		String method = req.getMethod();
		if (uri.contains("OK")) {
			if (method.equalsIgnoreCase("POST")) {
				String id = req.getParameter("id");
				String pw = req.getParameter("password");
				String remember = req.getParameter("remember");
				try {
					User us = dao.findByMainKey(id);
					if (!us.getPassword().equals(pw)) {
						req.setAttribute("message", "Sai mật khẩu!");
					} else {
						req.setAttribute("message", "Đăng nhập thành công!");
						if (!us.getAdmin()) {
							req.getSession().setAttribute("us", us);
							req.getRequestDispatcher("/views/User/layout.jsp").forward(req, resp);
						} else {
							req.getSession().setAttribute("us", us);
							req.getRequestDispatcher("/views/Admin/LayoutAdmin.jsp").forward(req, resp);
						}
					}
				} catch (Exception e) {
					req.setAttribute("message", "Sai tên đăng nhập!");
				}
				int hours = (remember == null) ? 0 : 30 * 24;
				CookieUntils.add("id", id, hours, resp);
				CookieUntils.add("password", pw, hours, resp);
				req.getRequestDispatcher("/views/User/Login.jsp").forward(req, resp);
			}
		} else if (uri.contains("forgot")) {
			// Thong so ket noi SMTP Server
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", "587");
			properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
			Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					String username = "baonvps24728@fpt.edu.vn";
					String password = "qhqaxkshdpxlqdlf";

					return new PasswordAuthentication(username, password);
				}
			});
			String usernameID = req.getParameter("usernameID");
			String emailID = req.getParameter("emailID");
			User us = dao.findByMainKey(usernameID);
			System.out.println(us.getPassword());
			if (!us.getEmail().equals(emailID)) {
				req.setAttribute("message2", "Sai email!");
			} else {
				req.setCharacterEncoding("utf-8");
				resp.setCharacterEncoding("utf-8");
				try {
					// Ket noi SMTP Server
					String from, to, subject, body;
					from = "baonvps24728@fpt.edu.vn";
					to = emailID;
					subject = "Đây là mật khẩu của bạn";
					body = us.getPassword();
					// Tao message
					MimeMessage msg = new MimeMessage(session);
					msg.setFrom(new InternetAddress(from));
					msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
					msg.setSubject(subject, "utf-8");
					msg.setText(body, "utf-8", "html");
					msg.setReplyTo(msg.getFrom());

					Transport.send(msg);
					req.setAttribute("message2", "Gửi email thành công !");
				} catch (Exception e) {
					req.setAttribute("message2", "Gửi email thất bại !");
					e.printStackTrace();
				}
			}
		}
		req.getRequestDispatcher("/views/User/Login.jsp").forward(req, resp);
	}

	public static void share(String from, String to, String videoID, HttpServletRequest req, HttpServletResponse resp)
			throws UnsupportedEncodingException {
		// Thong so ket noi SMTP Server
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				String username = "baonvps24728@fpt.edu.vn";
				String password = "qhqaxkshdpxlqdlf";

				return new PasswordAuthentication(username, password);
			}
		});
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String[] toArr = to.split("\\s+");
		try {
			// Ket noi SMTP Server
			String subject, body;
			subject = "Đây là mật khẩu của bạn";
			body = "youtube.com/watch?v=" + videoID;
			// Tao message
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from));
			for (String recipient : toArr) {
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			}
			msg.setSubject(subject, "utf-8");
			msg.setText(body, "utf-8", "html");
			msg.setReplyTo(msg.getFrom());
			Transport.send(msg);
			req.setAttribute("message2", "Gửi email thành công !");
		} catch (Exception e) {
			req.setAttribute("message2", "Gửi email thất bại !");
			e.printStackTrace();
		}

	}

	public static void like(User us, String idVideo, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		FavoriteDAO dao = new FavoriteDAO();
		VideoDAO daoVideo = new VideoDAO();
		if(dao.findByMainKey(us.getId(),idVideo) ==null) {
			Favorite entity = new Favorite();
			entity.setUser(us);
			entity.setLikeDate(new Date());
			entity.setVideo(daoVideo.findByMainKey(idVideo));
			dao.create(entity);
			alert("Video được chuyển vào video yêu thích <3", req, resp);
		}else {
			alert("Bạn đã thích video này rồi đó <3", req, resp);
		}
	}

	public static void unLike(String id, String idVideo) {
		FavoriteDAO dao = new FavoriteDAO();
		dao.delete(id,idVideo);
	}

	public static void alert(String desciption, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Thông báo</title>");
		out.println("<script>");
		out.println("alert(desciption);");
		out.println("</script>");
		out.println("</head>");
		out.println("<body>");
		out.println("</body>");
		out.println("</html>");
	}
}

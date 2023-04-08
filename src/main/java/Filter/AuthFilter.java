package Filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;


//@WebFilter({"/forgot-pass", "/edit-profile","/ChangePass","/Admin", "/User/*", "/Video/*", "/Report"})
public class AuthFilter implements HttpFilter {
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String uri=req.getRequestURI();
		User us = (User)req.getSession().getAttribute("us");
		String error="";
		if(us==null) {
			error = resp.encodeURL("Vui long dang nhap");
		}else if (!us.getAdmin() && uri.contains("/Admin")&& uri.contains("/Report")&& uri.contains("/User/*")&& uri.contains("/Video/*")) {
			error = resp.encodeURL("Vui long dang nhap voi vai tro admin");
		}
		
		if(!error.isEmpty()) {
			req.getSession().setAttribute("securi", uri);
			resp.sendRedirect("/PS24728_NguyenVanBao_ASM/views/User/Login.jsp?error="+resp.encodeURL(error));
		}else {
			chain.doFilter(req, resp);
		}
	}
}

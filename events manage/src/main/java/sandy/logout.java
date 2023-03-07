package sandy;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class logout
 */
public class logout extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 999L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session=request.getSession();	
	session.removeAttribute("username");
	session.removeAttribute("org_id");
	session.invalidate();
	response.sendRedirect("login.jsp");
	
	
	}

	

}

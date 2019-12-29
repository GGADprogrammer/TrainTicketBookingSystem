package dp.svlt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dp.utils.DbConn;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class CkVipSvlt
 */
public class CkVipSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CkVipSvlt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		Object userid =session.getAttribute("userid");
		JSONObject json=new JSONObject();
		if(userid==null){
			json.put("msg", "请登录.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else{

				DbConn db = null;
				db = new DbConn();
				int level=db.getLevel(userid);
				if(level==0) {
					request.setAttribute("vip", "普通用户");
				}
				else if(level==1){
					request.setAttribute("vip", "黄金会员");
				}
				else if(level==2){
					request.setAttribute("vip", "白金会员");
				}
				request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

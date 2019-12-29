package dp.svlt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dp.utils.DbConn;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class RegMember
 */
public class RegMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		Object userid =session.getAttribute("userid");
		String level=request.getParameter("level");
		JSONObject json=new JSONObject();
		if(userid==null){
			json.put("msg", "请登录.");
		}else{

				DbConn db = null;
				db = new DbConn();
				String sql1="insert into vip(id,vipLevel) values ("+userid+","+level+")";
				String sql2="update vip set vipLevel=2 where id="+userid;
				if(level.equals("1")) {
					boolean bl=db.insort(sql1);
					if(!bl){
						json.put("msg", 1);
							session.setAttribute("vip", "黄金会员");	
					}else{
						json.put("msg", "error:02");
					}
				}
				else {
					int row=db.deleteOrUpdate(sql2);
					if(row>0) {
						json.put("msg", 1);
						session.setAttribute("vip", "白金会员");	
					}
				}

		}
		PrintWriter out=response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
	}
}

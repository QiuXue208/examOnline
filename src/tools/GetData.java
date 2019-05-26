package tools;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetData
 */
@WebServlet("/GetData")
public class GetData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetData() {
        super();
       
        // TODO Auto-generated constructor stub
    }
    public int [] getData(HttpServletRequest request) {
    	 int [] array = new int[4];
    	 int grade = Integer.parseInt(request.getParameter("grade"));
    	 int classes = Integer.parseInt(request.getParameter("classes"));
    	 int scoreMin = Integer.parseInt(request.getParameter("min"));
    	 int scoreMax = Integer.parseInt(request.getParameter("max"));
    	 array[0] = grade;
    	 array[1] = classes;
    	 array[2] = scoreMin;
    	 array[3] = scoreMax;
    	 return array;
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

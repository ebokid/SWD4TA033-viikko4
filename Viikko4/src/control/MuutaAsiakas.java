package control;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asiakas;
import model.dao.Dao;

@WebServlet("/muutaasiakas")
public class MuutaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
          
    public MuutaAsiakas() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MuutaAsiakas.doGet()");
		String asiakasIdStr = request.getParameter("id");
		System.out.println("Get asiakas with id: " + asiakasIdStr);
		int asiakas_id = Integer.parseInt(asiakasIdStr);
		Dao dao = new Dao();
		Asiakas asiakas = dao.etsiAsiakas(asiakas_id);
		request.setAttribute("asiakas", asiakas);			
		String jsp = "/muutaasiakas.jsp"; 
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MuutaAsiakas.doPost()");
		Asiakas asiakas = new Asiakas();
		int asiakas_id = Integer.parseInt(request.getParameter("asiakas_id"));
		asiakas.setEtunimi(request.getParameter("etunimi"));
		asiakas.setSukunimi(request.getParameter("sukunimi"));
		asiakas.setPuhelin(request.getParameter("puhelin"));
		asiakas.setSposti(request.getParameter("sposti"));
		Dao dao = new Dao();
		dao.muutaAsiakas(asiakas, asiakas_id);
		response.sendRedirect("haeasiakkaat?hakusana=" + asiakas_id);
	}


}

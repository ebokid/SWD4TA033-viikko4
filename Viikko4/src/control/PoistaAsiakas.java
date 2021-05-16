package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.Dao;


@WebServlet("/poistaasiakas")
public class PoistaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PoistaAsiakas() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PoistaAsiakas.doGet()");
		String asiakas_id = request.getParameter("asiakas_id");
		Dao dao = new Dao();
		dao.poistaAsiakas(Integer.parseInt(asiakas_id));
		response.sendRedirect("haeasiakkaat?hakusana=");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

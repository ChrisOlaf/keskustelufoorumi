import fi.academy.papu.Viesti;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "Keskustelut", urlPatterns = "/Keskustelut")
public class Keskustelut extends HttpServlet {
    @Resource(name = "jdbc/FoorumiDB")
    DataSource ds;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int aluenro = Integer.parseInt(request.getParameter("value"));
        response.setContentType("text/html");
        HttpSession istunto = request.getSession(true);
        Viesti viestit = new Viesti();
        Aiheet aiheet = new Aiheet();
        try (Connection con = ds.getConnection()) {
            istunto.setAttribute("viestiLista", KeskustelutDB.viestiListaus(con, aluenro));
            istunto.setAttribute("otsikkoLista",KeskustelutDB.aiheetListaus(con,aluenro));
        } catch (SQLException e) {
            e.printStackTrace();
            istunto.setAttribute("virheviesti", e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("virhe.jsp");
            disp.forward(request, response);
            return;
        }
        istunto.setAttribute("aiheet",aiheet);
        istunto.setAttribute("viestit",viestit );
        RequestDispatcher disp = request.getRequestDispatcher("Aihealue.jsp");
        disp.forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
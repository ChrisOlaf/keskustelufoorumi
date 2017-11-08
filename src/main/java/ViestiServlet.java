import fi.academy.dbo.ViestiDBO;
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

@WebServlet(name = "ViestiServlet", urlPatterns = "/viesti")
public class ViestiServlet extends HttpServlet {

    @Resource(name = "jdbc/foorumiDB")
    DataSource ds;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession istunto = request.getSession(true);
        ViestiDBO lista = new ViestiDBO();
        Integer viestiID = Integer.getInteger(request.getParameter("viestiID"));
        viestiID = 1;
        if (viestiID != null) {
            try (Connection con = ds.getConnection()) {
                ViestiDBO.viestiListaus(con, viestiID);
                istunto.setAttribute("viestiLista", lista);
                request.getRequestDispatcher("viestisivu.jsp").forward(request, response);
            }
            catch (SQLException e) {
                e.printStackTrace();
                istunto.setAttribute("virheviesti", e.getMessage());
                RequestDispatcher disp = request.getRequestDispatcher("virhesivu.jsp");
                disp.forward(request, response);
                return;
            }
        }
    }

//    public class HenkiloServlet extends HttpServlet {
//        HenkiloLista lista = new HenkiloLista();
//
//        protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            request.setAttribute("uusiNimi", lista);
//            request.getRequestDispatcher("hlolista.jsp").
//                    forward(request, response);
//        }
//    }

//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
}

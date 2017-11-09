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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UusiViestiServlet", urlPatterns = "/uusiviesti")
public class UusiViestiServlet extends HttpServlet {

    @Resource(name = "jdbc/FoorumiDB")
    DataSource ds;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession istunto = request.getSession();
//        String knimi = (String) istunto.getAttribute("knimi");
//        int kirjoittaja = 0;
//
//        try (Connection con = ds.getConnection()) {
//            String sql = ("SELECT hloid FROM henkilo " +
//                    "WHERE henkilo.nimimerkki = ?");
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, knimi);
//            ResultSet rs = ps.executeQuery();
//            kirjoittaja = rs.getInt("hloid");
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

        Viesti uusiviesti = new Viesti();
        String otsikko = request.getParameter("uusiotsikko");
        String viesti = request.getParameter("uusiviesti");
        int alueID = Integer.parseInt(request.getParameter("alueid"));
        int viestiID = Integer.parseInt(request.getParameter("viestiid"));
        int kirjoittaja = Integer.parseInt(request.getParameter("hloid"));

        uusiviesti.setOtsikko(otsikko);
        uusiviesti.setViesti(viesti);
        uusiviesti.setHloID(kirjoittaja);
        uusiviesti.setAlueID(alueID);
        uusiviesti.setVastausID(viestiID);

        try (Connection con = ds.getConnection()) {
            ViestiDBO.lisaaViesti(con, uusiviesti);
        } catch (SQLException e) {
            e.printStackTrace();
            istunto.setAttribute("virheviesti", e.getMessage());
            request.getRequestDispatcher("virhe.jsp").forward(request, response);
            return;
        }
        String paluu = (String) istunto.getAttribute("paluuosoite");
        request.getRequestDispatcher(paluu).include(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

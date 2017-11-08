import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "HakuServlet", urlPatterns = {"/HakuServlet"})
public class HakuServlet extends HttpServlet {
    @Resource(name = "jdbc/FoorumiDB")
    DataSource ds;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String hakusana = request.getParameter("hakusana");

        if (otsikonSanat().contains(hakusana)) {
            out.println("Tässä hakusanallasi löytyvät viestit:");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public ArrayList<String> otsikonSanat() {
        ArrayList<String> otsikonSanat = new ArrayList<>();
        try (Connection yhteys = ds.getConnection()) {
            String sql = "SELECT otsikko FROM viesti";
            PreparedStatement ps = yhteys.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String sana = rs.getString("otsikko");
                otsikonSanat.add(sana);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return otsikonSanat;
    }

}

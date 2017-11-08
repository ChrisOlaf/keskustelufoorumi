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

@WebServlet(name = "Keskustelut", urlPatterns = "/Keskustelut")
public class Keskustelut extends HttpServlet {
    @Resource(name = "jdbc/FoorumiDB")
    DataSource ds;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        StringBuilder sb = new StringBuilder();
        String linkki = request.getParameter("?alue");

        try (Connection con = ds.getConnection()) {
            String sql = "SELECT otsikko from viesti";
            PreparedStatement ps = con.prepareStatement(sql);
            //ps.setString(1, linkki + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                sb.append(rs.getString(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Hei maailma -servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p>" + sb + "</p>");
            out.println("</body>");
            out.println("</html>");
        }

    }

}


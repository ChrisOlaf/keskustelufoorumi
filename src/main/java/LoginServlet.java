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
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    @Resource(name = "jdbc/FoorumiDB")
    DataSource ds;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        request.getRequestDispatcher("link.html").include(request, response);

        String knimi = request.getParameter("kayttajanimi");
        String salasana = request.getParameter("salasana");

        if(autentikoi(knimi, salasana)){
            out.print("Tervetuloa, " + knimi + "!");
            HttpSession session = request.getSession();
            session.setAttribute("knimi", knimi);
            request.getRequestDispatcher("index.jsp").include(request, response);
           // rd.forward(request, response);
        }else{
            out.print("Väärä käyttäjänimi tai salasana!");
            request.getRequestDispatcher("index.jsp").include(request, response);
        }
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public boolean autentikoi(String knimi, String salasana){
        boolean status = false;

        try(Connection con= ds.getConnection()){
            String sql = ("SELECT henkilo.nimimerkki, salasana.salasana FROM henkilo " +
                    "JOIN salasana ON henkilo.hloid = salasana.kayttaja " +
                    "WHERE henkilo.nimimerkki = ? AND salasana.salasana = ?");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, knimi);
            ps.setString(2, salasana);

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }
}

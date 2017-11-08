import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String knimi = request.getParameter("kayttajanimi");
        String salasana = request.getParameter("salasana");

        if(Autentikointi.autentikoi(knimi, salasana)){
            //RequestDispatcher rd = request.getRequestDispatcher("servlet2");
            out.print("Tervetuloa, " + knimi);
            HttpSession session = request.getSession();
            session.setAttribute("knimi", knimi);
        }else{
            out.print("Väärä käyttäjänimi tai salasana!");
            request.getRequestDispatcher("kirjautumissivu.jsp").include(request, response);
        }
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

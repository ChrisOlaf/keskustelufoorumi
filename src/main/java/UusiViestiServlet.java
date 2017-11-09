import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UusiViestiServlet")
public class UusiViestiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viesti = request.getParameter("uusiviesti");
        String kirjoittaja = request.getParameter("knimi");
int alueID = Integer.parseInt(request.getParameter("alueid"));
Integer viestiID = Integer.parseInt(request.getParameter("viestiid"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProfiiliServlet", urlPatterns = {"/ProfiiliServlet"})
public class ProfiiliServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();

        HttpSession session=request.getSession(false);
        if(session.getAttribute("knimi")!=null){
            request.getRequestDispatcher("profiilisivu.jsp").include(request, response);
        }
        else{
            out.print("Kirjaudu ensin sisään!");
            request.getRequestDispatcher("index.jsp").include(request, response);
        }
        out.close();
    }
}

import java.sql.*;
import java.util.List;

public class Autentikointi {
    public static boolean autentikoi(String knimi, String salasana){
        boolean status = false;
        String url = "jdbc:mysql://localhost:3306/foorumi?useSSL=false";

        try(Connection con= DriverManager.getConnection(url,
                    "root", "adminadmin")) {
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

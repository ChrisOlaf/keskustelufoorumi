import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

public class Autentikointi {
//    @Resource(name = "jdbc/FoorumiDB")
//    public static DataSource ds;
//
//    public static boolean autentikoi(String knimi, String salasana){
//        boolean status = false;
//
//        try(Connection con= ds.getConnection()){
//            String sql = ("SELECT henkilo.nimimerkki, salasana.salasana FROM henkilo " +
//                    "JOIN salasana ON henkilo.hloid = salasana.kayttaja " +
//                    "WHERE henkilo.nimimerkki = ? AND salasana.salasana = ?");
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, knimi);
//            ps.setString(2, salasana);
//
//            ResultSet rs = ps.executeQuery();
//            status = rs.next();
//
//        } catch (SQLException e) {
//                e.printStackTrace();
//        }
//
//        return status;
//    }
}

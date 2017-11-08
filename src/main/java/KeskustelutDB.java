import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class KeskustelutDB {
    public static List<Viestit> viestiListaus(Connection con) throws SQLException {
        String sql = "select * from viesti join henkilo on viesti.kirjoittaja = henkilo.hloid where alueid = 1";
        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();
        List<Viestit> viestit = new ArrayList<>();
        while (rs.next()) {
            Viestit v = new Viestit();
            v.setOtsikko(rs.getString("otsikko"));
            v.setNimimerkki(rs.getString("nimimerkki"));
            v.setKirjoitettu(rs.getDate("kirjoitettu"));
            viestit.add(v);
        }
        return viestit;
    }
}
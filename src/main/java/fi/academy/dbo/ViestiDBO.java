package fi.academy.dbo;

import fi.academy.papu.Viesti;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ViestiDBO{
    public static List<Viesti> viestiListaus(Connection con, int viestiID) throws SQLException {
        String sql = "SELECT viesti.id, viesti.alueid, viesti.otsikko, henkilo.nimimerkki, viesti.kirjoitettu, henkilo.hloid, viesti.viesti, viesti.vastaus FROM viesti JOIN henkilo ON viesti.kirjoittaja = henkilo.hloid WHERE viesti.id = (?) OR viesti.vastaus = (?) ORDER BY viesti.id";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, viestiID);
        ps.setInt(2, viestiID);
        ResultSet rs = ps.executeQuery();
        List<Viesti> viestit = new ArrayList<>();
        while(rs.next()) {
            Viesti v = new Viesti();
            v.setViestiID(rs.getInt("id"));
            v.setAlueID(rs.getInt("alueid"));
            v.setOtsikko(rs.getString("otsikko"));
            v.setNimimerkki(rs.getString("nimimerkki"));
            v.setHloID(rs.getInt("hloid"));
            v.setAjankohta(rs.getString("kirjoitettu"));
            v.setViesti(rs.getString("viesti"));
            v.setVastausID(rs.getInt("vastaus"));
            viestit.add(v);
        }
        return viestit;
    }

    public static void lisaaViesti(Connection connection, Viesti viesti) throws SQLException {
        String sql = "INSERT INTO viesti(kirjoittaja, otsikko, viesti, alueid, vastaus, ) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, viesti.getHloID());
        ps.setString(2, viesti.getOtsikko());
        ps.setString(3, viesti.getViesti());
        ps.setInt(4, viesti.getAlueID());
        ps.setInt(5, viesti.getVastausID());
        ps.execute();
//        ResultSet rs = ps.getGeneratedKeys();
//        if(rs.next()) {
//            int id = rs.getInt(1);
//            henkilo.setId(id);
//        }
    }
}
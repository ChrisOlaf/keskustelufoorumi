import java.util.Date;

public class Viestit {
    private String otsikko;
    private String nimimerkki;
    private Date kirjoitettu;

    public Viestit() {
        this.otsikko = otsikko;
        this.nimimerkki = nimimerkki;
        this.kirjoitettu = kirjoitettu;
    }

    public String getOtsikko() {
        return otsikko;
    }

    public void setOtsikko(String otsikko) {
        this.otsikko = otsikko;
    }

    public String getNimimerkki() {
        return nimimerkki;
    }

    public void setNimimerkki(String nimimerkki) {
        this.nimimerkki = nimimerkki;
    }

    public Date getKirjoitettu() {
        return kirjoitettu;
    }

    public void setKirjoitettu(Date kirjoitettu) {
        this.kirjoitettu = kirjoitettu;
    }
}

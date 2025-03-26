
import java.time.LocalDate;
import java.util.List;

public class NovaEncomenda {

    private String cliente;

    private String nFiscal;

    private String morada;

    private Integer numeroEncomenda;

    private LocalDate data;

    private List<LinhaEncomenda> orderline;

    public NovaEncomenda() {
        this.cliente = null;
        this.nFiscal = null;
        this.morada = null;
        this.numeroEncomenda = -1;
        this.orderline = null;
    }

    public NovaEncomenda(String cliente, String nFiscal, String morada, Integer numeroEncomenda, LocalDate data, List<LinhaEncomenda> orderline) {
        this.cliente = cliente;
        this.nFiscal = nFiscal;
        this.morada = morada;
        this.numeroEncomenda = numeroEncomenda;
        this.data = data;
        this.orderline = orderline;
    }

    // Getters and setters for all fields
    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getNFiscal() {
        return nFiscal;
    }

    public void setNFiscal(String nFiscal) {
        this.nFiscal = nFiscal;
    }

    public String getMorada() {
        return morada;
    }

    public void setMorada(String morada) {
        this.morada = morada;
    }

    public Integer getNumeroEncomenda() {
        return numeroEncomenda;
    }

    public void setNumeroEncomenda(Integer numeroEncomenda) {
        this.numeroEncomenda = numeroEncomenda;
    }

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public List<LinhaEncomenda> getOrderline() {
        return orderline;
    }

    public void setOrderline(List<LinhaEncomenda> orderline) {
        this.orderline = orderline;
    }
}

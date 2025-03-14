
import java.time.LocalDateTime;

public class Order {

    private String client;
    private String vat;
    private String address;
    private int orderNumber;
    private LocalDateTime date;

    // To do




    

    //
    public Order() {
        this.date = LocalDateTime.now();
    }

    // Construtor com parâmetros
    public Order(String client, String vat, String address, int otherNumber, LocalDateTime date) {
        this.client = client;
        this.vat = vat;
        this.address = address;
        this.orderNumber = otherNumber;
        this.date = date;
    }
    // Getters
    public String getClient() {
        return this.client;
    }

    public String getVat() {
        return this.vat;
    }

    public String getAddress() {
        return this.address;
    }

    public int getOrderNumber() {
        return this.orderNumber;
    }

    public LocalDateTime getDate() {
        return this.date;
    }

    // Setters
    public void setClient(String client) {
        this.client = client;
    }

    public void setVat(String vat) {
        this.vat = vat;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String toString() {
        return "Order{" +
                "client='" + client + '\'' +
                ", vat='" + vat + '\'' +
                ", address='" + address + '\'' +
                ", otherNumber=" + orderNumber +
                ", date=" + date +
                '}';
    }

    public Order clone() {
        try {
            Order cloned = (Order) super.clone();
            cloned.date = LocalDateTime.of(date.toLocalDate(), date.toLocalTime()); // Clonando LocalDateTime
            return cloned;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException("Erro ao clonar o objeto Order", e);
        }
    }
}
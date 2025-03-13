// diagrama
// 
// de classes:
// Other line 
// -ref:string✓
// -desc:string✓
// -price :double✓
// -quant:integer✓
// -tax:double✓
// -disc :double✓
// ___________________________________________________
// +calculatevalueotherlinen():double✓
// +calculatediscvalue():double✓
// +tostring():string✓
// +equals(o:obkect):boolean✓
// +clone():otherline✓
// +getters...✓
// +setters... ✓
// +orderline():orderline✓
// +oderline(r,d,p,q,t,dis):orderline✓
// +otherline(other:ordeline):orderline✓
//  /\
//   |
//   | -orderlines
//   |      1...*
//   |
//   |
//   |
//   |
//   |
//   |
//   |
//   |
//  quadrado pintado
// order
// -client:string✓
// -vat:string✓
// -address:string ✓
// -othernumebr:integer✓
// date:localdatatime✓
// __________________________________________
// +getters... ✓
// +setters.... ✓
// +calculateOrderValue():double
// +calculatedisc():double
// +calculateTotalProducts():int
// +existsProduct(ref:string):boolean
// +addOrderline(line:orderline)
// +removeProduto(ref:string)

public class OrderLine {

    //var
    private String ref;
    private String desc;
    private double price;
    private int quant;
    private double tax;
    private double disc;

    //To do..
    public double calculateValueOrderline() {
        double total= (this.price*this.quant*this.disc)*(this.tax);
        return total;
    }
    public double calculateDiscountValue() {
        double discontado= (this.price * this.quant) * (this.disc / 100);
        return discontado;
    }

    //getters setter..
    public OrderLine() {
        this.ref = "";
        this.desc = "";
        this.price = 0.0;
        this.quant = 0;
        this.tax = 0.0;
        this.disc = 0.0;
    }

    public OrderLine(String ref, String desc, double price, int quant, double tax, double disc) {
        this.ref = ref;
        this.desc = desc;
        this.price = price;
        this.quant = quant;
        this.tax = tax;
        this.disc = disc;
    }

    public OrderLine(OrderLine other) {
        this.ref = other.ref;
        this.desc = other.desc;
        this.price = other.price;
        this.quant = other.quant;
        this.tax = other.tax;
        this.disc = other.disc;
    }

    // Getters
    public String getReference() {
        return this.ref;
    }

    public String getDescription() {
        return this.desc;
    }

    public double getPrice() {
        return this.price;
    }

    public int getQuantity() {
        return this.quant;
    }

    public double getTax() {
        return this.tax;
    }

    public double getdisc() {
        return this.disc;
    }

    // Setters
    public void setReference(String ref) {
        this.ref = ref;
    }

    public void setDescription(String desc) {
        this.desc = desc;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quant) {
        this.quant = quant;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    public void setdisc(double disc) {
        this.disc = disc;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if ((o == null) || this.getClass() != o.getClass()) {
            return false;
        }
        OrderLine c = (OrderLine) o;

        return this.ref.equals(c.ref) && this.desc.equals(c.desc) && this.price == c.price && this.quant == c.quant && this.tax == c.tax && this.disc == c.disc;
    }

    public String toString() {
        return "OtherLine{"
                + "ref='" + this.ref + '\''
                + ", desc='" + this.desc + '\''
                + ", price=" + this.price
                + ", quant=" + this.quant
                + ", tax=" + this.tax
                + ", disc=" + this.disc
                + '}';
    }

    public OrderLine clone() {
        return new OrderLine(this);
    }

}

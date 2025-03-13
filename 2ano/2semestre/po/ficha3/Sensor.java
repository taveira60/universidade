
public class Sensor {
    private double valor;

    // Comportamento
    public Sensor(double valor) {
        this.setValor(valor);
    }

    public boolean setPressao(double valor) {
        if (valor < 0)
            return false;
        else
            return true;
    }

    public double getPressao() {
        return this.valor;
    }

    // Defaults
    public Sensor() {
        this.valor = 0;
    }

    public Sensor(Sensor other) {
        this.valor = other.valor;
    }

    public double getValor() {
        return this.valor;
    }

    public void setValor(double valor) {
        if (setPressao(valor)) {
            this.valor = valor;
        }
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;

        if ((o == null) || this.getClass() != o.getClass())
            return false;

        Sensor s = (Sensor) o;

        return this.valor == s.valor;
    }

    public String toString() {
        return "A presão é de: " + this.valor;
    }

    public Sensor clone() {
        return new Sensor(this);
    }
}

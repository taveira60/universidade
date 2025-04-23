public class LampadaLED extends Lampada {

    private int potencia;
    private int lumem;

    public LampadaLED() {
        super();
        this.potencia = 0;
        this.lumem = 0;
    }

    public LampadaLED(Modo x, double cpsE, double cpsO, double cT, double pC, int potencia, int lumem) {
        super(x, cpsE, cpsO, cT, pC);
        this.potencia = potencia;
        this.lumem = lumem;
    }

    public LampadaLED(LampadaLED led) {
        super(led);
        this.potencia = led.getPotencia();
        this.lumem = led.getLumem();
    }

    public void setPotencia(int potencia) {
        this.potencia = potencia;
    }

    public int getPotencia() {
        return this.potencia;
    }

    public void setLumem(int lumem) {
        this.lumem = lumem;
    }

    public int getLumem() {
        return this.lumem;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder(super.toString());
        sb.append("\nPotência: ").append(this.potencia);
        sb.append("\nLumem: ").append(this.lumem);
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o == null || o.getClass() != this.getClass()) {
            return false;
        }
        LampadaLED led = (LampadaLED) o;
        return super.equals(led)
                && this.potencia == led.potencia
                && this.lumem == led.lumem;
    }
    
    @Override
    public LampadaLED clone() {
        return new LampadaLED(this);
    }
}

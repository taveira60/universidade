import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Ficha2Ex2 {

    private LocalDate[] datas;
    private int tamanho;
    private int ocupacao = 0;

    public Ficha2Ex2(int tamanho) {
        this.datas = new LocalDate[tamanho];
        this.tamanho = tamanho;

    }

    public void insereData(Localdata data) {
        this.datas[ocupacao++] = data;
    }

    public Localdata dataMaisProxima(Localdata data) {
        long dist = Integer.MAX_VALUE, d;
        Localdate maisproxima = null;

        for (int i = 0; i < ocupacao; i++) {
            d = Math.abs(ChronoUnit.DAYS.between(this.datas[i], data));
            System.out.println(d);
            if (dist < d) {
                dist = d;
                maisproxima = this.datas[i];
            }
        }
        return maisproxima;
    }

    public String toString(){
        String datas = "Datas:\n";
        LocalDate data;
        for(int i = 0;i<this.ocupacao;i++){
            data=this.datas[i]
            datas=datas.concat(String.valueOf(data));
            datas=datas.concat("\n");
        }
        return datas;

    }

}

import java.util.Arrays;

@SuppressWarnings("unused")

public class Main {
    public static void main(String[] args) {
        int[] lista = {10, 4, 5, 6, 12, 20, 1, 19};
        //System.out.println(Ficha1Ex1.diaDaSemana(27, 1, 2010));
        //int[] classificacoes = Ficha1Ex1.classificacoes(lista, 8);
        //System.out.println("Classificações: " + Arrays.toString(classificacoes));
        int[] temperaturas = {15, 20, 25, 30, 35, 40};
        int[] resultados = Ficha1Ex1.mediaTemps(temperaturas, temperaturas.length);
        System.out.println("Média de temperaturas: " + resultados[0]);
        System.out.println("Maior diferença entre dias consecutivos: " + resultados[2]);
        System.out.println("Dia com a maior diferença: " + resultados[1]);
    }
}

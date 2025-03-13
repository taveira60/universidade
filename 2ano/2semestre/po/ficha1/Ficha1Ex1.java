import java.util.Scanner;

public class Ficha1Ex1 {
    public static String diaDaSemana(int dia, int mes, int ano) {
        int diaSemana = ((ano - 1900) * 365) + (ano - 1900) / 4;
        if (ano % 4 == 0 && mes < 3) {
            diaSemana--;
        }
        for (int i = 1; i < mes; i++) {
            diaSemana += 30;
            if (i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12) {
                diaSemana++;
            } else if (i == 2) {
                diaSemana -= 2;
            }
        }
        diaSemana += dia;
        return Semana(diaSemana % 7);
    }

    // auxiliares
    private static String Semana(int dia) {
        switch (dia) {
            case 0:
                return "Domingo";
            case 1:
                return "Segunda-feira";
            case 2:
                return "Terça-feira";
            case 3:
                return "Quarta-feira";
            case 4:
                return "Quinta-feira";
            case 5:
                return "Sexta-feira";
            case 6:
                return "Sabado";
        }
        return "Nope";
    }

    public static int[] classificacoes(int[] lista, int N) {
        int[] resultados = { 0, 0, 0, 0 };
        for (int i = 0; i < N; i++) {
            if (lista[i] < 5 && lista[i] >= 0)
                resultados[0]++;
            else if (lista[i] < 10 && lista[i] >= 5)
                resultados[1]++;
            else if (lista[i] < 15 && lista[i] >= 10)
                resultados[2]++;
            else if (lista[i] <= 20 && lista[i] >= 15)
                resultados[3]++;
        }
        return resultados;
    }

    public static int[] mediaTemps(int[] temperaturas, int N) {
        int[] resultados = { temperaturas[0], 0, -1 };
        for (int i = 1; i < N; i++) {
            resultados[0] += temperaturas[i];
            int diferença = temperaturas[i] - temperaturas[i - 1];
            if (diferença > resultados[2]) {
                resultados[1] = i;
                resultados[2] = diferença;
            }
        }
        resultados[0] /= N;
        return resultados;
    }

    public static void triangulo(){
        double base = 1, altura;
        double area ,perimetro;
        Scanner input= new Scanner(System.in);
        while(base!=0){
            System.out.println("Base:");
            base = input.nextDouble();
            if(base==0) break;
            System.out.println("Altura:");
            altura=input.nextDouble();

            area=(base*altura)/2;
            System.out.printf("Area: %.5f\n", area);
        }
    }
}

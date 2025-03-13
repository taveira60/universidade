package ficha2;

import java.util.Arrays;
import java.util.Scanner;

public class Main
{
    public static int[] readArray (Scanner scanner)
    {
        System.out.println("tamanho do array");
        int size = scanner.nextInt();
        int[] array = new int[size];
        for (int i = 0; i < size; i++)
        {
            System.out.println("Numero na posicao" + i + ": ");
            array[i] = scanner.nextInt();
        }
        scanner.nextLine();
        return array;
    }

    public static void main(String [] args)
    {

        Scanner scanner = new Scanner(System.in);
        System.out.print("Intoduza o numero de exercicios (1-7): ");
        int exercicio = scanner.nextInt();


        switch (exercicio){
            case 1:
                System.out.println("Exercicio 1...");
                Ficha2Ex1 ficha2Ex1 = new Ficha2Ex1();
                int[] array = readArray(scanner);
                int min = ficha2Ex1.min(array);
                System.out.println("O minimo do array é: " + min);

                System.out.println("Copiar o array entre:");
                int from = scanner.nextInt();
                int to = scanner.nextInt();

                int[] inBetween = ficha2Ex1.inBetween(array, from, to);
                System.out.println("o array resultado e:" + Arrays.toString(inBetween));

                int[] array1= readArray(scanner);
                int[] array2 = readArray(scanner);

                int[] inCommon = ficha2Ex1.inCommon(array1,array2);
                System.out.println("o array resultado e:" + Arrays.toString(inCommon));
                break;
            case 2:
            default:
                System.out.println("Exercicio nao encontado");
        }
        scanner.close();
    }
}
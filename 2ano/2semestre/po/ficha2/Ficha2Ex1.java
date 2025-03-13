import java.util.Arrays;

public class Ficha2Ex1 {
    public int min(int[] array) {
        int result = array[0];

        for (int i = 0; i < array.length; i++) {
            if (array[i] < result) {
                result = array[i];
            }
        }
        return result;
    }

    public int[] inBetween(int[] array, int from, int to) {
        if (array.length == 0 | from < 0 | from > to) {
            return null;
        }
        int size = to - from + 1;
        int[] newArray = new int[size];
        for (int i = 0; i < size; i++) {
            newArray[i] = array[from + i];
        }
        return newArray;
    }

    public int[] inCommon(int[] array1, int[] array2) {
        int[] result = new int[array1.length];
        int total = 0;

        for (int i = 0; i < array1.length; i++) {
            for (int j = 0; j < array2.length; j++) {
                if (array1[i] == array2[j]) {
                    boolean found = false;
                    for (int k = 0; k < total; k++) {
                        if (result[k] == array1[i]) {
                            found = true;
                        }
                    }
                    if (!found) {
                        result[total] = array1[i];
                        total++;
                    }
                }

            }
        }
        return Arrays.copyOf(result, total);
    }
}

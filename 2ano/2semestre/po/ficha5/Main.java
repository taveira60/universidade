
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import jdk.jshell.spi.ExecutionControl;

public class Main {

    public static void guardaEmTexto(Object o, String nomeFicheiro) throws FileNotFoundException {
        PrintWriter printer = new PrintWrite(nomeFicheiro);
        printer.println(o.toString());
        printer.flush();
        printer.close();
    }

    public static List<String> lerFicheiroTexto(String nomeFicheiro) {
        List<String> linhas = new ArrayList<>();
        try {
            linhas = Files.readAllLines(Paths.get(nomeFicheiro), StandardCharsets.UTF_8);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return linhas;
    }

    public static void guardaEmObjeto(Object o, String nomeFicheiro) throws IOException {
        FileOutputStream fos = new FileOutputStream(nomeFicheiro);
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        oos.writeObject(o);
        oos.flush();
        oos.close();
    }

    public static Object lerFicheiroObjecto(String nomeFicheiro) throws IOException, ClassNotFoundException {
        FileInputStream fis = new FileInputStream(nomeFicheiro);
        ObjectInputStream ois = new ObjectInputStream(fis);
        Object o = ois.readObject();
        ois.close();
        return o;
    }

}

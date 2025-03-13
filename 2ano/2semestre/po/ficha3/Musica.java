
public class Musica {

    private String name;
    private String singer;
    private String writer;
    private String label;
    private String[] lyrics;
    private String[] music;
    private int time;
    private int nplays;

    public String[] letrasMaisUtilizadas() {
        int[] letters = new int[26];

        for (String verse : lyrics) {
            for (char c : verse.toCharArray()) {
                if (Character.isLetter(c)) {

                }
            }
        }
    }
}


/**
 * Write a description of class Music here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Music {
    /*
     *  Nome da Música
    */
    private String name;
    /*
     *Intérprete
     */
    private String interpreter;
    /*
     *Nome da Editora
     */
    private String label;
    /*
     * Letra ou Poema
     */
    private String[] lyrics;
    /*
     *Música/Acordes(representada por linhas de Caractéres Musicais)
     */
    private String[] chords;
    /*
     * Género Musical
     */
    private String genre;
    /*
     * Duração da Música em segundos
     */
    private int seg;
    /*Tipo - Explicit 
     *     (i.e. a musica é considerada ofensiva e/ou inapropriada p/ crianças)
     *   - Multimedia
     *     (i.e. possuem video associado à música)
     *   - Nil
     *     (i.e. não possui nenhuma das características acima)
     */
    private String type;
    /*Número de Reproduções
     *Número de Reproduções máximas possíveis - 2^31-1 = 2147483647
     */
    private int played;


    //Construtores Default
    public Music()
    {
        this.name = "Hino da Universidade do Minho";
        this.interpreter = "Fernando Lapa";
        this.label = "Senado Universitário";
        this.lyrics = new String[]{
                    "Estes anos são viagem\n",
                    "Entre a água e o acontecer\n",
                    "Ramo de astros sobre a margem\n",
                    "Barco ainda por haver\n",
                    "\n",
                    "É no vento a nossa casa\n",
                    "Chão aberto a quem chegar\n",
                    "São mil asas numa asa\n",
                    "Da canção a partilhar\n",
                    "\n",
                    "Novo tempo e já memória\n",
                    "Dias breves em devir\n",
                    "É o arder na própria história\n",
                    "Todo o destino é partir\n",
                    "\n",
                    "Estes anos são passagem\n",
                    "Entre a água e o acontecer\n",
                    "Um amor de mar e margem\n",
                    "Na euforia de viver\n",
                    "\n",
                    "É no vento a nossa casa\n",
                    "Chão aberto a quem chegar\n",
                    "São mil asas numa asa\n",
                    "Da canção a partilhar\n",
                    "\n",
                    "Novo tempo e já memória\n",
                    "Dias breves em devir\n",
                    "É o arder na própria história\n",
                    "Todo o destino é partir\n"
                    };
        this.chords = new String[]{
                    "C          G          Am          Em\n",
                    "F          C          Dm          G\n",
                    "\n",
                    "C          G          Am          Em\n",
                    "F          C          Dm          G\n",
                    "\n",
                    "Am         Em         F          C\n",
                    "Dm         G          C          G\n",
                    "\n",
                    "C          G          Am          Em\n",
                    "F          C          Dm          G\n",
                    "\n",
                    "C          G          Am          Em\n",
                    "F          C          Dm          G\n",
                    "\n",
                    "Am         Em         F          C\n",
                    "Dm         G          C          G\n"
                    };
        this.genre = "Música Vocal";
        this.seg = 157;
        this.type = "Nil";
        this.played = 0;
    }

    public Music(String name, String interpreter, String label, String[] lyrics, String[] chords, String genre, int seg, String type, int played)
    {
        this.name = name;
        this.interpreter = interpreter;
        this.label = label;
        this.lyrics = lyrics;
        this.chords = chords;
        this.genre = genre;
        this.seg = seg;
        this.type = type;
        this.played = played;
    }

    public Music(Music m)
    {
        this.name = m.getName();
        this.interpreter = m.getInterpreter();
        this.label = m.getLabel();
        this.lyrics = m.getLyrics();
        this.chords = m.getChords();
        this.genre = m.getGenre();
        this.seg = m.getSeg();
        this.type = m.getType();
        this.played = m.getPlayed();
    }

    /**
     * Implementação de um método de igualdade entre duas Músicas redefinição método equals de Object
     * @return Retorna um booleano com valor true caso a igualdade entre o objeto e a Música,caso contrário, retorna false
     */
    public boolean equals(Object o)
    {
        if(o == this)
            return true;
        if(( o== null) || o.getClass() != this.getClass())
            return false;
        Music m = (Music) o;
        return(this.name.equals(m.name) && this.interpreter.equals(m.interpreter) && this.label.equals(m.label)
                && this.lyrics.equals(m.lyrics) && this.chords.equals(m.chords) && this.genre.equals(m.genre)
                && this.seg == m.seg && this.type.equals(m.type) && this.played == m.played);        
    }

    /**
     * Implementação de um método toString comum a várias do java
     * @return Retorna uma string com a informação da Música 
     */ 
    public String toString()
    {
        return ("Nome: " + this.name + "\nIntérprete: " + this.interpreter + "\nEditora: " + this.label+
        "\nLetra:\n" + this.lyrics + "Acordes:\n" + this.chords + "Género Musical: " + this.genre
        +"\nDuração em Segundos: " + this.seg + "\nTipo: " + this.type +"\nReproduções: " + this.played);
    }

    /**
     * Implementação do método clone de uma Música
     * @return objecto do tipo Music
    */
    public Music clone()
    {
        return new Music(this);
    }

    //Getters
    /**
     * Método que retorna o nome de uma Música
     * @return String com o nome da Música
     */
    public String getName()
    {
        return this.name;
    }

    /**
     * Método que retorna o intérprete de uma Música
     * @return String com o intérprete da Música
     */
    public String getInterpreter()
    {
        return this.interpreter;
    }

    /**
     * Método que retorna o nome da Editora de uma Música
     * @return String com o nome da Editora da Música
     */
    public String getLabel()
    {
        return this.label;
    }
    
    /**
     * Método que retorna a letra de uma Música
     * @return String[] com a letra da Música
     */
    public String[] getLyrics()
    {
        return this.lyrics;
    }

    /**
     * Método que retorna a música/acordes (representada por linhas de Caractéres Musicais) de uma Música
     * @return String[] com a música/acordes da Música
     */
    public String[] getChords()
    {
        return this.chords;
    }

    /**
     * Método que retorna o género de uma Música
     * @return String com o género da Música
     */
    public String getGenre()
    {
        return this.genre;
    }

    /**
     * Método que retorna o tempo em segundos de uma Música
     * @return int com os segundos da Música
     */
    public int getSeg()
    {
        return this.seg;
    }

    /**
     * Método que retorna o tipo(Explicit,Multimedia,Nil) de uma Música
     * @return String com o tipo da Música
     */
    public String getType()
    {
        return this.type;
    }

    /**
     * Método que retorna o número de reproduções de uma Música
     * @return int com o número de reproduções da Música
     */
    public int getPlayed()
    {
        return this.played;
    }

    //Setters
    public void setName(String name)
    {
        this.name = name;
    }

    public void setInterpreter(String interpreter)
    {
        this.interpreter = interpreter;
    }

    public void setLabel(String label)
    {
        this.label = label;
    }

    public void setLyrics(String[] lyrics)
    {
        this.lyrics = lyrics;
    }

    public void setChords(String[] chords)
    {
        this.chords = chords;
    }

    public void setGenre(String genre)
    {
        this.genre = genre;
    }

    public void setSeg(int seg)
    {
        this.seg = seg;
    }

    public void setType(String type)
    {
        if(type.equals("Explicit") || type.equals("Multimedia"))
            this.type = type;
        else
            this.type = "Nil";    
    }

    public void setPlayed(int played)
    {
        this.played = played;
    }

}
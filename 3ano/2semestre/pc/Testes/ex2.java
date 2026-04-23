
import java.util.Random;
import javax.naming.TimeLimitExceededException;
import jdk.dynalink.beans.MissingMemberHandlerFactory;

// Pretende-se que escreva em Java, fazendo uso de primitivas baseadas em monitores, código que
// permita jogadores participarem num jogo de adivinha. Cada partida envolve 4 jogadores (cada um
// representado por uma thread), que competem para ver quem adivinha primeiro um número gerado
// aleatoriamente entre 1 e 100. Cada partida é limitada a um minuto e a 100 tentativas de resposta
// (total para todos os jogadores). Devem ser suportadas várias partidas a decorrer em simultâneo. As
// interfaces a implementar são:
// interface Jogo {
// Partida participa();
// }
// interface Partida {
// String adivinha(int n);
// }
// A operação participa() deverá bloquear até poder começar uma partida (4 jogadores a que-
// rerem participar), devolvendo o objecto que representa a partida. Sobre este objecto, a operação
// adivinha(n), usada para jogar, devolve um de: GANHOU se esta tentativa foi a primeira a acertar
// (dentro dos limites de tempo e tentativas de resposta); PERDEU se algum jogador já ganhou; TEMPO
// se esgotou o limite de tempo da partida (um minuto); TENTATIVAS se foi excedido o limite de
// tentativas; MAIOR / MENOR se o número escondido está acima/abaixo de n.nt;

interface Jogo {
    Partida participa() throws InterruptedException;
}

interface Partida {
    String adivinha(int n);
}

class JogoImpl implements Jogo {

    PartidaImpl partida = new PartidaImpl();

    public synchronized Partida participa() throws InterruptedException {
        PartidaImpl minhaPartida = partida;
        minhaPartida.player_count += 1;
        if (minhaPartida.player_count < 4) {
            while (minhaPartida.player_count < 4) {
                wait();
            }
        } else {
            partida.start();
            partida = new PartidaImpl();
            notifyAll();
        }

        partida = new PartidaImpl();

        return minhaPartida;
    }
}

class PartidaImpl implements Partida {
    int player_count = 0;

    int numero = new Random().nextInt(100) + 1;

    boolean timeout = false;

    boolean as_winner = false;

    int tentativa = 0;

    synchronized void timeout(){
        timeout=true;
    }
    void start() {
        new Thread(() -> {
            try {
                Thread.sleep(60000);
            } catch (InterruptedException ignored) {
            }
            timeout();
        }).start();
    }

    synchronized public String adivinha(int n) {
        
        tentativa += 1;

        if(as_winner){
            return "Perdeu";
        }
        if(timeout){
            return "Timeout";
        }
        if (tentativa>100)
            return "Tentativas";
        if(n== numero){
            as_winner=true;
            return "Ganhou";
        }
        if(n<numero){
            return "Maior";
        }
        else{
            return "Menor";
        }

    }
}
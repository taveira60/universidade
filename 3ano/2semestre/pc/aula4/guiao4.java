
public class guiao4 {
    class Barrier {

        private final int N;
        private int invoked = 0;
        private int returned = 0;

        public Barrier(int N) {
            this.N = N;
        }

        public synchronized void await() throws InterruptedException {
            invoked += 1;
            if (invoked < N) {
                while (invoked < N) {
                    wait();

                }
            } else {
                notifyAll();
                // counter = 0;//nao fazer
            }
            returned += 1;
            if (returned == N) {
                invoked = 0;
                returned = 0;
            }
        }

    }

    public static void main(String[] args) {
        System.out.println("Hellowrl");
    }
}

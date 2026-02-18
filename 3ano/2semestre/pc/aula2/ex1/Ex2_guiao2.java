class Contador{
    private int value=0;
    public synchronized void increment(){
        value+=1;
    }

    public synchronized int value(){
        return value;
    }

}

class Incrementer extends Thread{
    
    int I;
    final Contador c; 

    public Incrementer(int I,Contador c){
        this.I=I;
        this.c=c;
    }

    public void run(){

        for (int i = 0; i < I; i++) {
            // System.out.println(i);
            c.increment();
        }
    }
}

public class Ex2_guiao2 {
    public static void main(String[] args) throws  InterruptedException {
        final int N = Integer.parseInt(args[0]);
        final int I = Integer.parseInt(args[1]);

        Contador c = new Contador();
        Incrementer[] a = new Incrementer[N];

        for (int n = 0; n < N; n++){
            a[n] = new Incrementer(I,c);
            
            a[n].start();
        }

        for(int b = 0; b<N;b++){
            a[b].join();
        }

        System.out.println(c.value());

    }
    
}

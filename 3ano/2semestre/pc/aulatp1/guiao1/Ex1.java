

class Printer extends Thread{
    
    int I;

    public Printer(int I){
        this.I=I;
    }

    public void run(){
        for (int i = 0; i < I; i++) {
            System.out.println(i);
            
        }
    }
}

public class Ex1 {
    public static void main(String[] args) throws  InterruptedException {
        final int N = Integer.parseInt(args[0]);
        final int I = Integer.parseInt(args[1]);

        Printer[] a = new Printer[N];

        for (int n = 0; n < N; n++){
            a[n] = new Printer(I);
            
            a[n].start();
        }

        for(int b = 0; b<N;b++){
            a[b].join();
        }

        

    }
    
}

package aula1.treino;

class MyThread extends Thread { // more easy
    @Override
    public void run() {
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("Thread");
    }
}

class MyRunnable implements Runnable { // more versatile
    @Override
    public void run() {
        System.out.println(".()");
    }
}

public class Main {
    public static void main(String[] args) throws InterruptedException {
        MyThread t = new MyThread();
        t.start();

        System.out.println("MAIN");

        t.join();
    }
}

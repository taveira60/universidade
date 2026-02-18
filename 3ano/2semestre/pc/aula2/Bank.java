
import javax.sql.rowset.spi.SyncFactory;

public class Bank {

    private static class Account {
        private int balance;
        Account(int balance) { this.balance = balance; }
        int balance() { return balance; }
        boolean deposit(int value) {
            balance += value;
            return true;
        }
        boolean withdraw(int value) {
            if (value > balance)
                return false;
            balance -= value;
            return true;
        }
    }
    
//exercicio 3 e so descomentar synchronized e so copiar o accont do professor


    // Bank slots and vector of accounts
    private int slots;
    private Account[] av; 

    public Bank(int n) {
        slots=n;
        av=new Account[slots];
        for (int i=0; i<slots; i++) av[i]=new Account(0);
    }

    // Account balance
    public /*synchronized*/ int balance(int id) {
        if (id < 0 || id >= slots)
            return 0;
        return av[id].balance();
    }

    // Deposit
    public /*synchronized*/ boolean deposit(int id, int value) {
        if (id < 0 || id >= slots)
            return false;
        return av[id].deposit(value);
    }

    // Withdraw; fails if no such account or insufficient balance
    public /*synchronized*/ boolean withdraw(int id, int value) {
        if (id < 0 || id >= slots)
            return false;
        //synchronized (this) { tambem funciona
        return av[id].withdraw(value);
        //}
    }

    public /*synchronized*/ boolean transfer(int idfrom,int idto,int value){
        if (idfrom < 0 && idfrom >= slots || idto < 0 && idto >=slots|| value < 0 || value > av[idfrom].balance){
            return false;
        }

        //resolver deadlock tpc:::::::::::::::::::::::::::::::|)
        
        Account cfrom =av[idfrom];
        Account cto = av[idto];
        
        synchronized(cfrom){
            synchronized (cto) {
                if(!cfrom.withdraw(value))
                    return false;
                return cto.deposit(value);
            }
            
        }
        // return withdraw(idfrom, value) && deposit(idto, value);
    }
    
    public /*synchronized */ int totalBalance(){
        int soma=0;
        for (int i = 0; i < slots; i++) {
            soma+=balance(i);
        }
        return soma;
    }
}

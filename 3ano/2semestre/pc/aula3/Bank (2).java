
import java.util.*;
import java.util.concurrent.locks.*;

class Bank {

    private static class Account {
        private int balance;
        Lock lokki = new ReentrantLock();

        Account(int balance) {
            this.balance = balance;
        }

        int balance() {
            return balance;
        }

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

    @SuppressWarnings({ "Convert2Diamond", "FieldMayBeFinal" })
    private Map<Integer, Account> map = new HashMap<Integer, Account>();
    private int nextId = 0;
    private Lock l = new ReentrantLock();

    // create account and return account id
    public int createAccount(int balance) {
        Account c = new Account(balance);
        l.lock();
        try {
            int id = nextId;
            nextId += 1;
            map.put(id, c);
            return id;
        } finally {
            l.unlock();
        }
    }

    // close account and return balance, or 0 if no such account
    public int closeAccount(int id) {
        Account c;
        l.lock();
        try {
            c = map.remove(id);
            if (c == null)
                return 0;
            c.lokki.lock();
        } finally {
            l.unlock();
        }
        try {
            return c.balance();
        } finally {
            c.lokki.unlock();
        }
    }

    // account balance; 0 if no such account
    public int balance(int id) {
        Account c;
        l.lock();
        try {
            c = map.get(id);
            if (c == null)
                return 0;
            c.lokki.lock();
        } finally {
            l.unlock();
        }
        try {
            return c.balance();
        } finally {
            c.lokki.unlock();
        }
    }

    // deposit; fails if no such account
    public boolean deposit(int id, int value) {
        l.lock();
        try {
            Account c = map.get(id);
            if (c == null)
                return false;
            c.lokki.lock();
            try {
                return c.deposit(value);
            } finally {
                c.lokki.unlock();
            }
        } finally {
            l.unlock();
        }
    }

    // withdraw; fails if no such account or insufficient balance
    public boolean withdraw(int id, int value) {
        l.lock();
        try {
            Account c = map.get(id);
            if (c == null)
                return false;
            c.lokki.lock();
            try {
                return c.withdraw(value);
            } finally {
                c.lokki.unlock();
            }
        } finally {
            l.unlock();
        }
    }

    // tpc : se violassemso o 2case o que nos poderia acontecer,
    //

    // transfer value between accounts;
    // fails if either account does not exist or insufficient balance
    public boolean transfer(int from, int to, int value) {
        Account cfrom, cto;
        l.lock();
        try {
            cfrom = map.get(from);
            cto = map.get(to);
            if (cfrom == null || cto == null)
                return false;
            if (from < to) {
                cfrom.lokki.lock();
                cto.lokki.lock();
            } else {
                cto.lokki.lock();
                cfrom.lokki.lock();
            }
        } finally {
            l.unlock();
        }
        try {
            try {
                if (!cfrom.withdraw(value))
                    return false;
            } finally {
                cfrom.lokki.unlock();
            }
            return cto.deposit(value);
        } finally {
            cto.lokki.unlock();
        }
    }

    // sum of balances in set of accounts; 0 if some does not exist
    public int totalBalance(int[] ids) {
        int total = 0;
        l.lock();
        try {
            for (int i : ids) {
                Account c = map.get(i);
                if (c == null)
                    return 0;
                c.lokki.lock();
                total += c.balance();
                c.lokki.unlock();
            }
        } finally {
            l.unlock();
        }
        return total;
    }

}

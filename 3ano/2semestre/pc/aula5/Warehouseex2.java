import java.util.*;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import sun.misc.Signal;

class Warehouseex2 {
    final Lock l = new ReentrantLock();
    private Map<String, Product> map = new HashMap<String, Product>();

    private class Product {
        int quantity = 0;
        final Condition cond = l.newCondition();
    }

    private Product get(String item) {
        Product p = map.get(item);
        if (p != null)
            return p;
        p = new Product();
        map.put(item, p);
        return p;
    }

    public void supply(String item, int quantity) {
        l.lock();
        try {
            Product p = get(item);
            p.quantity += quantity;
            p.cond.signalAll();
        } finally {
            l.unlock();
        }
    }

    private Product missing(Product[] prods) {
        for (Product p : prods) {
            if (p.quantity == 0)
                return p;
        }
        return null;
    }

    // Errado se faltar algum produto...
    public void consume(Set<String> items) throws InterruptedException {
        l.lock();
        try {
            Product[] products = new Product[items.size()];
            int i = 0;
            for (String s : items)
                products[i++] = get(s);
            Product p;
            while((p=missing(products))!=null)
                p.cond.await();
            for (Product pr : products)
                pr.quantity--;
        } finally {
            l.unlock();
        }
    }

}

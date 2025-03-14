import java.time.LocalDate;

public class Encomenda
{

    private String cliente;

    private String nFiscal;

    private String morada;

    private Integer numeroEncomenda;

    private LocalDate data;

    private LinhaEncomenda[] orderline;

    /**
     * Getters
     */
    public String getCliente()
    {
        return this.cliente;
    }

    public String getNFiscal()
    {
        return this.nFiscal;
    }

    public String getMorada()
    {
        return this.morada;
    }

    public Integer getNumeroEncomenda()
    {
        return this.numeroEncomenda;
    }

    public LocalDate getData()
    {
        return this.data;
    }

    public LinhaEncomenda[] getOrderline()
    {
        LinhaEncomenda[] resultado = new LinhaEncomenda[this.orderline.length];
        for (int i = 0; i < this.orderline.length; i++)
        {
            if (this.orderline[i] != null)
            {
                resultado[i] = this.orderline[i].clone();
            }
        }
        return resultado;
    }

    /**
     * Setters
     */
    public void setCliente(String cliente)
    {
        this.cliente = cliente;
    }

    public void setNFiscal(String nFiscal)
    {
        this.nFiscal = nFiscal;
    }

    public void setMorada(String morada)
    {
        this.morada = morada;
    }

    public void setNumeroEncomenda(Integer numeroEncomenda)
    {
        this.numeroEncomenda = numeroEncomenda;
    }

    public void setData(LocalDate data)
    {
        this.data = data;
    }

    public void setOrderline(LinhaEncomenda[] orderline)
    {
        this.orderline = new LinhaEncomenda[orderline.length];
        for (int i = 0; i < orderline.length; i++)
        {
            if (orderline[i] != null)
            {
                this.orderline[i] = orderline[i].clone();
            }
        }
    }

    public Encomenda()
    {
        this.cliente = null;
        this.nFiscal = null;
        this.morada = null;
        this.numeroEncomenda = 0;
        this.data = null;
        this.orderline = null;
    }

    public Encomenda(Integer tamanho)
    {
        this.cliente = null;
        this.nFiscal = null;
        this.morada = null;
        this.numeroEncomenda = 0;
        this.data = null;
        this.orderline = new LinhaEncomenda[tamanho];
    }

    public Encomenda(String client, String numeroFiscal, String address, Integer nEncomenda, LocalDate date,
            LinhaEncomenda[] encomendas)
    {
        this.cliente = client;
        this.nFiscal = numeroFiscal;
        this.morada = address;
        this.numeroEncomenda = nEncomenda;
        this.data = date;
        this.orderline = new LinhaEncomenda[encomendas.length];
        for (int i = 0; i < encomendas.length; i++)
        {
            this.orderline[i] = encomendas[i].clone();
        }
    }

    public Encomenda(Encomenda outra)
    {
        this.cliente = outra.getCliente();
        this.data = outra.getData();
        this.morada = outra.getMorada();
        this.nFiscal = outra.getNFiscal();
        this.numeroEncomenda = outra.getNumeroEncomenda();
        this.orderline = outra.getOrderline();
    }

    @Override
    /**
     * nao tem o valor total!
     * 
     */
    public String toString()
    {
        StringBuilder sb = new StringBuilder();

        sb.append("========== ENCOMENDA Nº ").append(this.numeroEncomenda).append(" ==========\n");
        sb.append("Cliente: ").append(this.cliente != null ? this.cliente : "N/A").append("\n");
        sb.append("NIF: ").append(this.nFiscal != null ? this.nFiscal : "N/A").append("\n");
        sb.append("Morada: ").append(this.morada != null ? this.morada : "N/A").append("\n");
        sb.append("Data: ").append(this.data != null ? this.data : "N/A").append("\n\n");

        if (this.orderline != null)
        {
            boolean hasItems = false;

            for (int i = 0; i < this.orderline.length; i++)
            {
                if (this.orderline[i] != null)
                {
                    hasItems = true;
                    sb.append("Item ").append(i + 1).append(":\n");
                    sb.append(this.orderline[i].toString());
                }
                sb.append("=========PROXIMO ITEM=========\n");
            }

            if (!hasItems)
            {
                sb.append("Não há itens nesta encomenda.\n\n");
            }
        } else
        {
            sb.append("Nenhuma linha de encomenda definida.\n\n");
        }

        return sb.toString();

    }

    // (b) método que determina o valor total da encomenda, public double
    // calculaValorTotal()
    public double calculaValorTotal()
    {
        double res = 0;

        for (LinhaEncomenda a : this.orderline)
        {
            res += a.calculaValorLinhaEnc();
        }
        return res;
    }

    // (c) método que determina o valor total dos descontos obtidos nos diver-
    // sos produtos encomendados, public double calculaValorDesconto()
    public double calculaValorDesconto()
    {
        double res = 0;
        for (LinhaEncomenda a : this.getOrderline())
        {
            res += a.calculaValorDesconto();
        }
        return res;
    }

    // (d) método que determina o número total de produtos a receber, public
    // int numeroTotalProdutos()
    public int numeroTotalProdutos()
    {
        int res = 0;
        for (LinhaEncomenda a : this.getOrderline())
        {
            res += a.getQuantidade();
        }
        return res;
    }

    // (e) método que determina se um produto vai ser encomendado, public
    // boolean existeProdutoEncomenda(String refProduto)
    public boolean existeProdutoEncomenda(String refProduto)
    {
        for (LinhaEncomenda a : this.getOrderline())
        {
            if (refProduto.equals(a.getReferencia()))
                return true;
        }
        return false;
    }

    // (f) método que adiciona uma nova linha de encomenda, public void
    // adicionaLinha(LinhaEncomenda linha)
    public void adicionaLinha(LinhaEncomenda linha)
    {
        if (this.orderline == null)
        {
            this.orderline = new LinhaEncomenda[1];
            this.orderline[0] = linha;
            return;
        }
        LinhaEncomenda[] novo = new LinhaEncomenda[this.orderline.length + 1];
        System.arraycopy(this.orderline, 0, novo, 0, this.orderline.length);
        novo[this.orderline.length] = linha;
        this.orderline = novo;
    }

    // (g) método que remove uma linha de encomenda dado a referência do
    // produto, public void removeProduto(String codProd)
    public void removeProduto(String codProd)
    {
        if (this.orderline == null)
            return;
        LinhaEncomenda[] aux = new LinhaEncomenda[this.orderline.length];
        int contador = 0;
        for (LinhaEncomenda a : this.orderline)
        {
            if (a == null)
                System.err.println("tens um objeto nulo burro");
            else if (a.getReferencia().equals(codProd))
                ;
            else
            {
                aux[contador] = a.clone();
                contador++;
            }
        }
        if (contador == this.orderline.length)
            return;
        LinhaEncomenda[] novo = new LinhaEncomenda[contador];
        System.arraycopy(aux,0,novo,0,contador);
        this.orderline = novo;
    }
}

// linhaencomanda:
// - referencia : String
// - descricao : String
// - preco : Double
// - quantidade : Int
// - imposto: Double
// - desconto : Double
// -------------------
// + calculaValorLinhaEnc() : Double
// + calculaValorDesconto() : Double
// + gets e sets,
// + toString : String
// + clone(), linhaEncomenda
// + linhaEncomenda() : linhaEncomenda
// + linhaEncomenda(r,d,p,q,t,dis) : linhaEncomenda
// + linhaEncomenda(other: linhaEncomenda)
// ^
// | -orderLines
// | 1....x
// |
// |
// |
// |
// |
// |
// |
// x
// <> (losango pintado neste caso) [losango pintado significa composicao, e nao
// pintado significa agregacao]
// encomenda
// - cliente : String
// - vat : String
// - morada : String
// - numeroDaEncomenda : Integer
// - data : LocalDate
// -----------------------
// + getters ...
// + setters ...
// + construtores
// + toString
// + clone() : encomenda
// + calculaValorTotal() : Double
// + calculaValorDesconto() : Double
// + numeroTotalProdutos() : Integer
// + existeProdutoEncomenda(String refProduto) : Boolean
// + adicionaLinha(LinhaEncomenda linha) : void (podemos colocao ou omitir)
// + removeProduto(String codProd)

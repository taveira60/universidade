public class LinhaEncomenda
{

    private String referencia;

    private String descricao;

    private Integer quantidade;

    private Double preco;

    private Double imposto;

    private Double desconto;

    // Getters
    public String getReferencia()
    {
        return this.referencia;
    }

    public String getDescricao()
    {
        return this.descricao;
    }

    public Integer getQuantidade()
    {
        return this.quantidade;
    }

    public Double getPreco()
    {
        return this.preco;
    }

    public Double getImposto()
    {
        return this.imposto;
    }

    public Double getDesconto()
    {
        return this.desconto;
    }

    // Setters
    public void setReferencia(String referencia)
    {
        this.referencia = referencia;
    }

    public void setDescricao(String descricao)
    {
        this.descricao = descricao;
    }

    public void setQuantidade(Integer quantidade)
    {
        this.quantidade = quantidade;
    }

    public void setPreco(Double preco)
    {
        this.preco = preco;
    }

    public void setImposto(Double imposto)
    {
        this.imposto = imposto;
    }

    public void setDesconto(Double desconto)
    {
        this.desconto = desconto;
    }

    public LinhaEncomenda()
    {
        this.desconto = 0.0;
        this.descricao = null;
        this.imposto = 0.0;
        this.preco = 0.0;
        this.quantidade = 0;
        this.referencia = null;
    }

    public LinhaEncomenda(String referencia, String descricao, Integer quantidade, Double preco, Double imposto,
            Double desconto)
    {
        this.referencia = referencia;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.preco = preco;
        this.imposto = imposto;
        this.desconto = desconto;
    }

    /**
     * Construtor de cópia
     */
    public LinhaEncomenda(LinhaEncomenda outra)
    {
        this.referencia = outra.getReferencia();
        this.descricao = outra.getDescricao();
        this.quantidade = outra.getQuantidade();
        this.preco = outra.getPreco();
        this.imposto = outra.getImposto();
        this.desconto = outra.getDesconto();
    }

    public Boolean isEquals(Object o)
    {
        if (this == o)
            return true;
        if (o == null || this.getClass() != o.getClass())
            return false;

        LinhaEncomenda outra = (LinhaEncomenda) o;

        return this.referencia.equals(outra.referencia) && this.descricao.equals(outra.descricao)
                && this.quantidade.equals(outra.quantidade) && this.preco.equals(outra.preco)
                && this.imposto.equals(outra.imposto) && this.desconto.equals(outra.desconto);
    }

    public Boolean isMesmoProduto(LinhaEncomenda outra)
    {
        if (outra == null)
            return false;
        return this.referencia.equals(outra.getReferencia());
    }

    /**
     * Método clone
     */
    @Override
    public LinhaEncomenda clone()
    {
        return new LinhaEncomenda(this);
    }

    @Override
    public String toString()
    {
        StringBuilder ret = new StringBuilder();
        ret.append("Referencia: ").append(this.referencia).append('\n');
        ret.append("Descrica: ").append(this.descricao).append('\n');
        ret.append("Preco: ").append(this.preco).append('\n');
        ret.append("Imposto: ").append(this.imposto).append('\n');
        ret.append("Desconto: ").append(this.desconto).append('\n');

        return ret.toString();
    }

    // (b) método que determina o valor da venda já considerados os impostos e
    // os descontos, public double calculaValorLinhaEnc()
    public double calculaValorLinhaEnc()
    {
        Double impostoProduto = (this.imposto / 100) * this.preco;
        Double descontoProduto = (this.desconto / 100) * this.preco;
        return (this.preco + impostoProduto - descontoProduto) * this.quantidade;
    }

    // (c) método que determina o valor numérico (em euros) do desconto, public
    // double calculaValorDesconto()
    public double calculaValorDesconto()
    {
        return (this.desconto / 100) * this.preco;
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
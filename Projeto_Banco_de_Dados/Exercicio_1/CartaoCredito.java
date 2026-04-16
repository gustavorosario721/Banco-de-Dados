public class CartaoCredito implements Pagamento
{
    @Override
    public void pagarDouble(double valor)
    {
        System.out.println("Pagamento realizado com cartão de crédito. Valor pago R$" + valor);
    }
} 
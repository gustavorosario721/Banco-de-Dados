public class Pix implements Pagamento
{
    @Override
    public void pagarDouble(double valor)
    {
        System.out.print("Pagamento realizado com Pix. Valor pago R$" + valor);
    }
}

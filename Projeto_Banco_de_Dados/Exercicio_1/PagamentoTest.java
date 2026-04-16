public class PagamentoTest
{
    public static void main(String[] args)
    {
        Pagamento pag[] = {new CartaoCredito(), new Pix()};

        pag[0].pagarDouble(34.2);
        pag[1].pagarDouble(23.4);
    }
}

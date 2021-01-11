import './styles.css';

type Props = {
    amount: number;
    totalPrice: number;
    onSumit: () => void;
}

function OrderSummary({amount,totalPrice,onSumit}: Props){

    function formatPrice(price: number){
        const formatter = new Intl.NumberFormat('pt-BR',{
            style: 'currency',
            currency: 'BRL',
            minimumFractionDigits: 2
        });
        return formatter.format(price);
    }

    return (
        <div className="order-summary-container">
            <div className="order-summary-content">
              <div>
 
                <span className="amount-selected-container">
                   <strong className="amount-selected">{amount}</strong>
                   PEDIDOS SELECIONADOS
                </span>

                <span className="order-summary-total">
                   <strong className="amount-selected">{formatPrice(totalPrice)}</strong>
                   VALOR TOTAL
                </span>

              </div>
              <button className="order-summary-make-order"
                      onClick={onSumit}>FAZER PEDIDO</button>    
            </div>
        </div>
    );
}

export default OrderSummary;


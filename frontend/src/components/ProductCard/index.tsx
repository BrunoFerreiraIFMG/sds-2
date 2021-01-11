import { Product } from '../../types';
//import {ReactComponent as Pizza} from './pizza.svg';
import './styles.css';

type Props ={
    product: Product;
    onSelectProduct: (product: Product) => void;
    isSelect: boolean;
}

function formatPrice(price: number){
    const formatter = new Intl.NumberFormat('pt-BR',{
        style: 'currency',
        currency: 'BRL',
        minimumFractionDigits: 2
    });
    return formatter.format(price);
}

function ProductCard({product, onSelectProduct, isSelect} : Props){
    return(
      <div className={`order-card-container ${isSelect ? 'selected' : ''}`}
           onClick={()=>onSelectProduct(product)}>

          <h3 className="order-card-title">
              {product.name}
          </h3>
          {/*<Pizza className="order-card-image"/>*/}
          <img className="order-card-image" src={product.imageUri} alt={product.name}/>
          <h3 className="order-card-price">
              {formatPrice(product.price)}
          </h3>
          <div className="order-card-description">
              <h3>Descrição</h3>
              <p>
                  {product.description}
              </p>
          </div>
          
      </div>  
    );
}

export default ProductCard;

/*
 <div className="order-card-container">
          <h3 className="order-card-title">
              Pizza de Calabreza
          </h3>
          <Pizza className="order-card-image"/>
          <h3 className="order-card-price">
              35,50
          </h3>
          <div className="order-card-description">
              <h3>Descrição</h3>
              <p>
                 Uma deliciosa combinação de Linguiça Calabresa, rodelas de cebolas frescas, azeitonas pretas, mussarela, polpa de tomate, orégano e massa especial.
              </p>
          </div>
          
      </div>  
*/
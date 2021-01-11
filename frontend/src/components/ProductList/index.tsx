import { Product } from '../../types';
import ProductCard from '../ProductCard';
import './styles.css';

type Props ={
    products: Product[];
    selectProducts: Product[];
    onSelectProduct: (product: Product) => void;
}

function ProductList({products, onSelectProduct, selectProducts} : Props){

    function checkIsSelected(selectedProducts: Product[], product: Product){
        return selectedProducts.some(item => item.id === product.id);
    }


    return(
     
       <div className="orders-list-container">
         <div className="orders-list-items">
    
            { products.map( product => (
                <ProductCard key={product.id} 
                             product={product}
                             onSelectProduct={onSelectProduct}
                             isSelect={checkIsSelected(selectProducts, product)}/>
             ))
            }
             
    
         </div>
       </div> 
      
    );
}

export default ProductList;
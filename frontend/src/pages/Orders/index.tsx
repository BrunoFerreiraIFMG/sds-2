import React, {useEffect,useState} from 'react';
import './styles.css';
import Footer from '../../components/Footer';
import StepHeader from '../../components/StepHeader';
import ProductList from '../../components/ProductList';
import { OrderLocationData, Product } from '../../types';
import { fetchProducts, saveOrders } from '../../api';
import OrderLocation from '../../components/OrderLocation';
import OrderSummary from '../../components/OrderSummry';
import { toast } from 'react-toastify';

function Orders(){

   const [products, setProducts] = useState<Product[]>([]);
   const [orderLocation, setOrderLocation] = useState<OrderLocationData>();
   const [selectedProducts, setSelectedProducts] = useState<Product[]>([]);
   //const [amount,setAmount] = useState(0);
  
   const totalPrice = selectedProducts.reduce((sum, item)=>{
        return sum + item.price;
   },0)

   const handleSelectProduct = (product: Product) => {
    const isAlreadySelected = selectedProducts.some(item => item.id === product.id);
  
    if (isAlreadySelected) {
      const selected = selectedProducts.filter(item => item.id !== product.id);
      setSelectedProducts(selected);
    } else {
      setSelectedProducts(previous => [...previous, product]);
    }
  }
  
  
  const handleSubmit = () => {
    const productsIds = selectedProducts.map(({ id }) => ({ id }));
    const payload = {
      ...orderLocation!,
      products: productsIds
    }
  
    saveOrders(payload).then((response) => {
      toast.error(`Pedido enviado com sucesso! Nº ${response.data.id}`);
      setSelectedProducts([]);
    })
      .catch(() => {
        toast.warning('Erro ao enviar pedido');
      })
  }
  


   useEffect(()=>{

      fetchProducts()
         .then(response => setProducts(response.data) )
         .catch(error => console.log('Erro na requisição '+JSON.stringify(error)))
     

   }
    ,[]);


    return(
      <div className="orders-container">
        <StepHeader/>
        <ProductList products = {products}
                     selectProducts = {selectedProducts}
                     onSelectProduct={handleSelectProduct}/>
        <OrderLocation onChangeLocation={location => setOrderLocation(location)}/>
        <OrderSummary amount={selectedProducts.length} 
                      totalPrice={totalPrice}
                      onSumit={handleSubmit} />
        <Footer/>
      </div>  
    );
}

export default Orders;
import React from 'react';
import './styles.css';
import {ReactComponent as MainImage} from './main.svg';
import Footer from '../../components/Footer';
import { Link } from 'react-router-dom';
function Home(){
    return(
      <>  
        <div className="home-container">
           <div className="home-content">
              <div className="home-actions">
                  <h1 className="home-title">
                      Faça seu pedido <br/> que entregamos <br/> para você!!!
                  </h1>

                  <h3 className="home-subtitle">
                      Esolha o seu produto e em poucos minutos <br/> levaremos em sua porta.
                  </h3>

                  <Link className="home-btn-order" to="/orders" >FAZER PEDIDO</Link>
              </div>

              <div className="home-image"><MainImage/></div>
           </div>            
        </div>
        <Footer/>
      </>  
    );
}

export default Home;

import React from 'react';
import './styles.css';
import {ReactComponent as Instagram} from './instagram.svg';
import {ReactComponent as Youtube} from './youtube.svg';
import {ReactComponent as Linkedin} from './linkedin.svg';
function Footer(){
    return(
        <footer className="main-footer">
            App desenvolvido para aprender DevSuperior
          
           <div className="footer-icons">
                  <a href="https://www.youtube.com.br" target="_new" >
                    <Youtube/>
                  </a>

                  <a href="https://www.linkedin.com" target="_new" >
                    <Linkedin/>
                  </a>

                  <a href="https://www.instagram.com" target="_new" >
                    <Instagram/>
                  </a>
           </div>            
        </footer>
    );
}

export default Footer;
//import React from 'react';
import { ToastContainer } from 'react-toastify';

import './App.css';
import 'react-toastify/dist/ReactToastify.css';
//import Navbar from './components/Navbar';
import Routes from './Routes';

function App() {
  return (
    <div>       
       <Routes/>
       <ToastContainer/>
    </div>
  );
}

export default App;

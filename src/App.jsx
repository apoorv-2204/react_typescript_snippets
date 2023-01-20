import './App.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import CustomNavBar from './components/Navbar.jsx';
import "bootstrap/dist/css/bootstrap.min.css";
import UseStateCounter from './components/UseStateCounter.jsx';
import Shop from './components/shop/Shop';
import BuyPage from './components/shop/BuyPage';
import UseEffectDemo from './components/use_effect_demo.jsx';

function App() {
  return (
    <div className="App">
      <CustomNavBar />
      <WebsiteRoutes />

    </div>
  );
}


function WebsiteRoutes() {
  return (
    <>
      <Router>
        <Routes>
          {/* <Route path="/" element={<Home />} />
          <Route path="/page1" element={<Page1 />} />
          <Route path="/components-index" element={<ComponentsIndex />} /> */}
          <Route path="/basics/use_state_counter" element={<UseStateCounter />} />
          <Route path="/basics/use_effect" element={<UseEffectDemo />} />
          <Route path="/complex/shop" element={<Shop />} />
          <Route path="/complex/shop/BuyPage" element={<BuyPage />} />
        </Routes>
      </Router>
    </>);
}
export default App;

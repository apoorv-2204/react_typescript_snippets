import './App.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import CustomNavBar from './components/Navbar.jsx';
import "bootstrap/dist/css/bootstrap.min.css";

function App() {
  return (
    <div className="App">
      <WebsiteRoutes />
      <CustomNavBar />

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

        </Routes>
      </Router>
    </>);
}
export default App;

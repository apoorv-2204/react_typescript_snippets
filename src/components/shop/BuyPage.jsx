// import { createClient } from 'pexels';
import 'react-toastify/dist/ReactToastify.css';
import { useState, useEffect } from 'react';
// import { toast } from 'react-toastify';
import Axios from 'axios';
import { Container } from 'reactstrap';
import { faker } from '@faker-js/faker';

import Shop from './Shop';

const API_KEY = '563492ad6f91700001000001e3ce50e2949141e59cd4e97168c4d2bd';
const url = "https://api.pexels.com/v1/search?query=laptop&per_page=6&page=1";
export default function BuyPage({ addInCart }) {
    console.log("BuyPage");
    // const client = createClient('563492ad6f91700001000001e3ce50e2949141e59cd4e97168c4d2bd');
    const [product, setProduct] = useState([]);

    const fetchPhotos = async () => {
        const { data } = await Axios.get(url, {
            headers: {
                Authorization: API_KEY,
            },
        });

        const allProducts = data.photos.map((photo) => {
            return {
                id: faker.datatype.uuid(),
                smallImage: photo.src.medium,
                tinyImage: photo.src.tiny,
                productPrice: faker.finance.price,
                productName: faker.commerce.productName,
            }
        });

        setProduct(allProducts);
    }
    // load only once not every time
    useEffect(() => { fetchPhotos() }, []);
    return (<>
        <Container fluid>
            <h1 style={{ alignText: "center" }}>Buy Page</h1>
            <Shop addInCart={addInCart} product={product} />
        </Container>
    </>
    );

}

// import React, { useState, useEffect } from 'react'
// import Axios from 'axios'
// import { faker } from '@faker-js/faker'
// import { Container, Col, Row } from 'reactstrap'


// const apiKey = 'API key'

// const url = "https://api.pexels.com/v1/search?query=laptop&per_page=6&page=1";

// const localUrl = 'https://api.jsonbin.io/v3/qs/63ba96a3dfc68e59d57cb6c1'

// const BuyPage = ({ addInCart }) => {

//     console.log('control came to buypage');
//     const [product, setProduct] = useState([]);

//     const fetchPhotos = async () => {
//         const { data } = await Axios.get(url, {
//             headers: {
//                 Authorization: apiKey
//             }

//         });
//         const { photos } = data;
//         const allProduct = photos.map(photo => ({
//             smallImage: photo.src.medium,
//             tinyImage: photo.src.tiny,
//             productName: faker.commerce.product(),
//             productPrice: faker.finance.amount(),
//             id: faker.datatype.uuid()
//         }))
//         setProduct(allProduct)
//     }

//     useEffect(() => {
//         fetchPhotos()
//     }, [])

//     return (
//         <Container>
//             <h1 className='text-success text-center'>
//                 Buy Page
//             </h1>
//             <Row>
//                 {product.map(product => {
//                     <span key={product.id}>{product.productName}</span>
//                 })}
//             </Row>
//         </Container>
//     )
// }
// export default BuyPage;

// function App() {
//     console.log('control is in App component')
//     const [cartItem, setCartItem] = useState([])

//     const addInCart = item => {

//         const isAlreadyAdded = cartItem.findIndex(function (array) {
//             return array.id === item.id
//         })
//         if (isAlreadyAdded !== -1) {
//             toast("Already added in cart", {
//                 type: 'error'
//             })
//         }
//         else {
//             setCartItem([...cartItem, item])
//         }
//     }

//     const buyNow = () => {
//         setCartItem([])
//         toast("Purchase Done", {
//             type: 'success'
//         })
//     }


//     const removeItem = item => {
//         setCartItem(cartItem.filter(singleItem => singleItem.id !== item.id))
//     }

//     return (
//         <div className="App">
//             <BuyPage addInCart={addInCart} />
//         </div>
//     );
//     console.log("buy page component is called and props passed");
// }

// export default App;
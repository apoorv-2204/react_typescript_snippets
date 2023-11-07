import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { useState } from 'react';

function Shop() {
    const [cartItem, setCartItem] = useState([]);

    const addInCart = (item) => {
        const isAlreadyAdded = cartItem.findIndex(function (array) {
            return array.id === item.id;
        });
        if (isAlreadyAdded !== -1) {
            // give index of item if not availble -1
            // already in cart
            toast("ALready in cart", { type: "error" });
        } else {
            setCartItem([...cartItem, item]);
            toast("Added to Cart", { type: "success" });
        }
    }

    const buyNow = () => {
        setCartItem([]);
        toast("Purchase Done", { type: "success" });
    };

    const removeItem = (item) => {
        setCartItem(cartItem.filter(x => x.id !== item.id));
    };
}



export default Shop;
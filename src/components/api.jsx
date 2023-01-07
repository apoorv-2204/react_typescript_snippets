import React, { useState, useEffect } from 'react';
import { Container, Row, Col } from 'reactstrap';
import "bootstrap/dist/css/bootstrap.min.css";
import Axios from 'axios';

function api_demo() {

    const [details, setDetails] = useState({});
    const fetchDetails = async () => {
        const { data } = await Axios.get(
            "https://randomuser.me/api/"
        );
        console.log(data);
        setDetails(data.results[0]);
    }

    useEffect(() => {
        fetchDetails();
    }, []);

    console.log(fetchDetails);


}
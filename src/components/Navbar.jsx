import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';

function CustomNavBar() {
    return (
        <>
            <Navbar collapseOnSelect expand="lg" bg="primary" variant="dark">
                <Container>
                    <Navbar.Brand href="/">Project-Home</Navbar.Brand>
                    <Navbar.Toggle aria-controls="responsive-navbar-nav" />
                    <Navbar.Collapse id="responsive-navbar-nav">
                        <Nav className="me-auto">
                            <NavDropdown title="Basics" id="collasible-nav-dropdown">

                                <NavDropdown.Item href="/basics/use_state_counter">use_state_counter</NavDropdown.Item>
                                <NavDropdown.Item href="#action/3.2"> Another action </NavDropdown.Item>
                                <NavDropdown.Item href="#action/3.3">Something</NavDropdown.Item>
                                <NavDropdown.Divider />
                                <NavDropdown.Item href="#action/3.4">
                                    Separated link
                                </NavDropdown.Item>
                            </NavDropdown>

                            <NavDropdown title="Complex" id="collasible-nav-dropdown">

                                <NavDropdown.Item href="/complex/shop">Shop</NavDropdown.Item>
                                <NavDropdown.Divider />
                                <NavDropdown.Item href="/complex/shop/buypage">
                                    BuyPage
                                </NavDropdown.Item>
                            </NavDropdown>
                            <Nav.Link href="#features">Features</Nav.Link>
                            <Nav.Link href="#pricing">Pricing</Nav.Link>

                        </Nav>
                        <Nav>
                            <Nav.Link href="#deets">More deets</Nav.Link>
                            <Nav.Link eventKey={2} href="#memes">
                                Dank memes
                            </Nav.Link>
                        </Nav>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
        </>
    );
}

export default CustomNavBar;
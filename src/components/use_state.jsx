import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import BookList from './BookList';

function Books() {
    return (
        <section className='bookList'>
            <Image
                img={BookList1.Images}
                titl={BookList1.Title}
                author={BookList1.Author}>



            </Image>
            <Image img={BookList2.Images}
                titl={BookList2.Title}
                author={BookList2.Author}> <p>Hyder is Full Stack Java Developer</p></Image>
            <Image
                img={BookList3.Images}
                titl={BookList3.Title}
                author={BookList3.Author}></Image>
            <Image
                img={BookList4.Images}
                titl={BookList4.Title}
                author={BookList4.Author}></Image>

        </section>
    );
}
const Image = ({ img, titl, author, children }) => {
    //const {img,titl,author}=props;
    return (
        <article className='books'>
            <img src={img} alt="" />
            <h2>{titl}</h2>
            <h4>{author}</h4>
            <h2>{children}</h2>
        </article>
    );
}
ReactDOM.render(<Books />, document.getElementById('root'));

export const Book = ({ img, title, author }) => {
    const btnonclick = () => {
        console.log('yokohama');
        alert("asdasd");
    };


    return (
        <article className='books'>

            <img src={img} alt="" />
            <h2>{title}</h2>
            <h4>{author}</h4>
            <button type='button' onClick={btnonclick}> YO thei is a button</button>

        </article>
    );
}

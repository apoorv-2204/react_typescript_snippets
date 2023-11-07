import * as React from "react";


function Take1() {
    const [enteredEmail, setEnteredEmail] = React.useState('');
    function updateEmailHandler(event: React.ChangeEvent<HTMLInputElement>) {
        setEnteredEmail(event.target.value);
    }

    function submitFormHandler(event: React.FormEvent<HTMLFormElement>) {
        console.log(event)
        console.log(event.target)
        event.preventDefault();


        //         SyntheticBaseEvent {_reactName: 'onSubmit', _targetInst: null, type: 'submit', nativeEvent: SubmitEvent, target: form, …}
        // bubbles: true
        // cancelable: true
        // currentTarget: null
        // defaultPrevented: true
        // eventPhase: 3
        // isDefaultPrevented: ƒ functionThatReturnsTrue()
        // isPropagationStopped: ƒ functionThatReturnsFalse()
        // isTrusted: true
        // nativeEvent: SubmitEvent {isTrusted: true, submitter: button, type: 'submit', target: form, currentTarget: null, …}
        // target: form
        // timeStamp: 5251.199999999255
        // type: "submit"
        // _reactName: "onSubmit"
        // _targetInst: 
        // null[[Prototype]]: Object        //  send mail to backend
    }

    return (
        <>
            <hr />
            <br />
            <h2>Take 1</h2>
            <form onSubmit={submitFormHandler}>
                <label htmlFor="email"> Your email </label>
                <input type="email" id="email" onChange={updateEmailHandler} value={enteredEmail} />
                <button>save </button>
            </form>
            <br />
            <hr />

        </>
    );
}
const UseRefDemo: React.FC = () => {
    return (
        <>
            <Take1 />
        </>
    );
}

export default UseRefDemo;


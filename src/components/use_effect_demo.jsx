import { useState, useEffect } from "react";


function UseEffectDemo() {
    return (
        <>
            <div>
                <div> <Timer /> </div>
                <br />
                <br />
                <div>
                    <DependentTimer />
                </div>
            </div>
        </>

    );
}

function DependentTimer() {
    // on click multuples by 2034
    const [counter, upateCounter] = useState(0);
    const [calculatedValue, updateCalculatedValue] = useState(0);

    // use effect runs on every counter change
    useEffect(() => { updateCalculatedValue(2034 * counter) }, [counter]);

    return (<>
        <center>
            <div><h1>Counter: {counter}</h1> </div>
            <div> <button onClick={() => upateCounter(counter + 1)}> + Increase the value</button></div>
            <div> <button onClick={() => upateCounter(counter - 1)}> - Decrease the Value</button></div>
            <br />
            <br />
            <div> <center><h1>calculatedValue: {calculatedValue}</h1></center></div>
        </center>
    </>);
}

function Timer() {
    const [count, setCount] = useState(0);
    const [count2, setCount2] = useState(0);
    // use effect runs on every render
    //    It keeps counting due to reendering caused by setCount when the count changes, a render happens
    //   triggers another effect.
    // This is not what we want.There are several ways to control when side effects run.
    // We should always include the second parameter which accepts an array.We can optionally pass dependencies to useEffect in this array.
    const timer = () => setTimeout(() => { setCount((count) => count + 1) }, 1000);
    const timer2 = () => setTimeout(() => { setCount2((count2) => count2 + 1) }, 0.1);

    useEffect(() => { timer() }, []);
    useEffect(() => { timer2() });

    return (<>
        <div><center><h1>I've rendered {count} times!</h1></center> </div>
        <div><center><h1>I've rendered {count2} times!</h1></center></div>
    </>);
}

// No dependency passed:
// useEffect(() => {
//     //Runs on every render
// });

// 2. An empty array:
// useEffect(() => {
//     //Runs only on the first render
// }, []);

// 3. useEffect(() => {
//     //Runs on the first render
//     //And any time any dependency value changes
// }, [prop, state]);


export default UseEffectDemo;
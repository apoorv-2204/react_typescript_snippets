import React from "react";


function UseStateCounter() {

  const [value, setValue] = React.useState(0);
  const reset = () => { setValue(0) }

  return (
    <section style={{ margin: '4rem 0', display: "flex", justifyContent: "center" }}>
      <div style={{ textAlign: "center" }}>
        <h2 >React Counter</h2>
        <div> </div>
        <div>
          <h4 style={{ textAlign: "center" }}>{value}</h4>
        </div>

        <br />
        <div>
          <button className="btn" onClick={() => { setValue(value + 1); }}>Increase</button>
          <button className="btn" onClick={() => { setValue(value - 1); }}>Decrease</button>
          <button className="btn" onClick={reset}>Reset</button>
        </div>
      </div>

    </section >
  );

}

export default UseStateCounter;
import React from "react";
import "@css/App.css";
import "bootstrap/dist/css/bootstrap.min.css";

import CustomNavBar from "@components/navbar.tsx";
import UseEffectDemo from "@hooks/useEffectDemo";

// https://dev.to/luispa/captures-console-log-s-into-a-react-component-dmm
// https://www.educative.io/answers/what-is-a-react-modal

function App() {
  renderCounter("mainAppRenderCount");

  return (
    <div className="App">
      <CustomNavBar />
      {/* <UseRefDemo /> */}
      <UseEffectDemo />
    </div>
  );
}

export default App;

const renderCounter = (name: string) => {
  const componentRenderCount = React.useRef<number>(0);
  componentRenderCount.current++;
  console.log(name, componentRenderCount.current);
};

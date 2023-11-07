import './App.css'


import '@css/App.css';
import "bootstrap/dist/css/bootstrap.min.css";

import { useState, useEffect } from "react";
import { Hook, Console, Decode } from "console-feed"
import { Message } from "console-feed/lib/definitions/Component"


import CustomNavBar from './components/navbar';
// import { UseRefDemo } from "./hooks/index";
import UseEffectDemo from './hooks/useEffectDemo';


// https://dev.to/luispa/captures-console-log-s-into-a-react-component-dmm
// https://www.educative.io/answers/what-is-a-react-modal

function App() {
  const [logs, setLogs] = useState<Message[]>([]);

  useEffect(() => {
    Hook(window.console, (log) => {
      setLogs((prevLogs: any) => [...prevLogs, Decode(log)]);
    });

    console.log(`Hello world!`);
  }, []);

  return (
    <div className="App">
      <CustomNavBar />
      {/* <UseRefDemo /> */}
      <UseEffectDemo />

      <div style={{ backgroundColor: '#242424' }}>
        <Console logs={logs} variant="dark" />
      </div>

    </div>
  );
}

export default App

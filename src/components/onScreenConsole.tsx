import { useState, useEffect } from "react";
import { Hook, Console, Decode } from "console-feed";
import { Message } from "console-feed/lib/definitions/Component";
export function OnScreenConsole() {
  const [logs, setLogs] = useState<Message[]>([]);
  useEffect(() => {
    Hook(window.console, (log) => {
      setLogs((prevLogs: any) => [...prevLogs, Decode(log)]);
    });

    console.log(`Main APp use effect`);
  }, []);
  console.log(`Main app`);

  return (
    <div style={{ backgroundColor: "#242424" }}>
      <Console logs={logs} variant="dark" />
    </div>
  );
}

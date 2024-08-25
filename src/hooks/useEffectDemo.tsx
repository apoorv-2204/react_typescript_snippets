import { useEffect } from "react";
import React from "react";
import { ErrorResponse } from "react-router-dom";

var useEffectVariableCounter = 0;

export default function UseEffectDemo() {
  return (
    <>
      <Take1 />
    </>
  );
}

const renderCounter = (name: string) => {
  const componentRenderCount = React.useRef<number>(0);
  componentRenderCount.current++;
  console.log(name, componentRenderCount.current);
};

async function fetchInfo(url: string): Promise<any> {
  const response = await fetch(url);
  const info = await response.json();
  return info;
}

// export default function Take1(props: Take1Props): JSX.Element {

function Take1(): JSX.Element {
  renderCounter("take1");
  const [urlObj, urlObjUpdater] = React.useState<string>("");
  const [urlError, setUrlError] = React.useState<string>("");
  const [loadedPosts, setLoadedPosts] = React.useState<object>({});
  log("before url change handler");

  function urlChangeHandler({
    target: { value: url },
  }: React.ChangeEvent<HTMLInputElement>) {
    log("urlchangeHandler");
    if (isValidUrl(url)) {
      urlObjUpdater(url);
      return;
    }
    if (!url) return;
    setUrlError("invalid url");
  }
  log("beforeuseEffectr");

  useEffect(() => {
    useEffectVariableCounter++;
    console.log("use effect execution ", useEffectVariableCounter);
    if (isValidUrl(urlObj)) {
      log("isValidUrl");
      fetchInfo(urlObj).then(
        (fetchInfo: object) => {
          console.log(fetchInfo, "fetchInfo");
          setLoadedPosts(fetchInfo);
        },
        (e: ErrorResponse) => {
          setLoadedPosts({});
          setUrlError(`${e}`);
        }
      );
    }
  }, [urlObj]);
  log("post useEffectr");

  return (
    <div className="flex items-center justify-center h-screen">
      <div className="grid grid-cols-3 gap-4 p-4 bg-gray-200 rounded-md shadow-lg">
        <div className="col-span-3 border-solid border-2 rounded-sm border-black text-center py-2">
          Valid Url checkers
        </div>
        <div className="col-span-2 flex flex-col justify-center items-center">
          <label className="mb-2">Enter URL:</label>
          <input
            className="w-full border-solid border-2 rounded-sm border-black p-2"
            type="text"
            placeholder="Enter URL"
            onChange={urlChangeHandler}
          />
          <p className="text-red-500">{urlError}</p>
        </div>
        <div className="col-span-1 border-solid border-2 rounded-sm border-black">
          {/* Additional styling for input if needed */}
        </div>
        <div className="col-span-3 border-solid border-2 rounded-sm border-black mt-4">
          <ul>
            {/* {loadedPosts.map((p: any) => (
              <li key={p.id} className="py-2 px-4 border-b border-gray-300">
                {p.title}
              </li>
            ))} */}
            {"loadedPosts" || console.log(loadedPosts, "------")}
          </ul>
        </div>
      </div>
      {!log("end of jsx") ? null : null}
    </div>
  );
}
function isEmpty(obj: any): boolean {
  if (!obj) return true;
  return false;
}

const isValidUrl = (urlString: string) => {
  if (isEmpty(urlString)) return false;
  const urlPattern = new RegExp(
    "^(https?:\\/\\/)?" + // validate protocol
      "((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|" + // validate domain name
      "((\\d{1,3}\\.){3}\\d{1,3}))" + // validate OR ip (v4) address
      "(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*" + // validate port and path
      "(\\?[;&a-z\\d%_.~+=-]*)?" + // validate query string
      "(\\#[-a-z\\d_]*)?$",
    "i"
  ); // validate fragment locator
  return !!urlPattern.test(urlString);
};
function log(str: string, obj?: any): undefined {
  if (obj) console.log(str, obj);
  console.log(str);
}

// function Take1(): JSX.Element {
//   renderCounter("take1");
//   const [urlObj, urlObjUpdater] = React.useState<{ url: string; error: any }>({
//     url: "",
//     error: "",
//   });
//   const [loadedPosts, setLoadedPosts] = React.useState<object>({});

//   function urlChangeHandler({
//     target: { value: url },
//   }: React.ChangeEvent<HTMLInputElement>) {
//     urlObjUpdater((s) => ({ ...s, url: url }));
//   }

//   useEffect(() => {
//     useEffectVariableCounter++;
//     console.log("use effect execution ", useEffectVariableCounter);
//     console.log("urlObj", urlObj);
//     if (isValidUrl(urlObj.url)) {
//       fetchInfo(urlObj.url).then(
//         (fetchInfo: object) => {
//           console.log(fetchInfo, "fetchInfo");
//           setLoadedPosts(fetchInfo);
//         },
//         (e: ErrorResponse) => {
//           // setUrlError(`Error Loading Post${e}`)
//           //   causes rerender change in state
//           setLoadedPosts({});
//           // rerender is pushed to queue
//           // if (!isEmpty(urlObj.url)) {
//           //   throw e;
//           // }
//           urlObjUpdater((s) => ({ ...s, error: `${e}` }));
//         }
//       );
//     }
//   }, [urlObj.url]);

//   return (
//     <div className="flex items-center justify-center h-screen">
//       <div className="grid grid-cols-3 gap-4 p-4 bg-gray-200 rounded-md shadow-lg">
//         <div className="col-span-3 border-solid border-2 rounded-sm border-black text-center py-2">
//           Valid Url checkers
//         </div>
//         <div className="col-span-2 flex flex-col justify-center items-center">
//           <label className="mb-2">Enter URL:</label>
//           <input
//             className="w-full border-solid border-2 rounded-sm border-black p-2"
//             type="text"
//             placeholder="Enter URL"
//             onChange={urlChangeHandler}
//           />
//           <p className="text-red-500">{urlObj.error}</p>
//         </div>
//         <div className="col-span-1 border-solid border-2 rounded-sm border-black">
//           {/* Additional styling for input if needed */}
//         </div>
//         <div className="col-span-3 border-solid border-2 rounded-sm border-black mt-4">
//           <ul>
//             {/* {loadedPosts.map((p: any) => (
//               <li key={p.id} className="py-2 px-4 border-b border-gray-300">
//                 {p.title}
//               </li>
//             ))} */}
//             {"loadedPosts" || console.log(loadedPosts, "------")}
//           </ul>
//         </div>
//       </div>
//     </div>
//   );
// }

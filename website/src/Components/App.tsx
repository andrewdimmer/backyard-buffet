import React, { Fragment } from "react";
import { PictureMode } from "../@Types/types";
import { styles } from "../Styles";
import Camera from "./Camera";
import Info from "./Info";
import NavBar from "./NavBar";
import Upload from "./Upload";
import LoadingScreen from "./LoadingScreen";

const App: React.FunctionComponent = () => {
  const [plant, setPlant] = React.useState<string>("");
  const [mode, setMode] = React.useState<PictureMode>("camera");
  const [loadingMessage, setLoadingMessage] = React.useState<string>("");
  const navbarRef = React.useRef<HTMLDivElement>(null);

  const back = () => {
    setPlant("");
  };

  const toggleMode = () => {
    mode === "camera" ? setMode("upload") : setMode("camera");
  };

  const classes = styles();

  return (
    <Fragment>
      <NavBar
        navbarRef={navbarRef}
        title={plant ? plant : "Backyard Buffet"}
        mode={plant ? undefined : mode}
        back={plant ? back : undefined}
        toggleMode={plant ? undefined : toggleMode}
      />
      {plant ? (
        <Info />
      ) : mode === "camera" ? (
        <Camera
          navbarRef={navbarRef}
          setLoadingMessage={setLoadingMessage}
          classes={classes}
        />
      ) : (
        <Upload setLoadingMessage={setLoadingMessage} classes={classes} />
      )}
      <LoadingScreen loadingMessage={loadingMessage} />
    </Fragment>
  );
};

export default App;

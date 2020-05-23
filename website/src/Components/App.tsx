import React, { Fragment } from "react";
import { PictureMode, PlantKeys } from "../@Types/types";
import { styles } from "../Styles";
import Camera from "./Camera";
import Info from "./Info";
import NavBar from "./NavBar";
import Upload from "./Upload";
import LoadingScreen from "./LoadingScreen";

const App: React.FunctionComponent = () => {
  const [plantKey, setPlantKeys] = React.useState<PlantKeys>(undefined);
  const [mode, setMode] = React.useState<PictureMode>("camera");
  const [loadingMessage, setLoadingMessage] = React.useState<string>("");
  const navbarRef = React.useRef<HTMLDivElement>(null);

  const back = () => {
    setPlantKeys(undefined);
  };

  const toggleMode = () => {
    mode === "camera" ? setMode("upload") : setMode("camera");
  };

  const classes = styles();

  return (
    <Fragment>
      <NavBar
        navbarRef={navbarRef}
        title={plantKey ? plantKey : "Backyard Buffet"}
        mode={plantKey ? undefined : mode}
        back={plantKey ? back : undefined}
        toggleMode={plantKey ? undefined : toggleMode}
      />
      {plantKey ? (
        <Info plantKey={plantKey} />
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

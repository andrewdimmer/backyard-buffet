import { Button, Container, Fab, Typography } from "@material-ui/core";
import CameraAltIcon from "@material-ui/icons/CameraAlt";
import FlipCameraIcon from "@material-ui/icons/FlipCameraAndroid";
import React, { Fragment } from "react";
import Webcam from "react-webcam";
import { PlantKeys } from "../@Types/types";
import { predictPlant } from "../Scripts/tensorflow";

declare interface CameraProps {
  navbarRef: React.RefObject<HTMLDivElement>;
  setPlantKey: (plantKey: PlantKeys) => void;
  setLoadingMessage: (loadingMessage: string) => void;
  classes: any;
}

const Camera: React.FunctionComponent<CameraProps> = ({
  navbarRef,
  setPlantKey,
  setLoadingMessage,
  classes,
}) => {
  const [maxWidth, setMaxWidth] = React.useState<number>(0);
  const [maxHeight, setMaxHeight] = React.useState<number>(0);
  const screenWidth = React.useRef<HTMLDivElement>(null);
  const screenHeight = React.useRef<HTMLDivElement>(null);
  const webcamRef = React.useRef<any>(null);
  const takePictureRef = React.useRef<HTMLDivElement>(null);
  const [deviceId, setDeviceId] = React.useState<string>("");
  const [devices, setDevices] = React.useState<MediaDeviceInfo[]>([]);
  const [webcamEnabled, setWebcamEnabled] = React.useState<boolean>(true);

  const capture = () => {
    setLoadingMessage("Analyzing Image...");
    const imageSrc = webcamRef.current?.getScreenshot();
    (document.getElementById("automlImage") as HTMLImageElement).src = imageSrc;
    setTimeout(
      () =>
        predictPlant()
          .then((prediction) => setPlantKey(prediction))
          .catch((err) => console.log(err))
          .finally(() => setLoadingMessage("")),
      10
    );
  };

  const handleDevices = React.useCallback(
    (mediaDevices: MediaDeviceInfo[]) => {
      const filteredDevices = mediaDevices.filter(
        ({ kind }) => kind === "videoinput"
      );
      setDeviceId(filteredDevices[0].deviceId);
      setDevices(filteredDevices);
    },
    [setDevices]
  );

  const nextCamera = (deviceId: string) => {
    if (deviceId !== "") {
      for (let i = 0; i < devices.length; i++) {
        if (deviceId === devices[i].deviceId) {
          setDeviceId(devices[(i + 1) % devices.length].deviceId);
          break;
        }
      }
    }
  };

  React.useEffect(() => {
    navigator.mediaDevices.enumerateDevices().then(handleDevices);
  }, [handleDevices]);

  const computeWidthAndHeight = () => {
    if (
      screenWidth.current &&
      screenHeight.current &&
      navbarRef.current &&
      takePictureRef.current &&
      (screenWidth.current.clientWidth !== maxWidth ||
        screenHeight.current.clientHeight !== maxHeight)
    ) {
      setMaxHeight(
        screenHeight.current.clientHeight -
          navbarRef.current.clientHeight -
          takePictureRef.current.clientHeight -
          4
      );
      setMaxWidth(screenWidth.current.clientWidth);
    }
  };

  const initializeSize = () => {
    computeWidthAndHeight();
    window.addEventListener("resize", () => {
      setTimeout(computeWidthAndHeight, 1);
    });
  };

  return (
    <Fragment>
      <div
        ref={screenWidth}
        style={{
          width: "100%",
          height: 0,
          position: "absolute",
          top: 0,
          left: 0,
        }}
      />
      <div
        ref={screenHeight}
        style={{
          width: 0,
          height: "100%",
          position: "absolute",
          top: 0,
          left: 0,
        }}
      />
      {webcamEnabled ? (
        <Fragment>
          <Webcam
            audio={false}
            width={maxWidth}
            height={maxHeight}
            onUserMediaError={() => {
              setWebcamEnabled(false);
            }}
            ref={webcamRef}
            videoConstraints={{
              aspectRatio: maxWidth / (maxHeight - 1),
              deviceId,
            }}
          />
          <Container className={classes.pageTitle} ref={takePictureRef}>
            <Button
              color="primary"
              variant="contained"
              startIcon={<CameraAltIcon />}
              onClick={capture}
            >
              Take Picture
            </Button>
          </Container>
          {devices.length > 1 && (
            <Fab
              aria-label="flip-camera"
              className={classes.fab}
              color="primary"
              onClick={() => nextCamera(deviceId)}
            >
              <FlipCameraIcon />
            </Fab>
          )}
        </Fragment>
      ) : (
        <Container className={classes.pageTitle}>
          <Typography variant="h3">
            Please grant access to a camera for this feature to work.
          </Typography>
        </Container>
      )}
      {setTimeout(initializeSize, 1) && <Fragment />}
    </Fragment>
  );
};

export default Camera;

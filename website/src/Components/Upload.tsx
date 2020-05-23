import { Container, Typography } from "@material-ui/core";
import { DropzoneArea } from "material-ui-dropzone";
import React, { Fragment } from "react";
import { PlantKeys } from "../@Types/types";
import { predictPlant } from "../Scripts/tensorflow";

declare interface UploadProps {
  setPlantKey: (plantKey: PlantKeys) => void;
  setLoadingMessage: (loadingMessage: string) => void;
  classes: any;
}

const Upload: React.FunctionComponent<UploadProps> = ({
  setPlantKey,
  setLoadingMessage,
  classes,
}) => {
  const getBase64 = (file: File) => {
    return new Promise<string>((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => {
        let encoded = reader.result?.toString();
        resolve(encoded);
      };
      reader.onerror = (error) => reject(error);
    });
  };

  return (
    <Fragment>
      <Container>
        <Container className={classes.pageTitle}>
          <Typography variant="h3">Upload a Photo</Typography>
        </Container>
        <DropzoneArea
          acceptedFiles={["image/*"]}
          filesLimit={1}
          maxFileSize={5000000}
          showPreviewsInDropzone={false}
          onDrop={async (files: any) => {
            setLoadingMessage("Analyzing Image...");
            const imageSrc = await getBase64(files[0]);
            (document.getElementById(
              "automlImage"
            ) as HTMLImageElement).src = imageSrc;
            setTimeout(
              () =>
                predictPlant()
                  .then((prediction) => setPlantKey(prediction))
                  .catch((err) => console.log(err))
                  .finally(() => setLoadingMessage("")),
              10
            );
          }}
        />
      </Container>
    </Fragment>
  );
};

export default Upload;

import { Container, Typography } from "@material-ui/core";
import { DropzoneArea } from "material-ui-dropzone";
import React, { Fragment } from "react";
import { predictPlant } from "../Scripts/tensorflow";

declare interface UploadProps {
  classes: any;
}

const Upload: React.FunctionComponent<UploadProps> = ({ classes }) => {
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
            const imageSrc = await getBase64(files[0]);
            (document.getElementById(
              "automlImage"
            ) as HTMLImageElement).src = imageSrc;
            setTimeout(
              () =>
                predictPlant()
                  .then((prediction) => console.log(prediction))
                  .catch((err) => console.log(err)),
              10
            );
          }}
        />
      </Container>
    </Fragment>
  );
};

export default Upload;

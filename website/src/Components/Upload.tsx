import { DropzoneArea } from "material-ui-dropzone";
import React, { Fragment } from "react";
import { Container, Typography } from "@material-ui/core";

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
            console.log(await getBase64(files[0]));
          }}
        />
      </Container>
    </Fragment>
  );
};

export default Upload;

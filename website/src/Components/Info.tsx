import React, { Fragment } from "react";
import { PlantKeysCertian } from "../@Types/types";

declare interface InfoProps {
  plantKey: PlantKeysCertian;
}

const Info: React.FunctionComponent<InfoProps> = ({ plantKey }) => {
  return <Fragment>plantKey</Fragment>;
};

export default Info;

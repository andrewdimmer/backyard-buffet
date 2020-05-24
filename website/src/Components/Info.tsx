import {
  Avatar,
  Container,
  Grid,
  List,
  ListItem,
  ListItemAvatar,
  ListItemText,
  Typography,
} from "@material-ui/core";
import CheckCircleIcon from "@material-ui/icons/CheckCircle";
import ErrorIcon from "@material-ui/icons/Error";
import InfoIcon from "@material-ui/icons/Info";
import WarningIcon from "@material-ui/icons/Warning";
import React, { Fragment } from "react";
import { PlantKeysCertian } from "../@Types/types";
import { getPlantInfo } from "../Scripts/data";

declare interface InfoProps {
  plantKey: PlantKeysCertian;
  classes: any;
}

const Info: React.FunctionComponent<InfoProps> = ({ plantKey, classes }) => {
  const plantInfo = getPlantInfo(plantKey);
  console.log(plantKey);
  console.log(plantInfo);

  const safetyInfo = (safe: boolean, forString: string) => {
    if (safe) {
      return (
        <Container className={classes.pageTitle}>
          <CheckCircleIcon color="primary" fontSize="large" />
          <Typography variant="h4">Safe for {forString}</Typography>
        </Container>
      );
    } else {
      return (
        <Container className={classes.pageTitle}>
          <WarningIcon color="error" fontSize="large" />
          <Typography variant="h4">Toxic to {forString}</Typography>
        </Container>
      );
    }
  };

  return (
    <Fragment>
      <Container className={classes.pageTitle}>
        <Typography variant="h3">{plantInfo.title}</Typography>
      </Container>
      <Container>
        {plantInfo.safeForHumans !== undefined &&
          plantInfo.safeForPets !== undefined && (
            <Grid container alignContent="center">
              <Grid item xs={6}>
                {safetyInfo(plantInfo.safeForHumans, "Humans")}
              </Grid>
              <Grid item xs={6}>
                {safetyInfo(plantInfo.safeForPets, "Pets")}
              </Grid>
            </Grid>
          )}
        {plantInfo.funFacts && (
          <Fragment>
            <Typography variant="h5">Fun Facts:</Typography>
            <List>
              {plantInfo.funFacts.map((value, index) => (
                <ListItem key={"funFact_" + index}>
                  <ListItemAvatar>
                    <Avatar className={classes.infoColor}>
                      <InfoIcon />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText primary={value} />
                </ListItem>
              ))}
            </List>
          </Fragment>
        )}
        {plantInfo.partsSafeToEat && (
          <Fragment>
            <Typography variant="h5">
              Parts of the Plant that are Safe to Eat:
            </Typography>
            <List>
              {plantInfo.partsSafeToEat.map((value, index) => (
                <ListItem key={"safeToEat_" + index}>
                  <ListItemAvatar>
                    <Avatar className={classes.successColor}>
                      <CheckCircleIcon />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText primary={value} />
                </ListItem>
              ))}
            </List>
          </Fragment>
        )}
        {plantInfo.usedAsFood && (
          <Fragment>
            <Typography variant="h5">Used as Food:</Typography>
            <List>
              {plantInfo.usedAsFood.map((value, index) => (
                <ListItem key={"usedAsFood_" + index}>
                  <ListItemAvatar>
                    <Avatar className={classes.infoColor}>
                      <InfoIcon />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText primary={value} />
                </ListItem>
              ))}
            </List>
          </Fragment>
        )}
        {plantInfo.howToEat && (
          <Fragment>
            <Typography variant="h5">How to Eat:</Typography>
            <List>
              {plantInfo.howToEat.map((value, index) => (
                <ListItem key={"howToEat_" + index}>
                  <ListItemAvatar>
                    <Avatar className={classes.successColor}>
                      <CheckCircleIcon />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText primary={value} />
                </ListItem>
              ))}
            </List>
          </Fragment>
        )}
        {plantInfo.vitalNutrients && (
          <Fragment>
            <Typography variant="h5">Vital Nutrients:</Typography>
            <List>
              {plantInfo.vitalNutrients.map((value, index) => (
                <ListItem key={"vitalNutrients_" + index}>
                  <ListItemAvatar>
                    <Avatar className={classes.successColor}>
                      <CheckCircleIcon />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText primary={value} />
                </ListItem>
              ))}
            </List>
          </Fragment>
        )}
        {plantInfo.healthBenefits && (
          <Fragment>
            <Typography variant="h5">Possible Heath Benefits:</Typography>
            <List>
              {plantInfo.healthBenefits.map((value, index) => (
                <ListItem key={"healthBenefits_" + index}>
                  <ListItemAvatar>
                    <Avatar className={classes.successColor}>
                      <CheckCircleIcon />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText primary={value} />
                </ListItem>
              ))}
            </List>
          </Fragment>
        )}
        {plantInfo.sideEffects && (
          <Fragment>
            <Typography variant="h5">Possible Side Effects:</Typography>
            <List>
              {plantInfo.sideEffects.map((value, index) => (
                <ListItem key={"sideEffects_" + index}>
                  <ListItemAvatar>
                    <Avatar className={classes.warningColor}>
                      <ErrorIcon />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText primary={value} />
                </ListItem>
              ))}
            </List>
          </Fragment>
        )}
        {plantInfo.recipes && (
          <Fragment>
            <Typography variant="h5">Recipes:</Typography>
            <List>
              {plantInfo.recipes.map((value, index) => (
                <ListItem key={"recipes_" + index}>
                  <ListItemAvatar>
                    <Avatar className={classes.infoColor}>
                      <InfoIcon />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText
                    primary={value.label}
                    secondary={
                      <a href={value.link} target="_blank">
                        Click Here to View the Recipe
                      </a>
                    }
                  />
                </ListItem>
              ))}
            </List>
          </Fragment>
        )}
        {plantInfo.errorMessage && (
          <Typography variant="h5">{plantInfo.errorMessage}</Typography>
        )}
        {plantInfo.plantsToTry && (
          <List>
            {plantInfo.plantsToTry.map((value, index) => (
              <ListItem key={"plantsToTry_" + index}>
                <ListItemAvatar>
                  <Avatar className={classes.successColor}>
                    <CheckCircleIcon />
                  </Avatar>
                </ListItemAvatar>
                <ListItemText primary={value} />
              </ListItem>
            ))}
          </List>
        )}
      </Container>
    </Fragment>
  );
};

export default Info;

import * as automl from "@tensorflow/tfjs-automl";
import { PlantKeysCertian } from "../@Types/types";

let model: automl.ImageClassificationModel | null = null;

const initializeTensorFlowModel = async () => {
  model = await automl.loadImageClassification(
    "./assets/tensorflow/model.json"
  );
};

initializeTensorFlowModel();

export const predictPlant = async () => {
  if (model) {
    const results = await model.classify(
      document.getElementById("automlImage") as HTMLImageElement
    );
    let maxIndex = 0;
    for (let i = 0; i < results.length; i++) {
      if (results[i].prob > results[maxIndex].prob) {
        maxIndex = i;
      }
    }
    return results[maxIndex].label as PlantKeysCertian;
  } else {
    return undefined;
  }
};

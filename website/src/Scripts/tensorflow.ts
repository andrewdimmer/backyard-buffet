import * as automl from "@tensorflow/tfjs-automl";

let model: automl.ImageClassificationModel | null = null;

const initializeTensorFlowModel = async () => {
  model = await automl.loadImageClassification(
    "./assets/tensorflow/model.json"
  );
};

initializeTensorFlowModel();

export const predictPlant = () =>
  model
    ? model.classify(document.getElementById("automlImage") as HTMLImageElement)
    : new Promise<automl.ImagePrediction[]>((resolve, reject) => resolve([]));

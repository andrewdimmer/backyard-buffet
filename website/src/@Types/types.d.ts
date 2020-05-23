export declare type PictureMode = "camera" | "upload";

export declare type PlantKeysCertian =
  | "Hosta"
  | "None_of_the_above"
  | "Bloodroot"
  | "English_ivy"
  | "Dandelion";

export declare type PlantKeys = PlantKeysCertian | undefined;

export declare type PlantData = { [key: string]: PlantInfo };

export declare interface PlantInfo {
  title: string;
  safeForHumans?: boolean;
  safeForPets?: boolean;
  funFacts?: string[];
  partsSafeToEat?: string[];
  usedAsFood?: string[];
  howToEat?: string[];
  vitalNutrients?: string[];
  healthBenefits?: string[];
  sideEffects?: string[];
  recipes?: { label: string; link: string }[];
  errorMessage?: string;
  plantsToTry?: string[];
}

getPlantInfo(key) {
  if (key.indexOf("Dandelion") >= 0) {
    return {
      "title": "Dandelion",
      "safeForHumans": true,
      "safeForPets": true,
      "funFacts": [
        "Over 60 different types",
        "Used as medicine, until about 100 years ago",
      ],
      "usedAsFood": [
        "Since prehistoric times",
        "Typically in Eastern Europe and Eastern Asia",
      ],
      "partsSafeToEat": ["Roots", "Stems", "Leaves", "Flowers", "Puffy seeds"],
      "howToEat": [
        "Raw leaves in a salad",
        "Cooked leaves, like spinach",
        "Dandelion wine from flower petals",
        "Roots ground up and roasted, brewed like tea or coffee",
      ],
      "vitalNutrients": [
        "Vitamin A",
        "Vitamin C",
        "Vitamin K",
        "Calcium",
        "Potassium",
        "Iron",
        "Manganese",
      ],
      "healthBenefits": [
        "Builds strong bones",
        "Maintains a healthy liver",
        "Fights diabetes",
        "Maintains healthy skin",
        "Prevents jaundice",
        "Helps with blood circulation",
        "Helps with regular digestion ",
        "Fights inflammation",
        "Reduces cholesterol",
        "Lowers blood pressure",
        "Boosts immune system",
      ],
      "sideEffects": ["Possible allergy to pollen", "Possible rash from sap"],
      "recipes": [
        {
          "label": "Dandelion Salad With Garlic Confit Dressing",
          "link":
              "http://www.nytimes.com/2011/10/19/dining/dandelion-salad-with-garlic-confit-dressing-recipe.html?_r=0",
        },
        {
          "label": "Dandelion Tea",
          "link":
              "http://www.justapinch.com/recipes/drink/hot-drink/dandelion-tea.html",
        },
        {
          "label": "Italian Style Dandelion Greens",
          "link":
              "http://crabappleherbs.com/blog/2007/05/22/dandelion-recipes-italian-style-greens/",
        },
        {
          "label": "Dandelion Pesto",
          "link":
              "http://www.davidlebovitz.com/2011/03/dandelion-pesto-recipe/",
        },
        {
          "label": "Dandelion Fritters",
          "link": "http://www.learningherbs.com/dandelion_recipes.html",
        },
        {
          "label": "Dandelion Blossom Cake",
          "link": "http://thegardenersrake.com/57",
        },
        {
          "label": "Spiced Dandelion Wine",
          "link":
              "https://www.organicauthority.com/juicy-spirits/homemade-dandelion-wine.html",
        },
        {
          "label": "Dandelion Root Zucchini Cake",
          "link":
              "http://www.veggiedelight.ca/2011/05/dandelion-root-zucchini-cake.html",
        },
        {
          "label": "Dandelion Root Coffee",
          "link": "http://www.elanaspantry.com/dandelion-root-coffee/",
        },
        {
          "label": "Immunity Boosting Soup",
          "link": "http://www.marthastewart.com/342128/immunity-boosting-soup",
        },
      ],
    };
  } else if (key.indexOf("Hosta") >= 0) {
    return {
      "title": "Hosta",
      "safeForHumans": true,
      "safeForPets": false,
      "funFacts": ["Over 40 different types"],
      "usedAsFood": [
        "Originally from eastern Asia",
        "Eaten in Japan for hundreds of years",
      ],
      "partsSafeToEat": ["Roots", "Stems", "Leaves", "Flowers"],
      "howToEat": [
        "Raw young leaves in a salad",
        "Cooked older leaves, like spinach",
        "Stalks before the leaves unroll, eat like asparagus",
      ],
      "vitalNutrients": [
        "Calcium",
        "Phosphorus",
        "Potassium",
        "Iron",
        "Magnesium",
        "Manganese",
        "Zinc",
      ],
      "healthBenefits": [
        "Maintains healthy skin",
        "Builds strong bones",
        "Maintains a healthy liver",
      ],
      "sideEffects": [
        "Toxic to dogs, cats, and horses: will cause vomiting and diarrhea",
      ],
      "recipes": [
        {
          "label": "Bacon Wrapped Hosta Shoots",
          "link": "https://learningandyearning.com/bacon-wrapped-hosta-shoots/",
        },
        {
          "label": "Hosta Shoots Salad with A Balsamic Reduction",
          "link":
              "https://barbaraprice.wordpress.com/2011/05/06/eat-shoots-and-leaves/",
        },
        {
          "label": "Pan Seared Hosta Shoots with Ramp Butter",
          "link": "http://foragerchef.com/eating-hosta-shoots/",
        },
        {
          "label": "Hostas with Prosciutto and Pesto",
          "link": "http://blog.gardeners.com/2014/02/eating-hosta-shoots/",
        },
        {
          "label": "Midwestern Vignarola",
          "link": "http://foragerchef.com/midwestern-vignarola-2017/",
        },
      ],
    };
  } else if (key.indexOf("English_ivy") >= 0) {
    return {
      "title": "English Ivy",
      "safeForHumans": false,
      "safeForPets": false,
      "sideEffects": [
        "Stomach cramps",
        "Vomiting",
        "Diarrhea",
        "Allergic skin reaction",
      ],
    };
  } else if (key.indexOf("Bloodroot") >= 0) {
    return {
      "title": "Bloodroot",
      "safeForHumans": false,
      "safeForPets": false,
      "funFacts": [
        "Originally found only in the eastern part of the U.S. and Canada",
        "Named Bloodroot because the sap from stem and roots is deep red",
      ],
      "sideEffects": [
        "Burns from touching the sap (especially from the roots)"
      ],
    };
  } else {
    return {
      "title": "Plant Not Found",
      "errorMessage":
          "Unfortunatly, due to time and training cost constraints, the plant you scanned is not recognized. Please try scanning one of the following supported plants:",
      "plantsToTry": ["Dandelion", "Hosta", "English Ivy", "Bloodroot"],
    };
  }
}

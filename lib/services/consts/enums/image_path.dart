enum ImagePath { Cancer, Kaigaramushi, Powder }

extension ImagePathExtension on ImagePath {
  static const imagePathValues = {
    ImagePath.Cancer: "assets/cancer.png",
    ImagePath.Kaigaramushi: "assets/kaigaramushi_1.png",
    ImagePath.Powder: "assets/powder.png",
  };

  String get value => imagePathValues[this];
}

const identityImagePathMap = {
  "cochineal": ImagePath.Kaigaramushi,
  "nitrous acid": ImagePath.Cancer,
  "chemical protein": ImagePath.Powder,
};

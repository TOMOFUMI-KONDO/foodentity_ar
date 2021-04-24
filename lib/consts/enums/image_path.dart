enum IdentityImage { Cancer, Kaigaramushi, Powder }

extension IdentityImageExtension on IdentityImage {
  static const identityImageValues = {
    IdentityImage.Cancer: "cancer.png",
    IdentityImage.Kaigaramushi: "kaigaramushi_1.png",
    IdentityImage.Powder: "powder.png",
  };

  String get value => identityImageValues[this];
}

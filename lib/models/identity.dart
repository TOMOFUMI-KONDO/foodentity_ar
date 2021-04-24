import 'package:foodentity_ar/consts/enums/image_path.dart';

/// 食品の正体(特徴的な原材料)
class Identity {
  Identity(this.name);

  Identity.fromName(String name) {
    this.name = name;
  }

  static const _mapIdentity = {
    "cochineal": {
      "image": IdentityImage.Kaigaramushi,
      "description": "赤色の着色料。サボテンに寄生する「コチニールカイガラムシ」から作られる。",
      "jpName": "コチニール色素",
    },
    "nitrous acid": {
      "image": IdentityImage.Cancer,
      "description": "発色剤として用いられる。発癌性がある。",
      "jpName": "亜硝酸塩"
    },
    "chemical protein": {
      "image": IdentityImage.Powder,
      "description": "低質で安価な原材料から作られた、人工タンパク質。",
      "jpName": "人工タンパク質"
    },
  };

  String name;
  IdentityImage get image => _mapIdentity[name]["image"];
  String get description => _mapIdentity[name]["description"];
  String get jpName => _mapIdentity[name]["jpName"];
}

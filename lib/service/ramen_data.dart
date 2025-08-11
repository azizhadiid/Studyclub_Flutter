import 'package:flutter_app/model/ramen_model.dart';

List<RamenModel> getRamen() {
  List<RamenModel> ramen = [];
  RamenModel ramenModel = RamenModel();

  ramenModel.name = "Cheese ramen";
  ramenModel.image = "lotties/Ramen.json";
  ramenModel.price = "50";
  ramen.add(ramenModel);
  ramenModel = RamenModel();

  ramenModel.name = "Chees";
  ramenModel.price = "50";
  ramenModel.image = "lotties/Ramen.json";
  ramen.add(ramenModel);
  ramenModel = RamenModel();

  ramenModel.name = "Chees";
  ramenModel.price = "50";
  ramenModel.image = "lotties/Ramen.json";
  ramen.add(ramenModel);
  ramenModel = RamenModel();

  ramenModel.name = "Chees";
  ramenModel.price = "50";
  ramenModel.image = "lotties/Ramen.json";
  ramen.add(ramenModel);
  ramenModel = RamenModel();

  return ramen;
}

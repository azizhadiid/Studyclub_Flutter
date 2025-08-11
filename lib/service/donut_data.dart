import 'package:flutter_app/model/donut_model.dart';

List<DonutModel> getDonut() {
  List<DonutModel> donut = [];
  DonutModel donutModel = DonutModel();

  donutModel.name = "Cheese donut";
  donutModel.image = "lotties/Donut.json";
  donutModel.price = "50";
  donut.add(donutModel);
  donutModel = DonutModel();

  donutModel.name = "Chees";
  donutModel.price = "50";
  donutModel.image = "lotties/Donut.json";
  donut.add(donutModel);
  donutModel = DonutModel();

  donutModel.name = "Chees";
  donutModel.price = "50";
  donutModel.image = "lotties/Donut.json";
  donut.add(donutModel);
  donutModel = DonutModel();

  donutModel.name = "Chees";
  donutModel.price = "50";
  donutModel.image = "lotties/Donut.json";
  donut.add(donutModel);
  donutModel = DonutModel();

  return donut;
}

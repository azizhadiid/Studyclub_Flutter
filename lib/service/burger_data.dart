import 'package:flutter_app/model/burger_model.dart';

List<BurgerModel> getBurger() {
  List<BurgerModel> burger = [];
  BurgerModel burgerModel = BurgerModel();

  burgerModel.name = "Cheese burger";
  burgerModel.image = "lotties/Burger.json";
  burgerModel.price = "50";
  burger.add(burgerModel);
  burgerModel = BurgerModel();

  burgerModel.name = "Chees";
  burgerModel.price = "50";
  burgerModel.image = "lotties/Burger.json";
  burger.add(burgerModel);
  burgerModel = BurgerModel();

  burgerModel.name = "Chees";
  burgerModel.price = "50";
  burgerModel.image = "lotties/Burger.json";
  burger.add(burgerModel);
  burgerModel = BurgerModel();

  burgerModel.name = "Chees";
  burgerModel.price = "50";
  burgerModel.image = "lotties/Burger.json";
  burger.add(burgerModel);
  burgerModel = BurgerModel();

  return burger;
}

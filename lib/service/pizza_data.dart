import 'package:flutter_app/model/pizza_model.dart';

List<PizzaModel> getPizza() {
  List<PizzaModel> pizza = [];
  PizzaModel pizzaModel = PizzaModel();

  pizzaModel.name = "Cheese Pizza";
  pizzaModel.image = "lotties/Pizza.json";
  pizzaModel.price = "50";
  pizza.add(pizzaModel);
  pizzaModel = PizzaModel();

  pizzaModel.name = "Chees";
  pizzaModel.price = "50";
  pizzaModel.image = "lotties/Pizza.json";
  pizza.add(pizzaModel);
  pizzaModel = PizzaModel();

  pizzaModel.name = "Chees";
  pizzaModel.price = "50";
  pizzaModel.image = "lotties/Pizza.json";
  pizza.add(pizzaModel);
  pizzaModel = PizzaModel();

  pizzaModel.name = "Chees";
  pizzaModel.price = "50";
  pizzaModel.image = "lotties/Pizza.json";
  pizza.add(pizzaModel);
  pizzaModel = PizzaModel();

  return pizza;
}

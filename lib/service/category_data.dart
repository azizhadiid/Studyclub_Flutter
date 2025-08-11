import 'package:studyclubapp/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  CategoryModel categoryModel = CategoryModel();

  categoryModel.name = "Pizza";
  categoryModel.image = "lotties/Pizza.json";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.name = "Donut";
  categoryModel.image = "lotties/Donut.json";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.name = "Burger";
  categoryModel.image = "lotties/Burger.json";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.name = "Ramen";
  categoryModel.image = "lotties/Ramen.json";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}

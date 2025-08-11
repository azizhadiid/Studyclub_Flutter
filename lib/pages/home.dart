import 'package:flutter/material.dart';
import 'package:studyclubapp/model/burger_model.dart';
import 'package:studyclubapp/model/category_model.dart';
import 'package:studyclubapp/model/donut_model.dart';
import 'package:studyclubapp/model/pizza_model.dart';
import 'package:studyclubapp/model/ramen_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<PizzaModel> pizza = [];
  List<DonutModel> donut = [];
  List<BurgerModel> burger = [];
  List<RamenModel> ramen = [];
  String track = "0";

  @override
  void initState() {
    categories = getCategories();
    pizza = getPizza();
    donut = getDonut();
    burger = getBurger();
    ramen = getRamen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          margin: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo dan Teks
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "img/logo.png",
                        height: 40,
                        width: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Order your favorite food!",
                        style: AppWidget.simpleTextFeildStyle(),
                      ),
                    ],
                  ),
                  // Gambar Profil
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "img/man.jpg",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      margin: EdgeInsets.only(right: 20.00),
                      decoration: BoxDecoration(
                        color: Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search...",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.search, color: Colors.white, size: 30.0),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(), // scroll smooth
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return categoryTile(
                      categories[index].name!,
                      categories[index].image!,
                      index.toString(),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              track == "0"
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // karena pakai SingleChildScrollView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: pizza.length,
                      itemBuilder: (context, index) {
                        return foodTile(
                          pizza[index].name!,
                          pizza[index].image!,
                          pizza[index].price!,
                        );
                      },
                    )
                  : track == "1"
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // karena pakai SingleChildScrollView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: donut.length,
                      itemBuilder: (context, index) {
                        return foodTile(
                          donut[index].name!,
                          donut[index].image!,
                          donut[index].price!,
                        );
                      },
                    )
                  : track == "2"
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // karena pakai SingleChildScrollView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: burger.length,
                      itemBuilder: (context, index) {
                        return foodTile(
                          burger[index].name!,
                          burger[index].image!,
                          burger[index].price!,
                        );
                      },
                    )
                  : track == "3"
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // karena pakai SingleChildScrollView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: ramen.length,
                      itemBuilder: (context, index) {
                        return foodTile(
                          ramen[index].name!,
                          ramen[index].image!,
                          ramen[index].price!,
                        );
                      },
                    )
                  : Container(),
              SizedBox(height: 70.0),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for foodTile
  Widget foodTile(String name, String image, String price) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Lottie.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          Text(name, style: AppWidget.boldTextField()),
          Text("\$$price", style: AppWidget.priceTextField()),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xffef2b39),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Icon(Icons.arrow_forward, color: Colors.white, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget for Category Tile
  Widget categoryTile(String name, String image, String categoryindex) {
    return GestureDetector(
      onTap: () {
        track = categoryindex.toString();
        setState(() {});
      },
      child: track == categoryindex
          ? Container(
              margin: EdgeInsets.only(right: 20.0, bottom: 10.0),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Lottie.asset(
                        image,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      Text(name, style: AppWidget.whiteTextFeildStyle()),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(right: 20.0, bottom: 10.0),
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              decoration: BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Lottie.asset(image, height: 40, width: 40, fit: BoxFit.cover),
                  Text(name, style: AppWidget.simpleTextFeildStyle()),
                ],
              ),
            ),
    );
  }
}

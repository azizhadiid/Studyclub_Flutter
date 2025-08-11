import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle headLineTextFeildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle simpleTextFeildStyle() {
    return TextStyle(color: Colors.black, fontSize: 18.0);
  }

  static TextStyle whiteTextFeildStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldTextField() {
    return TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle priceTextField() {
    return TextStyle(
      color: Colors.black38,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );
  }
}

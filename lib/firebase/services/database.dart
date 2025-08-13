import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addStudent(Map<String, dynamic> studentDataMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .set(studentDataMap)
        .catchError((e) {
          print(e.toString());
        });
  }
}

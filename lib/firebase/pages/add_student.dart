import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:studyclubapp/firebase/pages/home_firebase.dart';
import 'package:studyclubapp/firebase/services/database.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Membuat Tombol Kembali
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined),
                ),
                SizedBox(width: 100.0),
                Text(
                  "Add ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Student",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Input field for Student Name
            SizedBox(height: 30.0),
            Text(
              "Student Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 217, 223, 254),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter Student Name",
                  border: InputBorder.none,
                ),
              ),
            ),

            // Input field for Student Age
            SizedBox(height: 30.0),
            Text(
              "Student Age",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 217, 223, 254),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: ageController,
                decoration: InputDecoration(
                  hintText: "Enter Student Age",
                  border: InputBorder.none,
                ),
              ),
            ),

            // Input field for Student Roll No
            SizedBox(height: 30.0),
            Text(
              "Student Roll No",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 217, 223, 254),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: rollNoController,
                decoration: InputDecoration(
                  hintText: "Enter Student Roll No",
                  border: InputBorder.none,
                ),
              ),
            ),

            // Submit Button
            SizedBox(height: 30.0),
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                // Function to add student data
                onPressed: () async {
                  if (nameController.text.isNotEmpty &&
                      ageController.text.isNotEmpty &&
                      rollNoController.text.isNotEmpty) {
                    String addID = randomAlphaNumeric(10);
                    Map<String, dynamic> studentDataMap = {
                      "Name": nameController.text,
                      "Age": ageController.text,
                      "RollNo": rollNoController.text,
                      "Absent": false,
                      "Present": false,
                    };

                    await DatabaseMethods().addStudent(studentDataMap, addID);

                    if (!mounted) return; // pastikan widget masih aktif

                    nameController.clear();
                    ageController.clear();
                    rollNoController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.blue,
                        content: Text(
                          "Student Added Successfully!",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }
                },
                // Button Text
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

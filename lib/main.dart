import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 2, 168, 30),
        ),
      ),
      home: const MyHomePage(title: 'My Study Club Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void dialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Berhasil"),
            content: const Text("data berhasil disimpan"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(
                      4,
                    ), // Jarak antara border dan avatar
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        255,
                        36,
                        42,
                        46,
                      ), // Warna border
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/img/man.jpg'),
                      radius: 70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Text("Nama", style: TextStyle(fontSize: 25)),
            Text(
              "Aziz Alhadiid",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Divider(),
            SizedBox(height: 10.0),
            Text("Phone", style: TextStyle(fontSize: 25)),
            Text(
              "081366705844",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Divider(),
            SizedBox(height: 10.0),
            Text("About", style: TextStyle(fontSize: 25)),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, urna eu tincidunt consectetur, nisi nisl aliquam enim, eget facilisis sem erat nec enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer euismod, nisi eu.",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Divider(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 2, 168, 30),
                ),
                onPressed: () {
                  dialog(context);
                },
                child: Text("Simpan", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          // Aksi ketika menu diklik
          if (index == 0) {
            // ignore: avoid_print
            print("Home clicked");
          } else if (index == 1) {
            // ignore: avoid_print
            print("Profile clicked");
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studyclubapp/data/constans.dart';
import 'package:studyclubapp/data/notifiers.dart';
import 'package:studyclubapp/views/pages/home_page.dart';
import 'package:studyclubapp/views/pages/profile_page.dart';
import 'package:studyclubapp/views/pages/setting_page.dart';
import 'package:studyclubapp/views/widgets/navbar_widgets.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hadezer Mapp'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              isDartkModeNotifier.value = !isDartkModeNotifier.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstants.themeModeKey,
                isDartkModeNotifier.value,
              );
            },
            icon: ValueListenableBuilder(
              valueListenable: isDartkModeNotifier,
              builder: (context, isDartkMode, child) {
                return Icon(isDartkMode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SattingPage(title: 'Settings'),
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (BuildContext context, dynamic selectedPage, Widget? child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}

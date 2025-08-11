import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  int currentTabIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Profile profile;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCubic,
    );

    // Initialize pages
    homepage = Home();
    profile = Profile();

    pages = [homepage, profile];
    currentPage = homepage;

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() {
      currentTabIndex = index;
      currentPage = pages[index];
    });

    // Reset and play animation
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: 0.95 + (_animation.value * 0.05),
            child: Opacity(opacity: _animation.value, child: currentPage),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.1),
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: CurvedNavigationBar(
          height: 70,
          backgroundColor: Colors.transparent,
          color: Color(0xffef2b39),
          buttonBackgroundColor: Color(0xffef2b39),
          animationCurve: Curves.easeInOutCubic,
          animationDuration: Duration(milliseconds: 400),
          index: currentTabIndex,
          items: <Widget>[
            // Home Icon
            Container(
              padding: EdgeInsets.all(8),
              child: Icon(
                currentTabIndex == 0 ? Icons.home : Icons.home_outlined,
                size: 28,
                color: Colors.white,
              ),
            ),
            // Settings Icon
            Container(
              padding: EdgeInsets.all(8),
              child: Icon(
                currentTabIndex == 1 ? Icons.person : Icons.person_outlined,
                size: 28,
                color: Colors.white,
              ),
            ),
            // Profile Icon
            Container(
              padding: EdgeInsets.all(8),
              child: Icon(
                currentTabIndex == 2 ? Icons.settings : Icons.settings_outlined,
                size: 28,
                color: Colors.white,
              ),
            ),
          ],
          onTap: _onTabChanged,
        ),
      ),
    );
  }
}

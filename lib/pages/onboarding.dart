// pages/onboarding.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/service/widget_support.dart';
import 'package:flutter_app/widget/bottom_nav.dart';
import 'package:lottie/lottie.dart';

class OnboardingState extends StatefulWidget {
  const OnboardingState({super.key});

  @override
  State<OnboardingState> createState() => _OnboardingStateState();
}

class _OnboardingStateState extends State<OnboardingState>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    // Start animations
    _fadeController.forward();
    Future.delayed(Duration(milliseconds: 300), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => BottomNav(),
        transitionDuration: Duration(milliseconds: 800),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
                .animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOutCubic,
                  ),
                ),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                children: [
                  // Lottie Animation
                  Hero(
                    tag: 'chef-animation',
                    child: Lottie.asset(
                      'lotties/Chef.json',
                      height: 350,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 30.0),

                  // Main Title
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Color(0xffef2b39), Color(0xffdc143c)],
                    ).createShader(bounds),
                    child: Text(
                      "The Fastest\nFood Delivery",
                      textAlign: TextAlign.center,
                      style: AppWidget.headLineTextFeildStyle().copyWith(
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),

                  // Subtitle
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      "Makanan yang enak hanya ada di sini, lakukanlah pembelian segera!",
                      textAlign: TextAlign.center,
                      style: AppWidget.simpleTextFeildStyle().copyWith(
                        fontSize: 16,
                        height: 1.4,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),

                  // Get Started Button
                  GestureDetector(
                    onTap: _navigateToHome,
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffef2b39), Color(0xffdc143c)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(32.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(239, 43, 57, 0.3),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ayo Mulai!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),

                  // Additional decorative dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Color(0xffef2b39),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

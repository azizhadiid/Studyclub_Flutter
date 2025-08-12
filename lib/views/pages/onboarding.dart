import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:studyclubapp/data/constans.dart';
import 'package:studyclubapp/views/pages/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/belajar.json', height: 400.0),
                SizedBox(height: 20.0),
                Text(
                  'Hadezer Mapp is the way to learn Flutter, period.',
                  style: KTextStyle.descriptionText,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10.0),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: 'Regeister');
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Next'),
                ), // FilledButton

                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

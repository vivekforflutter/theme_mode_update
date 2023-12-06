import 'package:flutter/material.dart';
import 'package:theme_test/light_dark_mode/presentation/home_page.dart';
import '../../main.dart';
import '../../session_manager/session_manager.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var selectedLanguage;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    });
    getUserType();
    super.initState();
  }
  void getUserType() async {
    selectedLanguage = await SessionManager().getString(SessionManager.LANGUAGE);
    MyApp.setLocale(context, selectedLanguage.contains("en") ? const Locale("en","US"): const Locale("th",""));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text("Welcome")
    ));
  }
}

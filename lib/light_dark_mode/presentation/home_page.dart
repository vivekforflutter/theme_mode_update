
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_test/light_dark_mode/provider/theme_provider.dart';
import 'package:theme_test/light_dark_mode/presentation/change_theme_button.dart';
import 'package:theme_test/main.dart';
import 'package:theme_test/session_manager/session_manager.dart';
import '../../localization/localization_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var languageSelected = 0;
  var selectedLanguage;
  var langvalue;


  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text("Theme"),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              getTranslatedValues("get_started").toString(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).iconTheme.color,
              child: const Icon(Icons.accessibility_new_outlined),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).cardColor,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(Icons.access_alarms),
                   SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ),

            Row(children: [
              TextButton(
                  onPressed: () async {
                    setState((){
                      selectedLanguage = "en";
                      langvalue="en";
                    });
                    await SessionManager().setString(SessionManager.LANGUAGE,"en");
                    MyApp.setLocale(context, Locale("en","US"));

                  },
                  child: Text(getTranslatedValues("english").toString())),
              TextButton(
                  onPressed: () async {
                    setState((){
                      selectedLanguage = "th";
                      langvalue="th";
                    });
                    await SessionManager().setString(SessionManager.LANGUAGE,"th");
                    MyApp.setLocale(context, Locale("th",""));

                  },
                  child: Text(getTranslatedValues("Thai").toString())),

            ],)
          ],
        ),
      ),
    );
  }

}

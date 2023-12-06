import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_test/light_dark_mode/provider/theme_provider.dart';
import 'package:theme_test/light_dark_mode/presentation/change_theme_button.dart';
import 'package:theme_test/localization/presentation/choose_language.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              'Hello $text!',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.access_alarms),
                  const SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const ChooseLanguage()));
                      },
                      child: const Text("ChooseLanguage"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

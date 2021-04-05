import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rekur_fluter/pages/splash_screen.dart';
import 'globals/app_themes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // MobileAds.instance.initialize();

  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (context) => AppStateNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Flutter Theming Tutorials',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme, // ThemeData(primarySwatch: Colors.blue),
          darkTheme:
              AppTheme.darkTheme, // ThemeData(primarySwatch: Colors.blue),
          home: SplashScreen(),
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}

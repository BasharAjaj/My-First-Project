import 'package:flutter/material.dart';
import 'package:flutter_application_7/theme/theme.dart';
import 'Component/datamanager.dart';
import 'Pages/home_page.dart';
import 'theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'Pages/favorite_page.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataManager()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ThemeProvider,bool>(
      selector: (context,prof)=>prof.isDarkMode,
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            'faivoretPage': (context) => const FaivoretPage(),
          },
          theme: themeProvider ? darkMode : lightMode,
          home:const HomePage(),
        );
      },
    );
  }
}


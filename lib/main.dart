import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hostel_app/auth/features/presentation/screens/splash_screen/splash_screen.dart';
import 'package:hostel_app/utils/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ZohAppTheme.lightTheme,
      darkTheme: ZohAppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}

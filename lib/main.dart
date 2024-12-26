import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hostel_app/auth/features/presentation/screens/splash_screen/splash_screen.dart';
import 'package:hostel_app/utils/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'api_services/api_provider.dart';
import 'api_services/api_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(
            baseUrl: ApiUtils.baseUrl,
            httpClient: http.Client(),
          ),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ZohAppTheme.lightTheme,
        darkTheme: ZohAppTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}

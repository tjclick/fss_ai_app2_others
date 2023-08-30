import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'modules/history/ticker_hist_detail.dart';
import 'modules/history/search_list_view.dart';
import 'modules/login/models/model_auth.dart';
import 'modules/login/screens/screen_login.dart';
import 'modules/login/screens/screen_register.dart';
import 'modules/login/screens/screen_splash.dart';
import 'modules/login/screens/user_profile.dart';
import 'screens/AnalysisScreen.dart';
import 'screens/HistoryScreen.dart';
import 'screens/HomeScreen.dart';
import 'screens/NewsScreen.dart';

void main() async {
  HttpOverrides.global = NoCheckCertificateHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
      ],
      child: GetMaterialApp(
      title: 'GOOD.AI',
      theme: ThemeData(
        useMaterial3: true,
        //colorScheme: lightColorScheme,
        scaffoldBackgroundColor: Color(0xff292929),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        //colorScheme: darkColorScheme,
        scaffoldBackgroundColor: Color(0xff292929),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      themeMode: ThemeMode.system,
      initialRoute: "/splash",
      getPages: [
        // # DEMO
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/home", page: () => HomeScreen()),
        GetPage(name: "/analysis", page: () => AnalysisScreen()),
        GetPage(name: "/news", page: () => NewsScreen()),
        GetPage(name: "/history", page: () => HistoryScreen()),
        GetPage(name: "/historyDetail", page: () => HistoryDetailView()),
        GetPage(name: "/users", page: () => UserProfile()),

        // Main-Sub Screen
        GetPage(name: "/historyDetail", page: () => HistoryDetailView()),
        GetPage(name: "/historySearch", page: () => SearchListView()),

        // # Login
        GetPage(name: "/login", page: () => LoginScreen()),
        GetPage(name: "/splash", page: () => SplashScreen()),
        GetPage(name: "/register", page: () => RegisterScreen()),

        // # API Test
        //GetPage(name: "/para/:ID4", page: () => PageParaApp()),
      ],
      //home: HomeScreen(),
    ),
    );
  }
}

class NoCheckCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

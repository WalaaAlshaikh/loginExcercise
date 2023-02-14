import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/features/authentication/views/splash_screen/splash_screen.dart';
import 'package:login_excerise/src/features/authentication/views/welcome_screen/welcome_screen.dart';
import 'package:login_excerise/src/features/core/views/dashboard/dashboard.dart';
import 'package:login_excerise/src/repository/auth_repository/auth_repo.dart';
import 'package:login_excerise/src/utils/theme/theme.dart';
import 'package:login_excerise/src/utils/theme/widget_theme/text_theme.dart';

import 'firebase_options.dart';

void main() async {

   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 400),
      theme:ThemeApp.lightMode,
      darkTheme: ThemeApp.darkMode,
      themeMode: ThemeMode.system,
      home: WelcomeScreen(),
    );
  }
}



import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/ui/SplashScreen.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme: ThemeData(
            primarySwatch: defaultColor,
            splashColor: transparent,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/helper/cache_helper.dart';

import 'helper/binding.dart';
import 'helper/constance.dart';
import 'views/root_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool themeIsDark = await CacheHelper.getData("isDark") ?? false;

  runApp(MyApp(themeIsDark));
}

class MyApp extends StatelessWidget {
  final bool themeIsDark;
  MyApp(this.themeIsDark);
  @override
  Widget build(BuildContext context) {
    final isDark =
        WidgetsBinding.instance!.window.platformBrightness == Brightness.dark;
    final initTheme = isDark && themeIsDark ? kDarkTheme : kLightTheme;

    return ThemeProvider(
      initTheme: initTheme,
      builder: (_, myTheme) {
        return GetMaterialApp(
          initialBinding: Binding(),
          debugShowCheckedModeBanner: false,
          title: 'Task',
          theme: myTheme,
          home: RootView(),
        );
      },
    );
  }
}

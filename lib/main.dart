import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/features/onboarding/pages/onboarding.dart';
import 'package:task_management/features/todo/pages/homepage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blue, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return DynamicColorBuilder(
              builder: (lightColorScheme, darkColorScheme) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                scaffoldBackgroundColor: AppConst.kBkDark,
                colorScheme: lightColorScheme ?? defaultLightColorScheme,
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                  colorScheme: darkColorScheme ?? defaultDarkColorScheme,
                  scaffoldBackgroundColor: AppConst.kBkDark,
                  useMaterial3: true),
              themeMode: ThemeMode.dark,
              home: const Homepage(),
            );
          });
        });
  }
}

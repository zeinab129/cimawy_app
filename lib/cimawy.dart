import 'package:cimawy/config/routes/app_router.dart';
import 'package:cimawy/config/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cimawy extends StatelessWidget {
  const Cimawy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          initialRoute: "home",
          onGenerateRoute: (settings) => AppRouter.onGenerate(settings),
        );
      },
    );
  }
}

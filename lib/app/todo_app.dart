import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/di/dependancy_jnjection.dart';
import 'package:todo_app/core/routing/app_routing.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/core/utils/app_strings.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    final isBoarding =
         getIt<CacheHelper>().getData(key: AppStrings.isBoardingVisitedKey);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          onGenerateRoute: appRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialRoute: isBoarding != null
              ? isBoarding == true
                  ? Routes.homeScreen
                  : Routes.onBoardingScreen
              : Routes.onBoardingScreen,
        );
      },
    );
  }
}

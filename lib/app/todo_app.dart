import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/routing/app_routing.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/utils/app_colors.dart';
class TodoApp extends StatelessWidget {
  const TodoApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        onGenerateRoute:appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.backGround),
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/app/todo_app.dart';
import 'package:todo_app/core/database/cache_helper.dart';
import 'package:todo_app/core/routing/app_routing.dart';

import 'core/di/dependancy_jnjection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await getIt<CacheHelper>().init();
  runApp(TodoApp(
    appRouter: AppRouter(),
  ));
}

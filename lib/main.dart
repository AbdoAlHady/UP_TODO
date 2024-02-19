import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/todo_app.dart';
import 'package:todo_app/core/bloc_observer/my_bloc_observer.dart';
import 'package:todo_app/core/database/cache_helper.dart';
import 'package:todo_app/core/routing/app_routing.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_cubit.dart';

import 'core/di/dependancy_jnjection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await getIt<CacheHelper>().init();
  Bloc.observer = MyBlocObserver();
  runApp(BlocProvider(
    create: (context) => getIt<TaskCubit>(),
    child: TodoApp(
      appRouter: AppRouter(),
    ),
  ));
}

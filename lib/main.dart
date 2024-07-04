import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/todo_app.dart';
import 'package:todo_app/core/bloc_observer/my_bloc_observer.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/helpers/permission_handler_helper.dart';
import 'package:todo_app/core/routing/app_routing.dart';
import 'package:todo_app/core/services/local_notification_service.dart';
import 'package:todo_app/core/services/work_manager_service.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_cubit.dart';
import 'core/di/dependancy_jnjection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PermissionHandlerHelper.requestPermission();
  setupGetIt();
  getIt<CacheHelper>().init();
  await Future.wait([
    LocalNotificationService.init(),
    WorkManagerService().init(),
  ]);

  Bloc.observer = MyBlocObserver();
  runApp(BlocProvider(
    create: (context) => getIt<TaskCubit>()..getTasks(),
    child: TodoApp(
      appRouter: AppRouter(),
    ),
  ));
}

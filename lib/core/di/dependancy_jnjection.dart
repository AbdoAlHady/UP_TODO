import 'package:get_it/get_it.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/database/sqflite_helper/sqflite_helper.dart';
import 'package:todo_app/features/authentication/presentaion/cubit/on_boarding_cubit.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Shared Preferances
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
   // Sqflite 
  getIt.registerLazySingleton<SqfliteHelper>(() => SqfliteHelper());
  // OnBoarding Cubit
  getIt.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
  // Task Cubit
  getIt.registerFactory<TaskCubit>(() => TaskCubit());

}

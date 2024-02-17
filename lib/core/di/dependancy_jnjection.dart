import 'package:get_it/get_it.dart';
import 'package:todo_app/core/database/cache_helper.dart';
import 'package:todo_app/features/authentication/presentaion/cubit/on_boarding_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Shared Preferances
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // OnBoarding Cubit
  getIt.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
}

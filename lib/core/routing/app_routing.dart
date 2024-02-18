import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/dependancy_jnjection.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/features/authentication/presentaion/cubit/on_boarding_cubit.dart';
import 'package:todo_app/features/authentication/presentaion/screens/onboarding_screen/on_boarding_screen.dart';
import 'package:todo_app/features/task/presentation/screens/home_screen/home_screen.dart';
import 'package:todo_app/features/task/presentation/screens/tasks_screen/add_task_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OnBoardingCubit>(),
            child: OnBoardingScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.addTaskScreen:
        return MaterialPageRoute(
          builder: (context) => const AddTaskScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

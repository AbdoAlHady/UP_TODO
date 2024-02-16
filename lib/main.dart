import 'package:flutter/material.dart';
import 'package:todo_app/app/todo_app.dart';
import 'package:todo_app/core/routing/app_routing.dart';

void main() {
  runApp(TodoApp(appRouter: AppRouter(),));
}
